import 'package:flutter/material.dart';
import '../theme.dart';

/// A gold-bordered horizontal rule with a centered diamond ornament.
/// Used as a section divider that feels inscribed.
class InkDivider extends StatelessWidget {
  final double thickness;
  final EdgeInsets margin;

  const InkDivider({
    super.key,
    this.thickness = 0.5,
    this.margin = const EdgeInsets.symmetric(vertical: 24),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: thickness,
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
          ),
          const SizedBox(width: 10),
          const Icon(Icons.diamond_outlined, size: 10, color: CodexPalette.gold),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              height: thickness,
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
          ),
        ],
      ),
    );
  }
}
