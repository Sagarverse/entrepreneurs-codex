import 'package:flutter/foundation.dart';
import '../models/app_models.dart';
import '../data/curriculum.dart';
import '../data/badges.dart';
import '../services/storage_service.dart';

/// Central app state — holds [UserProgress] and the [StorageService] used to
/// persist it. Notifies listeners on every mutation.
class AppState extends ChangeNotifier {
  AppState(this._storage) {
    progress = _storage.loadProgress();
  }

  final StorageService _storage;
  late UserProgress progress;

  // ---------- Lesson lookup ----------

  DailyLesson? lessonForDay(int day) {
    if (day < 1 || day > allLessons.length) return null;
    return allLessons[day - 1];
  }

  DailyLesson? get currentLesson => lessonForDay(progress.currentDay);

  DailyLesson? get nextLesson {
    final next = progress.currentDay + 1;
    if (next > 30) return null;
    return lessonForDay(next);
  }

  // ---------- Day gating ----------

  /// A day is unlocked if it has been completed, or it is the very next day
  /// after the highest completed day (allowing the user to do them in order
  /// without being locked out).
  bool isDayUnlocked(int day) {
    if (day == 1) return true;
    if (progress.completedDays.contains(day)) return true;
    final highestCompleted = progress.completedDays.isEmpty
        ? 0
        : progress.completedDays.reduce((a, b) => a > b ? a : b);
    return day <= highestCompleted + 1;
  }

  // ---------- Mutations ----------

  /// Toggle a single challenge for a day. Recomputes XP and persists.
  Future<void> toggleChallenge(int day, int challengeIndex, bool value) async {
    final lesson = lessonForDay(day);
    if (lesson == null) return;
    if (challengeIndex < 0 || challengeIndex >= lesson.challenges.length) {
      return;
    }

    final list = List<bool>.from(
        progress.challengesCompleted[day] ?? List.filled(lesson.challenges.length, false));
    final wasCompleted = list[challengeIndex];
    if (wasCompleted == value) return;

    list[challengeIndex] = value;
    progress.challengesCompleted[day] = list;

    final points = lesson.challenges[challengeIndex].points;
    progress.totalXp = (progress.totalXp + (value ? points : -points)).clamp(0, 1 << 30);

    _checkXpBadges();
    await _storage.saveProgress(progress);
    notifyListeners();
  }

  /// Mark [day] complete: add to completed set, award lesson XP, unlock badge,
  /// advance currentDay to the next un-completed day, and update streak.
  Future<void> completeDay(int day) async {
    final lesson = lessonForDay(day);
    if (lesson == null) return;

    final wasCompleted = progress.completedDays.contains(day);
    if (!wasCompleted) {
      progress.completedDays.add(day);
      progress.totalXp += lesson.xpReward;

      // Unlock the day's badge (if any).
      if (lesson.unlockBadge.isNotEmpty) {
        progress.unlockedBadges.add(lesson.unlockBadge);
      }

      // If this seal completes the entire 30-chapter codex, stamp the
      // completion time. The certificate screen reads this.
      if (progress.completedDays.length == 30 &&
          progress.codexCompletedAt == null) {
        progress.codexCompletedAt =
            DateTime.now().millisecondsSinceEpoch;
      }
    }

    _updateStreak();
    _advanceCurrentDay();
    _checkXpBadges();
    _checkStreakBadges();
    _checkJournalBadges();
    _checkChallengeBadges();

    progress.lastActiveDate = _todayInt();
    await _storage.saveProgress(progress);
    notifyListeners();
  }

  /// True when the user has sealed all 30 chapters of the codex.
  bool get isCodexComplete => progress.completedDays.length >= 30;

  Future<void> saveJournal(int day, String entry) async {
    if (entry.trim().isEmpty) {
      progress.journalEntries.remove(day);
    } else {
      progress.journalEntries[day] = entry;
    }
    _checkJournalBadges();
    await _storage.saveProgress(progress);
    notifyListeners();
  }

  String? journalFor(int day) => progress.journalEntries[day];

  // ---------- Phase 2: Quiz / week intros / milestone sharing ----------

  /// Records whether the user answered [questionIndex] correctly for [day].
  /// Awards bonus XP for correct answers (+10 each).
  Future<void> recordQuizAnswer(int day, int questionIndex, bool correct) async {
    final lesson = lessonForDay(day);
    if (lesson == null || questionIndex < 0 || questionIndex >= lesson.quiz.length) {
      return;
    }

    final list = List<bool>.from(
        progress.quizAnswers[day] ?? List.filled(lesson.quiz.length, false));
    final wasAnswered = list[questionIndex];
    if (wasAnswered == correct) return; // no-op
    list[questionIndex] = correct;
    progress.quizAnswers[day] = list;

    progress.totalXp = (progress.totalXp + (correct ? 10 : -10)).clamp(0, 1 << 30);
    _checkXpBadges();
    await _storage.saveProgress(progress);
    notifyListeners();
  }

  /// Mark the day's quiz as fully completed (after the last question is
  /// answered). Awards 25 XP bonus and triggers quiz badges.
  Future<void> completeQuiz(int day) async {
    if (progress.completedQuizzes < 30 && !progress.completedDays.contains(day)) {
      // Only count the quiz-completion bonus if the day isn't already done.
    }
    progress.completedQuizzes += 1;
    progress.totalXp += 25;
    if (progress.completedQuizzes >= 1) {
      progress.unlockedBadges.add('first_quiz');
    }
    if (progress.completedQuizzes >= 30) {
      progress.unlockedBadges.add('all_quizzes');
    }
    _checkXpBadges();
    await _storage.saveProgress(progress);
    notifyListeners();
  }

