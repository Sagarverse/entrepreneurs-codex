import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/app_models.dart';

class StorageService {
  static const _keyCurrentDay = 'currentDay';
  static const _keyTotalXp = 'totalXp';
  static const _keyStreak = 'streak';
  static const _keyCompletedDays = 'completedDays';
  static const _keyUnlockedBadges = 'unlockedBadges';
  static const _keyJournalEntries = 'journalEntries';
  static const _keyChallengesCompleted = 'challengesCompleted';
  static const _keyLastActiveDate = 'lastActiveDate';
  static const _keyFirstLaunch = 'firstLaunch';
  // Phase 2 keys
  static const _keyQuizAnswers = 'quizAnswers';
  static const _keySeenWeekIntros = 'seenWeekIntros';
  static const _keySharedMilestones = 'sharedMilestones';
  static const _keyCompletedQuizzes = 'completedQuizzes';
  // Phase 5 keys
  static const _keySoundEnabled = 'soundEnabled';
  // Certificate
  static const _keyUserName = 'userName';
  static const _keyCodexCompletedAt = 'codexCompletedAt';

  late SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // ---- Load ----

  UserProgress loadProgress() {
    final currentDay = _prefs.getInt(_keyCurrentDay) ?? 1;
    final totalXp = _prefs.getInt(_keyTotalXp) ?? 0;
    final streak = _prefs.getInt(_keyStreak) ?? 0;
    final lastActiveDate = _prefs.getInt(_keyLastActiveDate) ?? 0;
    final userName = _prefs.getString(_keyUserName) ?? '';
    final codexCompletedAt = _prefs.getInt(_keyCodexCompletedAt);

    final completedDaysRaw = _prefs.getStringList(_keyCompletedDays) ?? [];
    final completedDays = completedDaysRaw.map(int.parse).toSet();

    final unlockedBadgesRaw = _prefs.getStringList(_keyUnlockedBadges) ?? [];
    final unlockedBadges = unlockedBadgesRaw.toSet();

    final journalRaw = _prefs.getString(_keyJournalEntries);
    final Map<int, String> journalEntries = {};
    if (journalRaw != null && journalRaw.isNotEmpty) {
      final decoded = jsonDecode(journalRaw) as Map<String, dynamic>;
      decoded.forEach((k, v) => journalEntries[int.parse(k)] = v as String);
    }

    final challengesRaw = _prefs.getString(_keyChallengesCompleted);
    final Map<int, List<bool>> challengesCompleted = {};
    if (challengesRaw != null && challengesRaw.isNotEmpty) {
      final decoded = jsonDecode(challengesRaw) as Map<String, dynamic>;
      decoded.forEach((k, v) {
        challengesCompleted[int.parse(k)] =
            (v as List<dynamic>).map((e) => e as bool).toList();
      });
    }

    final quizRaw = _prefs.getString(_keyQuizAnswers);
    final Map<int, List<bool>> quizAnswers = {};
    if (quizRaw != null && quizRaw.isNotEmpty) {
      final decoded = jsonDecode(quizRaw) as Map<String, dynamic>;
      decoded.forEach((k, v) {
        quizAnswers[int.parse(k)] =
            (v as List<dynamic>).map((e) => e as bool).toList();
      });
    }

    final seenWeekIntros =
        (_prefs.getStringList(_keySeenWeekIntros) ?? []).map(int.parse).toSet();
    final sharedMilestones =
        (_prefs.getStringList(_keySharedMilestones) ?? []).map(int.parse).toSet();
    final completedQuizzes = _prefs.getInt(_keyCompletedQuizzes) ?? 0;

    return UserProgress(
      currentDay: currentDay,
      totalXp: totalXp,
      streak: streak,
      completedDays: completedDays,
      unlockedBadges: unlockedBadges,
      journalEntries: journalEntries,
      challengesCompleted: challengesCompleted,
      lastActiveDate: lastActiveDate,
      userName: userName,
      codexCompletedAt: codexCompletedAt,
      quizAnswers: quizAnswers,
      seenWeekIntros: seenWeekIntros,
      sharedMilestones: sharedMilestones,
      completedQuizzes: completedQuizzes,
    );
  }

  // ---- Save ----

  Future<void> saveProgress(UserProgress progress) async {
    await _prefs.setInt(_keyCurrentDay, progress.currentDay);
    await _prefs.setInt(_keyTotalXp, progress.totalXp);
    await _prefs.setInt(_keyStreak, progress.streak);
    await _prefs.setInt(_keyLastActiveDate, progress.lastActiveDate);
    await _prefs.setString(_keyUserName, progress.userName);
    if (progress.codexCompletedAt != null) {
      await _prefs.setInt(
          _keyCodexCompletedAt, progress.codexCompletedAt!);
    }

    await _prefs.setStringList(
      _keyCompletedDays,
      progress.completedDays.map((e) => e.toString()).toList(),
    );

    await _prefs.setStringList(
      _keyUnlockedBadges,
      progress.unlockedBadges.toList(),
    );

    final journalJson = <String, String>{};
    progress.journalEntries
        .forEach((k, v) => journalJson[k.toString()] = v);
    await _prefs.setString(_keyJournalEntries, jsonEncode(journalJson));

    final challengesJson = <String, List<bool>>{};
    progress.challengesCompleted
        .forEach((k, v) => challengesJson[k.toString()] = v);
    await _prefs.setString(
        _keyChallengesCompleted, jsonEncode(challengesJson));

    final quizJson = <String, List<bool>>{};
    progress.quizAnswers.forEach((k, v) => quizJson[k.toString()] = v);
    await _prefs.setString(_keyQuizAnswers, jsonEncode(quizJson));

    await _prefs.setStringList(
      _keySeenWeekIntros,
      progress.seenWeekIntros.map((e) => e.toString()).toList(),
    );
    await _prefs.setStringList(
      _keySharedMilestones,
      progress.sharedMilestones.map((e) => e.toString()).toList(),
    );
    await _prefs.setInt(_keyCompletedQuizzes, progress.completedQuizzes);
  }

  // ---- Utility ----

  bool get isFirstLaunch => _prefs.getBool(_keyFirstLaunch) ?? true;

  Future<void> setFirstLaunchComplete() async {
    await _prefs.setBool(_keyFirstLaunch, false);
  }

  bool get soundEnabled => _prefs.getBool(_keySoundEnabled) ?? true;

  Future<void> setSoundEnabled(bool value) async {
    await _prefs.setBool(_keySoundEnabled, value);
  }

  Future<void> setUserName(String name) async {
    await _prefs.setString(_keyUserName, name);
  }

  Future<void> clearAll() async {
    await _prefs.clear();
  }
}
