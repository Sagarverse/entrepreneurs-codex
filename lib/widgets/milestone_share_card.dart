import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/app_models.dart';
import '../theme.dart';
import 'codex_frame.dart';

/// A shareable milestone card. Rendered as a RepaintBoundary so callers
/// can capture it as an image for `share_plus`.
class MilestoneShareCard extends StatelessWidget {
  final DailyLesson lesson;
  final int totalXp;
  final int streak;

  const MilestoneShareCard({
    super.key,
    required this.lesson,
    required this.totalXp,
    required this.streak,
  });

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Container(
        width: 360,
        padding: const EdgeInsets.all(28),
        decoration: const BoxDecoration(color: CodexPalette.inkBlack),
        child: CodexFrame(
          padding: const EdgeInsets.all(28),
          borderColor: CodexPalette.gold,
          cornerSize: 28,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'THE ENTREPRENEUR\'S CODEX',
                style: GoogleFonts.cinzel(
                  fontSize: 11,
                  color: CodexPalette.gold,
                  letterSpacing: 4,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'CHAPTER ${romanNumeral(lesson.day)}',
                style: GoogleFonts.cinzel(
                  fontSize: 14,
                  color: CodexPalette.gold,
                  letterSpacing: 3,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                lesson.title,
                style: GoogleFonts.cinzel(
                  fontSize: 24,
                  color: CodexPalette.goldBright,
                  fontWeight: FontWeight.w800,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 18),
              Text(
                '"${lesson.quote}"',
                style: GoogleFonts.cormorantGaramond(
                  fontSize: 16,
                  color: CodexPalette.textOnInk,
                  fontStyle: FontStyle.italic,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                '— ${lesson.quoteAuthor}',
                style: GoogleFonts.cinzel(
                  fontSize: 11,
                  color: CodexPalette.gold,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 28),
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
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _Stat(label: 'XP', value: '$totalXp'),
                  _Stat(label: 'STREAK', value: '$streak 🔥'),
                  _Stat(label: 'CHAPTERS', value: '${lesson.day}/30'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  final String label;
  final String value;
  const _Stat({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: GoogleFonts.cinzel(
            fontSize: 18,
            color: CodexPalette.goldBright,
            fontWeight: FontWeight.w800,
            letterSpacing: 1,
          ),
        ),
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 9,
            color: CodexPalette.textOnInkDim,
            letterSpacing: 2,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
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
