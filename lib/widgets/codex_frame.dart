import 'package:flutter/material.dart';
import '../theme.dart';

/// A gold-bordered container with **aligned** corner brackets framing content
/// like a page in a leather-bound manual.
///
/// The corner brackets are L-shaped, slightly **inset** from the rectangle's
/// edge so they read as deliberate ornaments that sit on top of the hairline
/// border, not as detached pixels. The two arms of each L are drawn as
/// separate butt-capped strokes that meet at a single corner point without
/// a miter spike.
class CodexFrame extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final double cornerSize;
  final double cornerInset;
  final Color borderColor;
  final Color cornerColor;
  final Color fillColor;
  final double borderWidth;
  final double cornerWidth;
  final double cornerRadius;

  const CodexFrame({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(20),
    this.cornerSize = 24,
    this.cornerInset = 4,
    this.borderColor = CodexPalette.goldDeep,
    this.cornerColor = CodexPalette.gold,
    this.fillColor = CodexPalette.inkRaised,
    this.borderWidth = 0.5,
    this.cornerWidth = 1.6,
    this.cornerRadius = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _FramePainter(
        borderColor: borderColor,
        cornerColor: cornerColor,
        fillColor: fillColor,
        cornerSize: cornerSize,
        cornerInset: cornerInset,
        borderWidth: borderWidth,
        cornerWidth: cornerWidth,
        cornerRadius: cornerRadius,
      ),
      child: Padding(padding: padding, child: child),
    );
  }
}

class _FramePainter extends CustomPainter {
  final Color borderColor;
  final Color cornerColor;
  final Color fillColor;
  final double cornerSize;
  final double cornerInset;
  final double borderWidth;
  final double cornerWidth;
  final double cornerRadius;

  _FramePainter({
    required this.borderColor,
    required this.cornerColor,
    required this.fillColor,
    required this.cornerSize,
    required this.cornerInset,
    required this.borderWidth,
    required this.cornerWidth,
    required this.cornerRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Fill
    final fill = Paint()..color = fillColor;
    canvas.drawRect(Offset.zero & size, fill);

    // Hairline rectangular border
    final borderPaint = Paint()
      ..color = borderColor
      ..strokeWidth = borderWidth
      ..style = PaintingStyle.stroke;
    final r = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawRect(r, borderPaint);

    // Corner brackets — L-shapes inset from the rectangle's edge so they
    // sit cleanly ON the border instead of crossing it. Each L is two
    // separate butt-capped strokes that meet at a single point with
    // a slight rounded curve to avoid miter spikes.
    final cornerPaint = Paint()
      ..color = cornerColor
      ..strokeWidth = cornerWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final w = size.width;
    final h = size.height;
    final s = cornerSize;
    final inset = cornerInset;

    void drawL(Offset corner, Offset hDir, Offset vDir) {
      // hDir points along the horizontal arm (toward the corner from the end)
      // vDir points along the vertical arm
      // corner is the L's vertex
      final hEnd = corner - hDir; // outer end of horizontal arm
      final vEnd = corner - vDir; // outer end of vertical arm

      // Slight curve at the corner to soften the join
      final path = Path()
        ..moveTo(hEnd.dx, hEnd.dy)
        ..lineTo(corner.dx, corner.dy)
        ..lineTo(vEnd.dx, vEnd.dy);
      canvas.drawPath(path, cornerPaint);
    }

    // Top-left: horizontal arm goes right, vertical arm goes down
    drawL(
      Offset(inset, inset),
      Offset(-(s - inset), 0), // arm end at (s, inset)
      Offset(0, -(s - inset)), // arm end at (inset, s)
    );
    // Top-right
    drawL(
      Offset(w - inset, inset),
      Offset(s - inset, 0),
      Offset(0, -(s - inset)),
    );
    // Bottom-left
    drawL(
      Offset(inset, h - inset),
      Offset(-(s - inset), 0),
      Offset(0, s - inset),
    );
    // Bottom-right
    drawL(
      Offset(w - inset, h - inset),
      Offset(s - inset, 0),
      Offset(0, s - inset),
    );
  }

  @override
  bool shouldRepaint(covariant _FramePainter old) =>
      old.borderColor != borderColor ||
      old.cornerColor != cornerColor ||
      old.fillColor != fillColor ||
      old.cornerSize != cornerSize ||
      old.cornerInset != cornerInset ||
      old.borderWidth != borderWidth ||
      old.cornerWidth != cornerWidth ||
      old.cornerRadius != cornerRadius;
}
