import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import '../models/app_models.dart';
import '../services/app_state.dart';
import '../services/codex_audio.dart';
import '../theme.dart';
import '../widgets/ink_divider.dart';
import '../widgets/milestone_share_card.dart';
import '../widgets/teaser_card.dart';
import 'lesson_intro_screen.dart';
import 'video_screen.dart';
import 'quiz_screen.dart';

/// The celebration at the end of a day — shareable card + tomorrow's preview.
class MilestoneScreen extends StatefulWidget {
  final DailyLesson lesson;
  final DailyLesson? nextLesson;
  const MilestoneScreen({super.key, required this.lesson, this.nextLesson});

  @override
  State<MilestoneScreen> createState() => _MilestoneScreenState();
}

class _MilestoneScreenState extends State<MilestoneScreen> {
  final GlobalKey _cardKey = GlobalKey();
  bool _isSharing = false;

  Future<void> _share() async {
    CodexAudio.instance.bell(scale: 0.8);
    setState(() => _isSharing = true);
    try {
      final boundary = _cardKey.currentContext?.findRenderObject()
          as RenderRepaintBoundary?;
      if (boundary == null) {
        throw StateError('Card not ready');
      }
      final image = await boundary.toImage(pixelRatio: 3.0);
      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      if (byteData == null) throw StateError('Could not encode image');
      final pngBytes = byteData.buffer.asUint8List();
      final file = XFile.fromData(
        Uint8List.fromList(pngBytes),
        mimeType: 'image/png',
        name: 'codex-chapter-${widget.lesson.day}.png',
      );
      await Share.shareXFiles(
        [file],
        text:
            'Chapter ${widget.lesson.day} complete — ${widget.lesson.chapterTitle}. #EntrepreneursCodex',
      );
      if (!mounted) return;
      await context.read<AppState>().markMilestoneShared(widget.lesson.day);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Share failed: $e'),
          backgroundColor: CodexPalette.inkHigher,
        ),
      );
    } finally {
      if (mounted) setState(() => _isSharing = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    return Scaffold(
      backgroundColor: CodexPalette.inkBlack,
      appBar: AppBar(
        backgroundColor: CodexPalette.inkBlack,
        foregroundColor: CodexPalette.gold,
        elevation: 0,
        title: Text(
          'CHAPTER COMPLETE',
          style: GoogleFonts.cinzel(
            fontSize: 14,
            letterSpacing: 4,
            color: CodexPalette.gold,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            tooltip: 'Close',
            onPressed: () => Navigator.of(context).popUntil((r) => r.isFirst),
            icon: const Icon(Icons.close_rounded, color: CodexPalette.gold),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        children: [
          // Off-screen card for capture (kept in tree at 0 opacity so the
          // GlobalKey stays attached).
          Opacity(
            opacity: 0,
            child: IgnorePointer(
              child: MilestoneShareCard(
                key: _cardKey,
                lesson: widget.lesson,
                totalXp: state.progress.totalXp,
                streak: state.progress.streak,
              ),
            ),
          ),
          // Visible card
          Center(
            child: MilestoneShareCard(
              lesson: widget.lesson,
              totalXp: state.progress.totalXp,
              streak: state.progress.streak,
            ),
          ),
          const SizedBox(height: 24),
          _ActionsRow(
            isSharing: _isSharing,
            alreadyShared: state.hasSharedMilestone(widget.lesson.day),
            onShare: _share,
            onContinue: () {
              Navigator.of(context).popUntil((r) => r.isFirst);
            },
            onReplay: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (_) => LessonIntroScreen(
                    lesson: widget.lesson,
                    onComplete: () => Navigator.of(context).pop(),
                  ),
                ),
              );
            },
            onVideo: widget.lesson.videos.isEmpty
                ? null
                : () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => VideoScreen(lesson: widget.lesson),
                    ));
                  },
            onQuiz: widget.lesson.quiz.isEmpty
                ? null
                : () async {
                    await Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => QuizScreen(lesson: widget.lesson),
                    ));
                  },
          ),
          const SizedBox(height: 28),
          if (widget.nextLesson != null) ...[
            Text(
              'TOMORROW AWAITS',
              style: GoogleFonts.cinzel(
                fontSize: 12,
                letterSpacing: 4,
                color: CodexPalette.gold,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 12),
            TeaserCard(
              nextLesson: widget.nextLesson,
              hook: widget.nextLesson!.teaserHook ??
                  'Another chapter of the codex awaits.',
              quote: widget.nextLesson!.teaserQuote ??
                  '"The next page turns on its own."',
              alreadyUnlocked: state.isDayUnlocked(widget.nextLesson!.day),
            ),
            const SizedBox(height: 16),
            const InkDivider(),
            const SizedBox(height: 16),
            Center(
              child: Text(
                'RETURN TOMORROW TO UNLOCK',
                style: GoogleFonts.cinzel(
                  fontSize: 11,
                  letterSpacing: 4,
                  color: CodexPalette.textOnInkDim,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ] else ...[
            const InkDivider(),
            const SizedBox(height: 20),
            Center(
              child: Text(
                'YOU HAVE READ THE FINAL CHAPTER',
                style: GoogleFonts.cinzel(
                  fontSize: 12,
                  letterSpacing: 4,
                  color: CodexPalette.gold,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'The codex is complete. Re-read, re-live, re-share.',
              textAlign: TextAlign.center,
              style: GoogleFonts.cormorantGaramond(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                color: CodexPalette.textOnInk,
                height: 1.4,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _ActionsRow extends StatelessWidget {
  final bool isSharing;
  final bool alreadyShared;
  final VoidCallback onShare;
  final VoidCallback onContinue;
  final VoidCallback onReplay;
  final VoidCallback? onVideo;
  final VoidCallback? onQuiz;

  const _ActionsRow({
    required this.isSharing,
    required this.alreadyShared,
    required this.onShare,
    required this.onContinue,
    required this.onReplay,
    this.onVideo,
    this.onQuiz,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _ActionButton(
                icon: Icons.share_rounded,
                label: alreadyShared ? 'SHARED' : 'SHARE',
                onTap: isSharing || alreadyShared ? null : onShare,
                filled: true,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _ActionButton(
                icon: Icons.replay_rounded,
                label: 'REPLAY',
                onTap: onReplay,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: _ActionButton(
                icon: Icons.play_circle_outline_rounded,
                label: 'VIDEOS',
                onTap: onVideo,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _ActionButton(
                icon: Icons.psychology_rounded,
                label: 'EXAM',
                onTap: onQuiz,
              ),
            ),
          ],
        ),
        const SizedBox(height: 18),
        SizedBox(
          width: double.infinity,
          height: 48,
          child: FilledButton(
            onPressed: onContinue,
            style: FilledButton.styleFrom(
              backgroundColor: CodexPalette.gold,
              foregroundColor: CodexPalette.inkBlack,
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
            ),
            child: Text(
              'RETURN TO THE CODEX',
              style: GoogleFonts.cinzel(
                fontSize: 12,
                letterSpacing: 4,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;
  final bool filled;
  const _ActionButton({
    required this.icon,
    required this.label,
    this.onTap,
    this.filled = false,
  });

  @override
  Widget build(BuildContext context) {
    final disabled = onTap == null;
    return Material(
      color: filled
          ? (disabled ? CodexPalette.inkHigher : CodexPalette.gold)
          : Colors.transparent,
      borderRadius: BorderRadius.circular(2),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(2),
        child: Container(
          height: 48,
          decoration: BoxDecoration(
            border: Border.all(
              color: disabled
                  ? CodexPalette.inkHigher
                  : CodexPalette.gold,
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(2),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 16,
                color: filled
                    ? (disabled
                        ? CodexPalette.textOnInkDim
                        : CodexPalette.inkBlack)
                    : (disabled
                        ? CodexPalette.textOnInkDim
                        : CodexPalette.gold),
              ),
              const SizedBox(width: 8),
              Text(
                label,
                style: GoogleFonts.cinzel(
                  fontSize: 12,
                  letterSpacing: 3,
                  fontWeight: FontWeight.w700,
                  color: filled
                      ? (disabled
                          ? CodexPalette.textOnInkDim
                          : CodexPalette.inkBlack)
                      : (disabled
                          ? CodexPalette.textOnInkDim
                          : CodexPalette.gold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
