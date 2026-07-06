import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../services/storage_service.dart';
import '../theme.dart';
import 'codex_screen.dart';

/// The onboarding — 4 cinematic stages that introduce the codex.
/// Uses slow text-fade reveals on every slide to telegraph the app's voice.
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _pageCtrl = PageController();
  int _page = 0;
  bool _fading = false;

  static const _slides = <_SlideData>[
    _SlideData(
      glyph: '✦',
      bookend: 'I · THE CODEX',
      title: 'A leather-bound manual\nfor the entrepreneur you are becoming.',
      body:
          'Thirty chapters. One transformation. Each day, a single lesson woven from a hundred years of those who built empires from nothing.',
    ),
    _SlideData(
      glyph: '✦',
      bookend: 'II · THE PATH',
      title: 'Mindset. Skill. Action.\nReflection. Monetization.',
      body:
          'Five strands. Woven into every chapter. The codex rewires how you think, then demands that you build.',
    ),
    _SlideData(
      glyph: '✦',
      bookend: 'III · THE COST',
      title: 'Fifteen minutes a day.\nStreak resets if you skip.',
      body:
          'There is no shortcut. Show up. The seal, the badges, the cinematic — they reward consistency, not intensity.',
    ),
    _SlideData(
      glyph: '✦',
      bookend: 'IV · THE INVITATION',
      title: 'The codex is yours\nwhen you decide to begin.',
      body:
          'There is no promise of ease. Only a path, and the chapters that will be waiting for you every morning for the next thirty days.',
    ),
  ];

  @override
  void dispose() {
    _pageCtrl.dispose();
    super.dispose();
  }

  Future<void> _next() async {
    if (_fading) return;
    if (_page < _slides.length - 1) {
      setState(() => _fading = true);
      await _pageCtrl.nextPage(
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeOut);
      await Future.delayed(const Duration(milliseconds: 400));
      if (mounted) setState(() => _fading = false);
    } else {
      await _finish();
    }
  }

  Future<void> _finish() async {
    final storage = context.read<StorageService>();
    await storage.setFirstLaunchComplete();
    if (!mounted) return;
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const CodexScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isLast = _page == _slides.length - 1;
    return Scaffold(
      backgroundColor: CodexPalette.inkBlack,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
              child: Row(
                children: [
                  Text(
                    'THE ENTREPRENEUR\'S CODEX',
                    style: GoogleFonts.cinzel(
                      fontSize: 10,
                      letterSpacing: 4,
                      color: CodexPalette.gold,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const Spacer(),
                  if (!isLast)
                    TextButton(
                      onPressed: _finish,
                      child: Text(
                        'SKIP',
                        style: GoogleFonts.cinzel(
                          fontSize: 11,
                          letterSpacing: 3,
                          color: CodexPalette.textOnInkDim,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageCtrl,
                onPageChanged: (i) => setState(() => _page = i),
                itemCount: _slides.length,
                itemBuilder: (context, i) {
                  return _Stage(
                    data: _slides[i],
                    key: ValueKey(_slides[i].bookend),
                  );
                },
              ),
            ),
            // Dots
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(_slides.length, (i) {
                final isActive = i == _page;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: isActive ? 22 : 8,
                  height: 3,
                  decoration: BoxDecoration(
                    color: isActive
                        ? CodexPalette.gold
                        : CodexPalette.goldDeep.withValues(alpha: 0.4),
                    borderRadius: BorderRadius.circular(2),
                  ),
                );
              }),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
              child: SizedBox(
                width: double.infinity,
                height: 52,
                child: FilledButton(
                  onPressed: _fading ? null : _next,
                  style: FilledButton.styleFrom(
                    backgroundColor: CodexPalette.gold,
                    disabledBackgroundColor: CodexPalette.inkHigher,
                    foregroundColor: CodexPalette.inkBlack,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        isLast ? 'BEGIN THE JOURNEY' : 'CONTINUE',
                        style: GoogleFonts.cinzel(
                          fontSize: 12,
                          letterSpacing: 4,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(Icons.arrow_forward_rounded, size: 16),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Stage extends StatefulWidget {
  final _SlideData data;
  const _Stage({super.key, required this.data});

  @override
  State<_Stage> createState() => _StageState();
}

class _StageState extends State<_Stage> {
  int _visible = 0;

  @override
  void initState() {
    super.initState();
    _reveal();
  }

  Future<void> _reveal() async {
    setState(() => _visible = 0);
    final counts = widget.data.lineCount;
    for (var i = 0; i < counts; i++) {
      if (!mounted) return;
      setState(() => _visible = i + 1);
      await Future.delayed(const Duration(milliseconds: 450));
    }
  }

  @override
  void didUpdateWidget(covariant _Stage old) {
    super.didUpdateWidget(old);
    if (old.data != widget.data) _reveal();
  }

  @override
  Widget build(BuildContext context) {
    final d = widget.data;
    final children = <Widget>[
      _line(d.bookend, 0, base: true),
      const SizedBox(height: 28),
      _line(d.title, 1, headline: true),
      const SizedBox(height: 16),
      _line(d.body, 2),
    ];
    return Padding(
      padding: const EdgeInsets.fromLTRB(28, 24, 28, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Glyph
          AnimatedOpacity(
            duration: const Duration(milliseconds: 500),
            opacity: _visible >= 1 ? 1 : 0,
            child: Container(
              width: 80,
              height: 80,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: CodexPalette.inkRaised,
                shape: BoxShape.circle,
                border: Border.all(color: CodexPalette.gold, width: 0.5),
              ),
              child: Text(
                d.glyph,
                style: GoogleFonts.cinzel(
                  fontSize: 36,
                  color: CodexPalette.gold,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          ...children,
        ],
      ),
    );
  }

  Widget _line(String text, int index, {bool base = false, bool headline = false}) {
    final visible = _visible > index;
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 500),
      opacity: visible ? 1 : 0,
      child: AnimatedSlide(
        duration: const Duration(milliseconds: 500),
        offset: visible ? Offset.zero : const Offset(0, 0.15),
        curve: Curves.easeOut,
        child: Text(
          text,
          style: headline
              ? GoogleFonts.cinzel(
                  fontSize: 26,
                  color: CodexPalette.goldBright,
                  fontWeight: FontWeight.w800,
                  height: 1.25,
                  letterSpacing: 1,
                )
              : (base
                  ? GoogleFonts.cinzel(
                      fontSize: 11,
                      letterSpacing: 4,
                      color: CodexPalette.gold,
                      fontWeight: FontWeight.w700,
                    )
                  : GoogleFonts.cormorantGaramond(
                      fontSize: 17,
                      color: CodexPalette.textOnInk,
                      height: 1.6,
                    )),
        ),
      ),
    );
  }
}

class _SlideData {
  final String glyph;
  final String bookend;
  final String title;
  final String body;
  const _SlideData({
    required this.glyph,
    required this.bookend,
    required this.title,
    required this.body,
  });

  int get lineCount => 3; // bookend, title, body
}
