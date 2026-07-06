// Models for the 30-Day Entrepreneur Mindset Trainer

class DailyLesson {
  final int day;
  final String title;
  final String theme;
  final String category; // mindset, skill, action, reflection, monetization
  final String quote;
  final String quoteAuthor;
  final String mindsetLesson;
  final List<LessonSection> sections;
  final List<DailyChallenge> challenges;
  final String reflectionPrompt;
  final String actionStep;
  final String skillName;
  final String skillDescription;
  final int xpReward;
  final String unlockBadge;

  // New (Phase 2):
  final String chapterTitle; // e.g. "Chapter I — The Abundance"
  final String weekTheme; // e.g. "The Awakening"
  final String? teaserQuote; // quote shown on the "tomorrow's preview" card
  final String? teaserHook; // one-line hook for the preview card
  final List<QuizQuestion> quiz;
  final List<VideoResource> videos;

  const DailyLesson({
    required this.day,
    required this.title,
    required this.theme,
    required this.category,
    required this.quote,
    required this.quoteAuthor,
    required this.mindsetLesson,
    required this.sections,
    required this.challenges,
    required this.reflectionPrompt,
    required this.actionStep,
    required this.skillName,
    required this.skillDescription,
    required this.xpReward,
    required this.unlockBadge,
    required this.chapterTitle,
    required this.weekTheme,
    this.teaserQuote,
    this.teaserHook,
    this.quiz = const [],
    this.videos = const [],
  });
}

class QuizQuestion {
  final String question;
  final List<String> options; // 4 options
  final int correctIndex;
  final String explanation;

  const QuizQuestion({
    required this.question,
    required this.options,
    required this.correctIndex,
    required this.explanation,
  });
}

class VideoResource {
  final String title;
  final String speaker;
  final String youtubeId; // 11-char YouTube video ID
  final int durationMinutes;
  final String? whyWatch; // 1-line "why watch this"

  const VideoResource({
    required this.title,
    required this.speaker,
    required this.youtubeId,
    required this.durationMinutes,
    this.whyWatch,
  });
}

class WeekIntro {
  final int week; // 1..4
  final String theme; // e.g. "The Awakening"
  final String subtitle; // e.g. "Mindset is the foundation of everything."
  final List<String> lines; // cinematic intro lines, revealed one by one

  const WeekIntro({
    required this.week,
    required this.theme,
    required this.subtitle,
    required this.lines,
  });
}

class LessonSection {
  final String heading;
  final String content;

  const LessonSection({required this.heading, required this.content});

  Map<String, dynamic> toJson() => {'heading': heading, 'content': content};
}

class DailyChallenge {
  final String description;
  final String type; // action, thought, skill, creative
  final int points;

  const DailyChallenge({
    required this.description,
    required this.type,
    required this.points,
  });

  Map<String, dynamic> toJson() =>
      {'description': description, 'type': type, 'points': points};
}

class Badge {
  final String id;
  final String name;
  final String icon;
  final String description;
  final int dayUnlocked;

  const Badge({
    required this.id,
    required this.name,
    required this.icon,
    required this.description,
    required this.dayUnlocked,
  });
}

class UserProgress {
  int currentDay;
  int totalXp;
  int streak;
  Set<int> completedDays;
  Set<String> unlockedBadges;
  Map<int, String> journalEntries;
  Map<int, List<bool>> challengesCompleted;
  int lastActiveDate; // stored as YYYYMMDD int
  String userName; // collected in onboarding, used on the certificate
  int? codexCompletedAt; // ms since epoch when the user sealed the 30th chapter

  // New (Phase 2):
  Map<int, List<bool>> quizAnswers; // day -> [q1, q2, q3, q4, q5] correctness
  Set<int> seenWeekIntros; // weeks the user has already been shown
  Set<int> sharedMilestones; // days whose milestone card was shared
  int completedQuizzes; // count of days with a full quiz attempt

  UserProgress({
    this.currentDay = 1,
    this.totalXp = 0,
    this.streak = 0,
    Set<int>? completedDays,
    Set<String>? unlockedBadges,
    Map<int, String>? journalEntries,
    Map<int, List<bool>>? challengesCompleted,
    this.lastActiveDate = 0,
    this.userName = '',
    this.codexCompletedAt,
    Map<int, List<bool>>? quizAnswers,
    Set<int>? seenWeekIntros,
    Set<int>? sharedMilestones,
    this.completedQuizzes = 0,
  })  : completedDays = completedDays ?? {},
        unlockedBadges = unlockedBadges ?? {},
        journalEntries = journalEntries ?? {},
        challengesCompleted = challengesCompleted ?? {},
        quizAnswers = quizAnswers ?? {},
        seenWeekIntros = seenWeekIntros ?? {},
        sharedMilestones = sharedMilestones ?? {};

  double get completionPercent =>
      completedDays.length / 30.0;

  String get level {
    if (totalXp >= 5000) return 'Master';
    if (totalXp >= 3000) return 'Expert';
    if (totalXp >= 2000) return 'Advanced';
    if (totalXp >= 1000) return 'Intermediate';
    if (totalXp >= 500) return 'Apprentice';
    return 'Beginner';
  }

  int get xpToNextLevel {
    if (totalXp >= 5000) return 0;
    if (totalXp >= 3000) return 5000 - totalXp;
    if (totalXp >= 2000) return 3000 - totalXp;
    if (totalXp >= 1000) return 2000 - totalXp;
    if (totalXp >= 500) return 1000 - totalXp;
    return 500 - totalXp;
  }

  int get nextLevelThreshold {
    if (totalXp >= 5000) return 5000;
    if (totalXp >= 3000) return 5000;
    if (totalXp >= 2000) return 3000;
    if (totalXp >= 1000) return 2000;
    if (totalXp >= 500) return 1000;
    return 500;
  }
}

class BusinessIdeaGenerator {
  final String category;
  final List<String> ideas;

  const BusinessIdeaGenerator({required this.category, required this.ideas});
}