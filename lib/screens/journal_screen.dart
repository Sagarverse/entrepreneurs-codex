import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../models/app_models.dart';
import '../services/app_state.dart';
import '../theme.dart';
import '../widgets/codex_frame.dart';
import '../widgets/ink_divider.dart';
import 'lesson_screen.dart';

/// The Journal — every reflection styled as a parchment page, in chapter order.
class JournalScreen extends StatelessWidget {
  const JournalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final entries = state.progress.journalEntries;
    final lesson = state.currentLesson;

    final sortedKeys = entries.keys.toList()..sort();
    return Scaffold(
      backgroundColor: CodexPalette.inkBlack,
      appBar: AppBar(
        backgroundColor: CodexPalette.inkBlack,
        foregroundColor: CodexPalette.gold,
        title: Text(
          'JOURNAL',
          style: GoogleFonts.cinzel(
            fontSize: 13,
            letterSpacing: 4,
            color: CodexPalette.gold,
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: entries.isEmpty
          ? _EmptyState(lessonDay: lesson?.day)
          : ListView.separated(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
              itemCount: sortedKeys.length,
              separatorBuilder: (_, _) => const SizedBox(height: 14),
              itemBuilder: (context, i) {
                final day = sortedKeys[i];
                final text = entries[day] ?? '';
                final dayLesson = state.lessonForDay(day);
                return _Page(
                  day: day,
                  lesson: dayLesson,
                  text: text,
                );
              },
            ),
      bottomSheet: entries.isEmpty && lesson != null
          ? SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: FilledButton(
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => LessonScreen(day: lesson.day),
                      ),
                    ),
                    style: FilledButton.styleFrom(
                      backgroundColor: CodexPalette.gold,
                      foregroundColor: CodexPalette.inkBlack,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2)),
                    ),
                    child: Text(
                      'OPEN CHAPTER ${romanNumeral(lesson.day)}',
                      style: GoogleFonts.cinzel(
                        fontSize: 12,
                        letterSpacing: 4,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              ),
            )
          : null,
    );
  }
}

class _Page extends StatelessWidget {
  final int day;
  final DailyLesson? lesson;
  final String text;
  const _Page({required this.day, required this.lesson, required this.text});

  @override
  Widget build(BuildContext context) {
    return CodexFrame(
      padding: const EdgeInsets.all(20),
      borderColor: CodexPalette.goldDeep,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: CodexPalette.gold.withValues(alpha: 0.15),
                  border: Border.all(
                      color: CodexPalette.gold, width: 0.5),
                  borderRadius: BorderRadius.circular(2),
                ),
                child: Text(
                  'CHAPTER ${romanNumeral(day)}',
                  style: GoogleFonts.cinzel(
                    fontSize: 9,
                    letterSpacing: 3,
                    color: CodexPalette.goldBright,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const Spacer(),
              IconButton(
                tooltip: 'Open chapter',
                visualDensity: VisualDensity.compact,
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => LessonScreen(day: day),
                  ),
                ),
                icon: const Icon(Icons.arrow_outward_rounded,
                    color: CodexPalette.gold, size: 18),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            lesson?.chapterTitle ?? 'DAY $day',
            style: GoogleFonts.cinzel(
              fontSize: 18,
              color: CodexPalette.goldBright,
              fontWeight: FontWeight.w800,
              height: 1.3,
            ),
          ),
          if (lesson != null) ...[
            const SizedBox(height: 2),
            Text(
              lesson!.title,
              style: GoogleFonts.cormorantGaramond(
                fontSize: 15,
                color: CodexPalette.textOnInkDim,
                fontStyle: FontStyle.italic,
                height: 1.4,
              ),
            ),
          ],
          const SizedBox(height: 14),
          const InkDivider(),
          const SizedBox(height: 14),
          Text(
            text,
            style: GoogleFonts.cormorantGaramond(
              fontSize: 17,
              color: CodexPalette.textOnInk,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  final int? lessonDay;
  const _EmptyState({this.lessonDay});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 96,
              height: 96,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: CodexPalette.inkRaised,
                shape: BoxShape.circle,
                border: Border.all(
                    color: CodexPalette.goldDeep, width: 0.5),
              ),
              child: const Icon(Icons.menu_book_rounded,
                  size: 40, color: CodexPalette.gold),
            ),
            const SizedBox(height: 24),
            Text(
              'THE PAGES ARE BLANK',
              textAlign: TextAlign.center,
              style: GoogleFonts.cinzel(
                fontSize: 14,
                letterSpacing: 4,
                color: CodexPalette.gold,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Write your first reflection to begin filling the codex.',
              textAlign: TextAlign.center,
              style: GoogleFonts.cormorantGaramond(
                fontSize: 16,
                color: CodexPalette.textOnInk,
                fontStyle: FontStyle.italic,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String romanNumeral(int n) {
  if (n <= 0 || n > 30) return '$n';
  const map = [
    'I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII', 'IX', 'X',
    'XI', 'XII', 'XIII', 'XIV', 'XV', 'XVI', 'XVII', 'XVIII', 'XIX', 'XX',
    'XXI', 'XXII', 'XXIII', 'XXIV', 'XXV', 'XXVI', 'XXVII', 'XXVIII', 'XXIX', 'XXX',
  ];
  return map[n - 1];
}
