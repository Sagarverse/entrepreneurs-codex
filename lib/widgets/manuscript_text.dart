import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme.dart';

/// Body text rendered in Cormorant Garamond with the codex line-height.
/// Use for any prose body content — sections, lessons, journal.
class ManuscriptText extends StatelessWidget {
  final String text;
  final double fontSize;
  final double height;
  final Color? color;
  final FontStyle fontStyle;
  final TextAlign textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  const ManuscriptText(
    this.text, {
    super.key,
    this.fontSize = 17,
    this.height = 1.65,
    this.color,
    this.fontStyle = FontStyle.normal,
    this.textAlign = TextAlign.start,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: GoogleFonts.cormorantGaramond(
        fontSize: fontSize,
        height: height,
        color: color ?? CodexPalette.textOnInk,
        fontStyle: fontStyle,
      ),
    );
  }
}
