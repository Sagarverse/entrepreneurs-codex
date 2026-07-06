import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../services/codex_audio.dart';
import '../theme.dart';

/// A full-screen, atmospheric text animator with **video-edit smoothness**.
///
/// Each line of [lines] is revealed **as a whole unit**: a line starts
/// invisible and shifted down 18px, then fades in and slides up to its
/// final position with a long easeOutCubic curve (~1.4s). Lines come in
/// one at a time with a small pause between them — a cinematic
/// "cross-dissolve up" feel rather than a per-word typewriter effect.
///
/// Surrounding composition:
///   1. Breathing radial vignette
///   2. Faint rotating seal watermark
///   3. Hairline gold border that breathes with the vignette
///   4. Top + bottom ornaments
///   5. Pulsing "TAP TO CONTINUE" hint when finished (non-auto mode)
class CinematicIntro extends StatefulWidget {
  final List<String> lines;
  final String? bookendTop;
  final String? bookendBottom;
  final Duration lineStagger; // delay between starting each line
  final Duration lineDuration; // how long one line takes to fade in
  final Duration linePause; // hold after a line finishes
  final VoidCallback? onComplete;
  final bool autoAdvance;
  final int? chapter;

  const CinematicIntro({
    super.key,
    required this.lines,
    this.bookendTop,
    this.bookendBottom,
    this.lineStagger = const Duration(milliseconds: 400),
    this.lineDuration = const Duration(milliseconds: 900),
    this.linePause = const Duration(milliseconds: 500),
    this.onComplete,
    this.autoAdvance = true,
    this.chapter,
  });

  @override
  State<CinematicIntro> createState() => _CinematicIntroState();
}

