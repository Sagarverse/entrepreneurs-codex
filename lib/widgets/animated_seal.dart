import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../theme.dart';

/// An animated gold wax-seal that rotates continuously and shows a
/// progress arc along its rim representing XP progress to the next level.
///
/// The seal is the persistent visual reward in the codex — every degree of
/// rotation is a tiny, ambient acknowledgment of progress.
class AnimatedSeal extends StatefulWidget {
  final double size;
  final double progress; // 0..1
  final String glyph; // center symbol

  const AnimatedSeal({
    super.key,
    this.size = 140,
    required this.progress,
    this.glyph = '✦',
  });

  @override
  State<AnimatedSeal> createState() => _AnimatedSealState();
}

class _AnimatedSealState extends State<AnimatedSeal>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 60),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return CustomPaint(
          size: Size.square(widget.size),
          painter: _SealPainter(
            rotation: _controller.value * 2 * math.pi,
            progress: widget.progress.clamp(0.0, 1.0),
            glyph: widget.glyph,
          ),
        );
      },
    );
  }
}

class _SealPainter extends CustomPainter {
  final double rotation;
  final double progress;
  final String glyph;

  _SealPainter({
    required this.rotation,
    required this.progress,
    required this.glyph,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final radius = size.shortestSide / 2;

    // Outer wax ring
    final wax = Paint()
      ..shader = RadialGradient(
        colors: const [CodexPalette.sealRed, Color(0xFF4A0E0E)],
        center: Alignment.center,
      ).createShader(Rect.fromCircle(center: center, radius: radius));
    canvas.drawCircle(center, radius, wax);

    // Inner gold rim (rotates with the seal)
    canvas.save();
    canvas.translate(center.dx, center.dy);
    canvas.rotate(rotation);

    final rim = Paint()
      ..color = CodexPalette.gold
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(Offset.zero, radius - 8, rim);

    // Tick marks around the rim
    final tickPaint = Paint()
      ..color = CodexPalette.gold
      ..strokeWidth = 1.0
      ..strokeCap = StrokeCap.round;
    for (var i = 0; i < 60; i++) {
      final angle = (i / 60) * 2 * math.pi;
      final inner = (radius - 12) * (i % 5 == 0 ? 0.92 : 0.95);
      final outer = radius - 6;
      final p1 = Offset(math.cos(angle) * inner, math.sin(angle) * inner);
      final p2 = Offset(math.cos(angle) * outer, math.sin(angle) * outer);
      canvas.drawLine(p1, p2, tickPaint);
    }
    canvas.restore();

    // Progress arc (does NOT rotate — it's a "filling" indicator)
    final progressPaint = Paint()
      ..color = CodexPalette.goldBright
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    final rect = Rect.fromCircle(center: center, radius: radius - 14);
    canvas.drawArc(rect, -math.pi / 2, 2 * math.pi * progress, false, progressPaint);

    // Inner gold disc with the glyph
    final disc = Paint()
      ..shader = const RadialGradient(
        colors: [CodexPalette.goldBright, CodexPalette.goldDeep],
      ).createShader(Rect.fromCircle(center: center, radius: radius - 20));
    canvas.drawCircle(center, radius - 20, disc);

    // Center glyph
    final tp = TextPainter(
      text: TextSpan(
        text: glyph,
        style: TextStyle(
          color: CodexPalette.inkBlack,
          fontSize: radius * 0.5,
          fontWeight: FontWeight.w900,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    tp.paint(canvas, center - Offset(tp.width / 2, tp.height / 2));
  }

  @override
  bool shouldRepaint(covariant _SealPainter old) =>
      old.rotation != rotation ||
      old.progress != progress ||
      old.glyph != glyph;
}
