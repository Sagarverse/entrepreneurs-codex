// Centralized theme for The Entrepreneur's Codex.
//
// The visual world is a leather-bound manual the user uncovered:
//   - Deep ink-black background
//   - Aged gold accents (with deeper crimson for emphasis)
//   - Cinzel for chapter headings (inscribed feel)
//   - Cormorant Garamond for body (readable serif)
//   - Inter for UI chrome (small labels, chips, numbers)

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CodexPalette {
  static const inkBlack = Color(0xFF0A0A0F);
  static const inkRaised = Color(0xFF13131A);
  static const inkHigher = Color(0xFF1C1C24);
  static const inkPeak = Color(0xFF25252E);

  // Aged gold
  static const gold = Color(0xFFC9A961);
  static const goldBright = Color(0xFFE5C77A);
  static const goldDeep = Color(0xFF8B7430);

  // Parchment for cards
  static const parchment = Color(0xFFEDE3CB);
  static const parchmentDim = Color(0xFF8A7E66);

  // Blood-red seal (used very sparingly)
  static const sealRed = Color(0xFF8B1A1A);
  static const sealRedBright = Color(0xFFB22222);

  // Text on ink
  static const textOnInk = Color(0xFFEDE3CB);
  static const textOnInkDim = Color(0xFF8A7E66);
}

class CodexTheme {
  static ThemeData build() {
    const scheme = ColorScheme.dark(
      surface: CodexPalette.inkBlack,
      onSurface: CodexPalette.textOnInk,
      surfaceContainerLowest: CodexPalette.inkBlack,
      surfaceContainerLow: CodexPalette.inkRaised,
      surfaceContainer: CodexPalette.inkRaised,
      surfaceContainerHigh: CodexPalette.inkHigher,
      surfaceContainerHighest: CodexPalette.inkPeak,
      onSurfaceVariant: CodexPalette.textOnInkDim,
      primary: CodexPalette.gold,
      onPrimary: CodexPalette.inkBlack,
      primaryContainer: CodexPalette.goldDeep,
      onPrimaryContainer: CodexPalette.goldBright,
      secondary: CodexPalette.gold,
      onSecondary: CodexPalette.inkBlack,
      tertiary: CodexPalette.goldBright,
      onTertiary: CodexPalette.inkBlack,
      error: CodexPalette.sealRedBright,
      onError: Color(0xFFFFFFFF),
      outline: CodexPalette.goldDeep,
      outlineVariant: Color(0xFF33333D),
    );

    final base = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: scheme,
      scaffoldBackgroundColor: CodexPalette.inkBlack,
    );

    final cinzel = GoogleFonts.cinzelTextTheme(base.textTheme);
    final cormorant = GoogleFonts.cormorantGaramondTextTheme(base.textTheme);
    final inter = GoogleFonts.interTextTheme(base.textTheme);

