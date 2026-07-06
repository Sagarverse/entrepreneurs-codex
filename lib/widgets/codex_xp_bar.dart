import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/app_models.dart';
import '../theme.dart';

/// Gold-inlay XP bar. Shows level pill, current/total XP, and a gold-stroked
/// progress bar with diamond ornament at the leading edge.
class CodexXpBar extends StatelessWidget {
  final int totalXp;
  final bool compact;

  const CodexXpBar({
    super.key,
    required this.totalXp,
    this.compact = false,
  });

  @override
  Widget build(BuildContext context) {
    final progress = UserProgress(totalXp: totalXp);
    final threshold = progress.nextLevelThreshold;
    final lowerBound = _lowerBoundFor(totalXp);
    final span = (threshold - lowerBound).clamp(1, 1 << 30);
    final double ratio =
        ((totalXp - lowerBound) / span).clamp(0.0, 1.0);
    final remaining = progress.xpToNextLevel;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!compact)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: CodexPalette.gold.withValues(alpha: 0.15),
                      border: Border.all(
                          color: CodexPalette.gold, width: 0.5),
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Text(
                      progress.level.toUpperCase(),
                      style: GoogleFonts.cinzel(
                        fontSize: 10,
                        letterSpacing: 3,
                        color: CodexPalette.goldBright,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    '$totalXp XP',
                    style: GoogleFonts.cinzel(
                      fontSize: 12,
                      letterSpacing: 2,
                      color: CodexPalette.gold,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              Text(
                remaining == 0
                    ? 'MAX LEVEL'
                    : '$remaining TO NEXT',
                style: GoogleFonts.cinzel(
                  fontSize: 10,
                  letterSpacing: 2,
                  color: CodexPalette.textOnInkDim,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        if (!compact) const SizedBox(height: 8),
        SizedBox(
          height: compact ? 6 : 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: CodexPalette.inkHigher,
                  borderRadius: BorderRadius.circular(2),
                  border: Border.all(
                      color: CodexPalette.goldDeep, width: 0.5),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(2),
                child: TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0, end: ratio),
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.easeOutCubic,
                  builder: (context, value, _) => FractionallySizedBox(
                    widthFactor: value,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            CodexPalette.goldDeep,
                            CodexPalette.gold,
                            CodexPalette.goldBright,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  int _lowerBoundFor(int xp) {
    const thresholds = [500, 1000, 2000, 3000, 5000];
    var lower = 0;
    for (final t in thresholds) {
      if (xp >= t) {
        lower = t;
      } else {
        break;
      }
    }
    return lower;
  }
}
