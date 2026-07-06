import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme.dart';

/// The codex's primary call-to-action — a gold gradient button with a
/// serif inscribed label. On press, briefly bleeds into ink before release.
class GoldButton extends StatefulWidget {
  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool expanded;
  final bool compact;

  const GoldButton({
    super.key,
    required this.label,
    this.onPressed,
    this.icon,
    this.expanded = false,
    this.compact = false,
  });

  @override
  State<GoldButton> createState() => _GoldButtonState();
}

class _GoldButtonState extends State<GoldButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    final disabled = widget.onPressed == null;
    final btn = AnimatedContainer(
      duration: const Duration(milliseconds: 120),
      curve: Curves.easeOut,
      height: widget.compact ? 40 : 52,
      decoration: BoxDecoration(
        gradient: disabled
            ? null
            : LinearGradient(
                colors: _pressed
                    ? const [CodexPalette.goldDeep, CodexPalette.goldDeep]
                    : const [CodexPalette.goldBright, CodexPalette.gold],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
        color: disabled ? CodexPalette.inkPeak : null,
        boxShadow: disabled
            ? null
            : [
                BoxShadow(
                  color: CodexPalette.gold.withValues(alpha: _pressed ? 0.1 : 0.3),
                  blurRadius: 16,
                  spreadRadius: 0,
                ),
              ],
      ),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.icon != null) ...[
              Icon(widget.icon,
                  color: disabled
                      ? CodexPalette.textOnInkDim
                      : CodexPalette.inkBlack,
                  size: 18),
              const SizedBox(width: 10),
            ],
            Text(
              widget.label.toUpperCase(),
              style: GoogleFonts.cinzel(
                fontSize: widget.compact ? 11 : 13,
                fontWeight: FontWeight.w800,
                letterSpacing: 2.5,
                color: disabled
                    ? CodexPalette.textOnInkDim
                    : CodexPalette.inkBlack,
              ),
            ),
          ],
        ),
      ),
    );

    return GestureDetector(
      onTapDown: disabled ? null : (_) => setState(() => _pressed = true),
      onTapUp: disabled ? null : (_) => setState(() => _pressed = false),
      onTapCancel: disabled ? null : () => setState(() => _pressed = false),
      onTap: widget.onPressed,
      child: widget.expanded ? SizedBox(width: double.infinity, child: btn) : btn,
    );
  }
}