    return base.copyWith(
      textTheme: TextTheme(
        // Big display / chapter titles — Cinzel, inscribed
        displayLarge: cinzel.displayLarge?.copyWith(
            color: CodexPalette.goldBright,
            fontWeight: FontWeight.w700,
            letterSpacing: 2.0),
        displayMedium: cinzel.displayMedium?.copyWith(
            color: CodexPalette.goldBright,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.5),
        displaySmall: cinzel.displaySmall?.copyWith(
            color: CodexPalette.gold, fontWeight: FontWeight.w700),
        headlineLarge: cinzel.headlineLarge?.copyWith(
            color: CodexPalette.goldBright, fontWeight: FontWeight.w700),
        headlineMedium: cinzel.headlineMedium?.copyWith(
            color: CodexPalette.goldBright, fontWeight: FontWeight.w700),
        headlineSmall: cinzel.headlineSmall?.copyWith(
            color: CodexPalette.gold, fontWeight: FontWeight.w700),

        // Titles — Cinzel
        titleLarge:
            cinzel.titleLarge?.copyWith(color: CodexPalette.gold, fontWeight: FontWeight.w700),
        titleMedium:
            cinzel.titleMedium?.copyWith(color: CodexPalette.gold, fontWeight: FontWeight.w600),
        titleSmall:
            cinzel.titleSmall?.copyWith(color: CodexPalette.gold, fontWeight: FontWeight.w600),

        // Body — Cormorant Garamond (readable serif, generous line-height)
        bodyLarge: cormorant.bodyLarge?.copyWith(
            color: CodexPalette.textOnInk, fontSize: 18, height: 1.55),
        bodyMedium: cormorant.bodyMedium?.copyWith(
            color: CodexPalette.textOnInk, fontSize: 16, height: 1.5),
        bodySmall: cormorant.bodySmall?.copyWith(
            color: CodexPalette.textOnInkDim, fontSize: 14, height: 1.4),

        // Labels / chips / numbers — Inter (small, precise)
        labelLarge: inter.labelLarge?.copyWith(
            color: CodexPalette.gold, fontWeight: FontWeight.w600, letterSpacing: 1.0),
        labelMedium: inter.labelMedium?.copyWith(
            color: CodexPalette.gold, fontWeight: FontWeight.w600, letterSpacing: 1.0),
        labelSmall: inter.labelSmall?.copyWith(
            color: CodexPalette.textOnInkDim, fontWeight: FontWeight.w500, letterSpacing: 1.0),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: CodexPalette.inkBlack,
        foregroundColor: CodexPalette.gold,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        titleTextStyle: cinzel.titleMedium?.copyWith(
          color: CodexPalette.gold,
          fontWeight: FontWeight.w700,
          letterSpacing: 2.0,
          fontSize: 16,
        ),
        iconTheme: const IconThemeData(color: CodexPalette.gold),
      ),
      iconTheme: const IconThemeData(color: CodexPalette.gold),
      dividerTheme: const DividerThemeData(
        color: Color(0xFF33333D),
        thickness: 1,
        space: 1,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: CodexPalette.gold,
          foregroundColor: CodexPalette.inkBlack,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
          textStyle: cinzel.titleSmall?.copyWith(
              fontWeight: FontWeight.w700, letterSpacing: 2.0, fontSize: 13),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: CodexPalette.gold,
          side: const BorderSide(color: CodexPalette.gold, width: 1),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
          textStyle: cinzel.titleSmall?.copyWith(
              fontWeight: FontWeight.w600, letterSpacing: 2.0, fontSize: 12),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: CodexPalette.gold),
      ),
      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: CodexPalette.inkPeak,
        contentTextStyle: TextStyle(color: CodexPalette.textOnInk),
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: CodexPalette.gold,
        linearTrackColor: Color(0xFF25252E),
      ),
      cardTheme: CardThemeData(
        color: CodexPalette.inkRaised,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: const BorderSide(color: CodexPalette.goldDeep, width: 0.5),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: CodexPalette.inkRaised,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(2),
          borderSide: const BorderSide(color: CodexPalette.goldDeep),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(2),
          borderSide: const BorderSide(color: CodexPalette.gold, width: 1),
        ),
        hintStyle: cormorant.bodyMedium?.copyWith(color: CodexPalette.textOnInkDim),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: CodexPalette.inkRaised,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: const BorderSide(color: CodexPalette.goldDeep),
        ),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: CodexPalette.inkRaised,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(4)),
          side: BorderSide(color: CodexPalette.goldDeep, width: 0.5),
        ),
      ),
    );
  }
}

/// Convenience extension: every text style has its `copyWith` augmented with
/// a `letterSpacing` that's expected for the codex aesthetic.
extension CodexTextStyle on TextStyle {
  TextStyle get inscribed => copyWith(letterSpacing: 2.0, fontWeight: FontWeight.w700);
  TextStyle get whispered => copyWith(color: CodexPalette.textOnInkDim, fontStyle: FontStyle.italic);
}
