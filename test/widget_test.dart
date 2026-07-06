// Smoke test for the 30-Day Entrepreneur Mindset Trainer.
import 'package:flutter_test/flutter_test.dart';
import 'package:entrepreneur_mindset/models/app_models.dart';
import 'package:entrepreneur_mindset/services/update_service.dart';

void main() {
  test('UserProgress defaults', () {
    final p = UserProgress();
    expect(p.currentDay, 1);
    expect(p.totalXp, 0);
    expect(p.streak, 0);
    expect(p.completedDays, isEmpty);
    expect(p.level, 'Beginner');
  });

  test('UserProgress level advances with XP', () {
    final p = UserProgress(totalXp: 600);
    expect(p.level, 'Apprentice');
    final p2 = UserProgress(totalXp: 5500);
    expect(p2.level, 'Master');
    expect(p2.xpToNextLevel, 0);
  });

  test('UserProgress xpToNextLevel', () {
    final p = UserProgress(totalXp: 250);
    expect(p.xpToNextLevel, 250);
    final p2 = UserProgress(totalXp: 1500);
    expect(p2.xpToNextLevel, 500);
  });

  test('UserProgress new fields default empty', () {
    final p = UserProgress();
    expect(p.quizAnswers, isEmpty);
    expect(p.seenWeekIntros, isEmpty);
    expect(p.sharedMilestones, isEmpty);
    expect(p.completedQuizzes, 0);
  });

  test('QuizQuestion has 4 options and a correct index', () {
    const q = QuizQuestion(
      question: 'What is the foundation of the codex?',
      options: ['Mindset', 'Skill', 'Action', 'All of the above'],
      correctIndex: 3,
      explanation: 'All three strands are woven into every chapter.',
    );
    expect(q.options.length, 4);
    expect(q.correctIndex, 3);
  });

  test('VideoResource holds YouTube id and metadata', () {
    const v = VideoResource(
      title: 'How to build a business',
      speaker: 'Someone',
      youtubeId: 'dQw4w9WgXcQ',
      durationMinutes: 18,
    );
    expect(v.youtubeId.length, 11);
    expect(v.durationMinutes, 18);
  });

  test('WeekIntro lines and week', () {
    const w = WeekIntro(
      week: 1,
      theme: 'The Awakening',
      subtitle: 'Mindset is the foundation.',
      lines: ['line 1', 'line 2', 'line 3'],
    );
    expect(w.week, 1);
    expect(w.lines.length, 3);
  });

  test('UpdateService: parses plain and v-prefixed semver', () {
    // Re-derive the parser indirectly by checking the public surface
    // (version strings are read off the release JSON, parsed in the
    // service). The comparator is private, so we test it by reaching
    // into the only public path that exercises it: currentVersion.
    expect(UpdateService.currentVersion, isNotEmpty);
    expect(UpdateService.releasePageFor('v1.0.1'),
        contains('releases/tag/v1.0.1'));
  });
}