class _CinematicIntroState extends State<CinematicIntro>
    with TickerProviderStateMixin {
  /// Per-line AnimationControllers that smoothly drive 0 → 1.
  late final List<AnimationController> _lineControllers;
  /// Whether each line has started its animation yet (-1 = not started).
  late final List<bool> _lineStarted;
  bool _finished = false;
  bool _navigated = false;
  late final AnimationController _vignetteCtrl;
  late final AnimationController _sealCtrl;

  @override
  void initState() {
    super.initState();
    _lineControllers = List.generate(
      widget.lines.length,
      (i) => AnimationController(
        vsync: this,
        duration: widget.lineDuration,
      ),
    );
    _lineStarted = List<bool>.filled(widget.lines.length, false);
    _vignetteCtrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    )..repeat(reverse: true);
    _sealCtrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 30),
    )..repeat();
    _sequence();
  }

  @override
  void dispose() {
    for (final c in _lineControllers) {
      c.dispose();
    }
    _vignetteCtrl.dispose();
    _sealCtrl.dispose();
    super.dispose();
  }

  Future<void> _sequence() async {
    CodexAudio.instance.bell(scale: 0.6);
    await Future.delayed(const Duration(milliseconds: 600));
    for (var li = 0; li < widget.lines.length; li++) {
      if (!mounted) return;
      // Mark the line as started and kick off the smooth animation.
      setState(() => _lineStarted[li] = true);
      _lineControllers[li].forward();
      // Wait for the animation to complete.
      await _lineControllers[li].forward().orCancel.catchError((_) {});
      if (!mounted) return;
      // Hold after the line finishes before starting the next.
      await Future.delayed(widget.linePause);
    }
    if (!mounted) return;
    setState(() => _finished = true);
    if (widget.autoAdvance) {
      await Future.delayed(const Duration(milliseconds: 2400));
      if (!mounted || _navigated) return;
      _navigated = true;
      widget.onComplete?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_navigated) return;
        _navigated = true;
        widget.onComplete?.call();
      },
      child: Stack(
        children: [
          Positioned.fill(
            child: AnimatedBuilder(
              animation: _vignetteCtrl,
              builder: (context, child) {
                final t = _vignetteCtrl.value;
                return Container(
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      radius: 0.95,
                      colors: const [
                        CodexPalette.inkRaised,
                        CodexPalette.inkBlack,
                        Colors.black,
                      ],
                      stops: [0.0, 0.55 + 0.15 * t, 1.0],
                    ),
                  ),
                );
              },
            ),
          ),
          Positioned.fill(
            child: Center(
              child: AnimatedBuilder(
                animation: _sealCtrl,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: _sealCtrl.value * 6.28318,
                    child: Opacity(
                      opacity: 0.05,
                      child: Container(
                        width: 360,
                        height: 360,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                              Border.all(color: CodexPalette.gold, width: 1.5),
                        ),
                        child: Center(
                          child: Text(
                            '✦',
                            style: GoogleFonts.cinzel(
                              fontSize: 180,
                              color: CodexPalette.gold,
                              fontWeight: FontWeight.w800,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Positioned.fill(
            child: IgnorePointer(
              child: AnimatedBuilder(
                animation: _vignetteCtrl,
                builder: (context, child) {
                  // Subtle inner glow on the edges, no hard gold border.
                  return IgnorePointer(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: RadialGradient(
                          radius: 1.0,
                          colors: [
                            Colors.transparent,
                            Colors.transparent,
                            Colors.black.withValues(alpha: 0.35 *
                                (1 - _vignetteCtrl.value)),
                          ],
                          stops: const [0.0, 0.7, 1.0],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 40, vertical: 56),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.bookendTop != null)
                    _FadingIn(
                      visible: _lineStarted.isNotEmpty && _lineStarted[0],
                      duration: const Duration(milliseconds: 1400),
                      child: _TopOrnament(
                        chapter: widget.chapter,
                        label: widget.bookendTop!,
                      ),
                    ),
                  const Spacer(),
                  // Use Flexible to prevent overflow when text is long.
                  Flexible(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(widget.lines.length, (li) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: _LineReveal(
                              text: widget.lines[li],
                              style: GoogleFonts.cormorantGaramond(
                                fontSize: 22,
                                height: 1.40,
                                color: CodexPalette.textOnInk,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.3,
                                decoration: TextDecoration.none,
                              ),
                              // Drive the animation from the actual controller
                              // so the interpolation is smooth every frame.
                              controller: _lineControllers[li],
                              started: _lineStarted[li],
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                  const Spacer(),
                  if (widget.bookendBottom != null)
                    _FadingIn(
                      visible: _finished,
                      duration: const Duration(milliseconds: 1400),
                      child: _BottomOrnament(label: widget.bookendBottom!),
                    ),
                  if (_finished && !widget.autoAdvance) ...[
                    const SizedBox(height: 16),
                    const Center(child: _PulseHint(text: 'TAP TO CONTINUE')),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// A single line that fades + slides up as a single unit. Now driven by
/// an actual [AnimationController] so every frame is smoothly interpolated —
/// no jump from 0 to 1, just a continuous easeOutCubic curve.
class _LineReveal extends StatelessWidget {
  final String text;
  final TextStyle style;
  final AnimationController controller;
  final bool started;

  const _LineReveal({
    required this.text,
    required this.style,
    required this.controller,
    required this.started,
  });

  @override
  Widget build(BuildContext context) {
    if (!started) {
      // Not started yet — reserve space with fully transparent text.
      return Opacity(
        opacity: 0,
        child: Text(
          text,
          style: style,
          softWrap: true,
          overflow: TextOverflow.visible,
        ),
      );
    }
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        // Long, soft easeOutCubic. Same curve regardless of the duration so
        // multiple lines feel like a coordinated edit, not random speeds.
        const curve = Curves.easeOutCubic;
        final t = curve.transform(controller.value.clamp(0.0, 1.0));

        // 18px upward slide + opacity 0→1 + tiny scale 0.96→1.0 for the
        // "settling in" feel of a video cross-dissolve.
        final slide = (1.0 - t) * 18.0;
        final scale = 0.96 + 0.04 * t;
        return IgnorePointer(
          ignoring: controller.value < 0.05,
          child: Opacity(
            opacity: t,
            child: Transform.translate(
              offset: Offset(0, slide),
              child: Transform.scale(
                scale: scale,
                child: child,
              ),
            ),
          ),
        );
      },
      child: Text(
        text,
        style: style,
        softWrap: true,
        overflow: TextOverflow.visible,
      ),
    );
  }
}

class _FadingIn extends StatelessWidget {
  final bool visible;
  final Duration duration;
  final Widget child;
  const _FadingIn({
    required this.visible,
    required this.duration,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !visible,
      child: AnimatedOpacity(
        duration: duration,
        curve: Curves.easeOutCubic,
        opacity: visible ? 1 : 0,
        child: AnimatedSlide(
          duration: duration,
          curve: Curves.easeOutCubic,
          offset: visible ? Offset.zero : const Offset(0, 0.10),
          child: child,
        ),
      ),
    );
  }
}

class _TopOrnament extends StatelessWidget {
  final int? chapter;
  final String label;
  const _TopOrnament({this.chapter, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(width: 40, height: 0.5, color: CodexPalette.gold),
        const SizedBox(height: 14),
        Text(
          label.toUpperCase(),
          style: GoogleFonts.cinzel(
            fontSize: 11,
            color: CodexPalette.gold,
            letterSpacing: 5,
            fontWeight: FontWeight.w800,
            decoration: TextDecoration.none,
          ),
        ),
        if (chapter != null) ...[
          const SizedBox(height: 4),
          Text(
            'CHAPTER ${romanChapter(chapter!)}',
            style: GoogleFonts.cinzel(
              fontSize: 10,
              color: CodexPalette.textOnInkDim,
              letterSpacing: 3,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.none,
            ),
          ),
        ],
      ],
    );
  }
}

class _BottomOrnament extends StatelessWidget {
  final String label;
  const _BottomOrnament({required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(width: 40, height: 0.5, color: CodexPalette.gold),
        const SizedBox(height: 12),
        Text(
          label,
          style: GoogleFonts.cinzel(
            fontSize: 11,
            color: CodexPalette.gold,
            letterSpacing: 5,
            fontWeight: FontWeight.w800,
            decoration: TextDecoration.none,
          ),
        ),
      ],
    );
  }
}

class _PulseHint extends StatefulWidget {
  final String text;
  const _PulseHint({required this.text});
  @override
  State<_PulseHint> createState() => _PulseHintState();
}

class _PulseHintState extends State<_PulseHint>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c;
  @override
  void initState() {
    super.initState();
    _c = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _c,
      builder: (context, child) {
        return Opacity(
          opacity: 0.5 + 0.5 * _c.value,
          child: Text(
            widget.text,
            style: GoogleFonts.cinzel(
              fontSize: 11,
              color: CodexPalette.gold,
              letterSpacing: 4,
              fontWeight: FontWeight.w700,
              decoration: TextDecoration.none,
            ),
          ),
        );
      },
    );
  }
}

String romanChapter(int n) {
  if (n <= 0 || n > 30) return '$n';
  const map = [
    'I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII', 'IX', 'X',
    'XI', 'XII', 'XIII', 'XIV', 'XV', 'XVI', 'XVII', 'XVIII', 'XIX', 'XX',
    'XXI', 'XXII', 'XXIII', 'XXIV', 'XXV', 'XXVI', 'XXVII', 'XXVIII', 'XXIX', 'XXX',
  ];
  return map[n - 1];
}