  /// Has the user already seen the week intro for [week]? (1..4)
  bool hasSeenWeekIntro(int week) => progress.seenWeekIntros.contains(week);

  Future<void> markWeekIntroSeen(int week) async {
    if (progress.seenWeekIntros.add(week)) {
      await _storage.saveProgress(progress);
      notifyListeners();
    }
  }

  /// The week that [day] belongs to (1..4).
  int weekOfDay(int day) => ((day - 1) ~/ 7) + 1;

  bool hasSharedMilestone(int day) => progress.sharedMilestones.contains(day);

  Future<void> markMilestoneShared(int day) async {
    if (progress.sharedMilestones.add(day)) {
      await _storage.saveProgress(progress);
      notifyListeners();
    }
  }

  Future<void> resetAll() async {
    await _storage.clearAll();
    progress = UserProgress();
    await _storage.setFirstLaunchComplete();
    notifyListeners();
  }

  // ---------- Internal helpers ----------

  void _advanceCurrentDay() {
    // Find the lowest day in 1..30 that is not yet completed.
    for (var d = 1; d <= 30; d++) {
      if (!progress.completedDays.contains(d)) {
        progress.currentDay = d;
        return;
      }
    }
    progress.currentDay = 30;
  }

  /// Manually set which day the user is on. Used by Settings → Set
  /// Current Day for crash recovery or starting partway through on
  /// a fresh install. The chosen day, every earlier day, and the
  /// day immediately after the user's highest completed day are all
  /// considered unlocked by [isDayUnlocked].
  ///
  /// We deliberately do NOT wipe completed days or XP — the user
  /// may be resuming after a crash and we must not punish them for
  /// work they've already done. The chosen [day] is clamped to
  /// `1..30` and must not exceed `highestCompleted + 2` so the
  /// gating model stays consistent.
  Future<void> setCurrentDay(int day) async {
    final clamped = day.clamp(1, 30);
    final highest = progress.completedDays.isEmpty
        ? 0
        : progress.completedDays.reduce((a, b) => a > b ? a : b);
    // Allow up to 2 ahead of what they've finished so they can
    // preview the next chapter before doing it, but no further.
    final max = (highest + 2).clamp(1, 30);
    final target = clamped > max ? max : clamped;
    if (progress.currentDay == target) return;
    progress.currentDay = target;
    progress.lastActiveDate = _todayInt();
    await _storage.saveProgress(progress);
    notifyListeners();
  }

  void _updateStreak() {
    final today = _todayInt();
    if (progress.lastActiveDate == 0) {
      progress.streak = 1;
      return;
    }
    final yesterday = _addDays(today, -1);
    if (progress.lastActiveDate == today) {
      // Already counted today; keep streak as-is.
      return;
    } else if (progress.lastActiveDate == yesterday) {
      progress.streak += 1;
    } else {
      progress.streak = 1;
    }
  }

  void _checkXpBadges() {
    const xpThresholds = {
      'xp_500': 500,
      'xp_1000': 1000,
      'xp_2000': 2000,
      'xp_3000': 3000,
      'xp_5000': 5000,
    };
    xpThresholds.forEach((id, threshold) {
      if (progress.totalXp >= threshold) {
        progress.unlockedBadges.add(id);
      }
    });
  }

  void _checkStreakBadges() {
    if (progress.streak >= 7) progress.unlockedBadges.add('streak_7');
    if (progress.streak >= 14) progress.unlockedBadges.add('streak_14');
    if (progress.streak >= 30) progress.unlockedBadges.add('streak_30');
  }

  void _checkJournalBadges() {
    final n = progress.journalEntries.length;
    if (n >= 10) progress.unlockedBadges.add('journal_10');
    if (n >= 30) progress.unlockedBadges.add('journal_all');
  }

  void _checkChallengeBadges() {
    var total = 0;
    progress.challengesCompleted.forEach((_, list) {
      total += list.where((c) => c).length;
    });
    if (total >= 50) progress.unlockedBadges.add('challenges_50');

    // All challenges: every day has every box ticked.
    var allDone = true;
    for (final lesson in allLessons) {
      final list = progress.challengesCompleted[lesson.day];
      if (list == null || list.length != lesson.challenges.length) {
        allDone = false;
        break;
      }
      if (list.any((c) => !c)) {
        allDone = false;
        break;
      }
    }
    if (allDone) progress.unlockedBadges.add('challenges_all');
  }

  /// Returns a Badge definition by its id (or null if not found).
  Badge? badgeById(String id) {
    for (final b in allBadges) {
      if (b.id == id) return b;
    }
    return null;
  }

  int get unlockedBadgeCount => progress.unlockedBadges.length;
  int get totalBadgeCount => allBadges.length;

  // ---------- Date helpers (no Date.now() in test mode would need
  //                          injection; this is fine for the running app) ----------

  static int _todayInt() {
    final n = DateTime.now();
    return n.year * 10000 + n.month * 100 + n.day;
  }

  static int _addDays(int yyyymmdd, int days) {
    final y = yyyymmdd ~/ 10000;
    final m = (yyyymmdd ~/ 100) % 100;
    final d = yyyymmdd % 100;
    final dt = DateTime(y, m, d).add(Duration(days: days));
    return dt.year * 10000 + dt.month * 100 + dt.day;
  }
}
