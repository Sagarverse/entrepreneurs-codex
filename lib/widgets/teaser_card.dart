import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/app_models.dart';
import '../theme.dart';
import 'codex_frame.dart';

/// "Tomorrow's Preview" — the curiosity hook that lives at the end of every
/// lesson, teasing the next chapter.
class TeaserCard extends StatelessWidget {
  final DailyLesson? nextLesson; // may be null on day 30
  final String hook;
  final String quote;
  final bool alreadyUnlocked;

  const TeaserCard({
    super.key,
    required this.nextLesson,
    required this.hook,
    required this.quote,
    required this.alreadyUnlocked,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CodexFrame(
      padding: const EdgeInsets.all(20),
      borderColor: alreadyUnlocked ? CodexPalette.gold : CodexPalette.goldDeep,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                alreadyUnlocked ? Icons.lock_open_rounded : Icons.lock_rounded,
                size: 14,
                color: alreadyUnlocked ? CodexPalette.gold : CodexPalette.textOnInkDim,
              ),
              const SizedBox(width: 6),
              Text(
                nextLesson == null
                    ? 'YOUR CHAPTER'
                    : 'TOMORROW · ${nextLesson!.chapterTitle.toUpperCase()}',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: alreadyUnlocked ? CodexPalette.gold : CodexPalette.textOnInkDim,
                  letterSpacing: 3,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            hook,
            style: GoogleFonts.cormorantGaramond(
              fontSize: 18,
              color: CodexPalette.textOnInk,
              height: 1.4,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            height: 0.5,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0x00000000),
                  CodexPalette.gold,
                  Color(0x00000000),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            quote,
            style: GoogleFonts.cinzel(
              fontSize: 12,
              color: CodexPalette.textOnInkDim,
              letterSpacing: 1,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}
