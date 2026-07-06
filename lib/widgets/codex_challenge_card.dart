import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/app_models.dart';
import '../theme.dart';

/// Wax-seal style challenge card — gold/ink themed.
class CodexChallengeCard extends StatelessWidget {
  final DailyChallenge challenge;
  final int index;
  final bool completed;
  final ValueChanged<bool> onChanged;

  const CodexChallengeCard({
    super.key,
    required this.challenge,
    required this.index,
    required this.completed,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 220),
      decoration: BoxDecoration(
        color: completed
            ? CodexPalette.gold.withValues(alpha: 0.10)
            : CodexPalette.inkRaised,
        borderRadius: BorderRadius.circular(2),
        border: Border.all(
          color: completed
              ? CodexPalette.gold
              : CodexPalette.goldDeep.withValues(alpha: 0.5),
          width: 0.5,
        ),
      ),
      child: InkWell(
        onTap: () => onChanged(!completed),
        borderRadius: BorderRadius.circular(2),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: completed
                      ? CodexPalette.gold
                      : Colors.transparent,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: completed
                        ? CodexPalette.gold
                        : CodexPalette.goldDeep,
                    width: 1.5,
                  ),
                ),
                child: completed
                    ? const Icon(Icons.check_rounded,
                        size: 18, color: CodexPalette.inkBlack)
                    : null,
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      challenge.description,
                      style: GoogleFonts.cormorantGaramond(
                        fontSize: 17,
                        height: 1.4,
                        decoration: completed
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                        decorationColor: CodexPalette.gold,
                        color: completed
                            ? CodexPalette.textOnInkDim
                            : CodexPalette.textOnInk,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          challenge.type.toUpperCase(),
                          style: GoogleFonts.cinzel(
                            fontSize: 9,
                            letterSpacing: 3,
                            fontWeight: FontWeight.w700,
                            color: CodexPalette.gold,
                          ),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            const Icon(Icons.star_rounded,
                                size: 14, color: CodexPalette.gold),
                            const SizedBox(width: 2),
                            Text(
                              '+${challenge.points}',
                              style: GoogleFonts.cinzel(
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                                color: CodexPalette.gold,
                                letterSpacing: 1,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
