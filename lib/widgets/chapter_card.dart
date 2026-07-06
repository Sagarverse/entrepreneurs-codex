import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/app_models.dart';
import '../theme.dart';

/// A single node on the codex path. A small square that visually represents
/// a chapter of the 30-day journey. Used in the progress constellation.
class ChapterCard extends StatelessWidget {
  final int day;
  final DailyLesson? lesson;
  final bool completed;
  final bool isCurrent;
  final bool isUnlocked;
  final VoidCallback? onTap;
  final double size;

  const ChapterCard({
    super.key,
    required this.day,
    this.lesson,
    required this.completed,
    required this.isCurrent,
    required this.isUnlocked,
    this.onTap,
    this.size = 52,
  });

  @override
  Widget build(BuildContext context) {
    Color border = CodexPalette.goldDeep.withValues(alpha: 0.4);
    Color fill = CodexPalette.inkRaised;
    Color glyphColor = CodexPalette.textOnInkDim;
    Widget? badge;

    if (completed) {
      border = CodexPalette.gold;
      fill = CodexPalette.gold.withValues(alpha: 0.10);
      glyphColor = CodexPalette.goldBright;
      badge = const Icon(Icons.check_rounded,
          color: CodexPalette.gold, size: 14);
    } else if (isCurrent) {
      border = CodexPalette.goldBright;
      fill = CodexPalette.gold.withValues(alpha: 0.20);
      glyphColor = CodexPalette.goldBright;
      badge = const Icon(Icons.play_arrow_rounded,
          color: CodexPalette.goldBright, size: 14);
    } else if (!isUnlocked) {
      glyphColor = CodexPalette.textOnInkDim.withValues(alpha: 0.5);
      badge = const Icon(Icons.lock_rounded,
          color: CodexPalette.textOnInkDim, size: 12);
    } else {
      badge = null;
    }

    return SizedBox(
      width: size,
      height: size,
      child: Material(
        color: fill,
        borderRadius: BorderRadius.circular(2),
        child: InkWell(
          onTap: isUnlocked ? onTap : null,
          borderRadius: BorderRadius.circular(2),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              border: Border.all(
                color: border,
                width: isCurrent ? 1.5 : 0.5,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$day',
                  style: GoogleFonts.cinzel(
                    fontSize: 16,
                    color: glyphColor,
                    fontWeight: FontWeight.w800,
                    height: 1.0,
                  ),
                ),
                if (badge != null) ...[
                  const SizedBox(height: 2),
                  badge,
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
