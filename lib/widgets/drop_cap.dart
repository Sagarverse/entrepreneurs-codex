import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme.dart';

/// A drop-cap — large, gold, ornate first letter that anchors the opening
/// of a chapter. Drop it inline at the start of a paragraph.
class DropCap extends StatelessWidget {
  final String letter;
  final double size;
  final List<Widget> trailing;

  const DropCap({
    super.key,
    required this.letter,
    this.size = 84,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 6, right: 8, bottom: 0),
          child: Text(
            letter,
            style: GoogleFonts.cinzel(
              fontSize: size,
              height: 0.85,
              color: CodexPalette.goldBright,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: trailing,
          ),
        ),
      ],
    );
  }
}
