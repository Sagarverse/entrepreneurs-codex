import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/app_models.dart';
import '../theme.dart';
import '../widgets/codex_frame.dart';
import '../widgets/ink_divider.dart';
import '../widgets/video_card.dart';

/// The Revelation — curated talks & podcasts for today's chapter.
class VideoScreen extends StatelessWidget {
  final DailyLesson lesson;
  const VideoScreen({super.key, required this.lesson});

  Future<void> _open(BuildContext context, VideoResource v) async {
    final url = Uri.parse('https://www.youtube.com/watch?v=${v.youtubeId}');
    final ok = await launchUrl(url, mode: LaunchMode.externalApplication);
    if (!ok && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Could not open ${v.title}'),
          backgroundColor: CodexPalette.inkHigher,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CodexPalette.inkBlack,
      appBar: AppBar(
        backgroundColor: CodexPalette.inkBlack,
        foregroundColor: CodexPalette.gold,
        title: Text(
          'THE REVELATION',
          style: GoogleFonts.cinzel(
            fontSize: 14,
            letterSpacing: 4,
            color: CodexPalette.gold,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: lesson.videos.isEmpty
          ? const _Empty()
          : ListView(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
              children: [
                CodexFrame(
                  padding: const EdgeInsets.all(20),
                  borderColor: CodexPalette.goldDeep,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'CURATED FOR CHAPTER ${romanNumeralShort(lesson.day)}',
                        style: GoogleFonts.cinzel(
                          fontSize: 10,
                          letterSpacing: 3,
                          color: CodexPalette.gold,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Talks, podcasts and lectures to deepen today\'s lesson.',
                        style: GoogleFonts.cormorantGaramond(
                          fontSize: 16,
                          color: CodexPalette.textOnInk,
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const InkDivider(),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                for (final v in lesson.videos) ...[
                  VideoCard(video: v, onTap: () => _open(context, v)),
                  const SizedBox(height: 10),
                ],
                const SizedBox(height: 12),
                Center(
                  child: Text(
                    'TAP A VIDEO TO OPEN IN YOUR BROWSER',
                    style: GoogleFonts.cinzel(
                      fontSize: 10,
                      letterSpacing: 3,
                      color: CodexPalette.textOnInkDim,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}

class _Empty extends StatelessWidget {
  const _Empty();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'No videos curated for this chapter.',
        style: GoogleFonts.cormorantGaramond(
          fontSize: 16,
          fontStyle: FontStyle.italic,
          color: CodexPalette.textOnInkDim,
        ),
      ),
    );
  }
}

String romanNumeralShort(int n) {
  if (n <= 0 || n > 30) return '$n';
  const map = [
    'I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII', 'IX', 'X',
    'XI', 'XII', 'XIII', 'XIV', 'XV', 'XVI', 'XVII', 'XVIII', 'XIX', 'XX',
    'XXI', 'XXII', 'XXIII', 'XXIV', 'XXV', 'XXVI', 'XXVII', 'XXVIII', 'XXIX', 'XXX',
  ];
  return map[n - 1];
}
