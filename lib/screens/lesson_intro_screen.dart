import 'package:flutter/material.dart';
import '../models/app_models.dart';
import '../widgets/cinematic_intro.dart';

/// Cinematic opening for a lesson — chapter title + quote, slow reveal.
class LessonIntroScreen extends StatelessWidget {
  final DailyLesson lesson;
  final VoidCallback? onComplete;

  const LessonIntroScreen({super.key, required this.lesson, this.onComplete});

  @override
  Widget build(BuildContext context) {
    return CinematicIntro(
      chapter: lesson.day,
      bookendTop: 'THE ENTREPRENEUR\'S CODEX',
      lines: [
        lesson.chapterTitle,
        '"${lesson.quote}"',
      ],
      bookendBottom: '— ${lesson.quoteAuthor}',
      onComplete: onComplete,
      linePause: const Duration(milliseconds: 1100),
      lineDuration: const Duration(milliseconds: 1400),
    );
  }
}
