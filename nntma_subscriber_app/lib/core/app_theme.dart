import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_tokens.dart';

ThemeData buildAppTheme() {
  final base = ThemeData(useMaterial3: true);

  final scheme = ColorScheme.fromSeed(seedColor: AppTokens.primary).copyWith(
    background: AppTokens.bg,
    surface: AppTokens.surface,
    onSurface: AppTokens.text,
    primary: AppTokens.primary,
    primaryContainer: AppTokens.primaryDark,
    secondary: AppTokens.accent,
    onPrimary: Colors.white,
  );

  final textTheme = GoogleFonts.manropeTextTheme(base.textTheme).apply(
    bodyColor: AppTokens.text,
    displayColor: AppTokens.text,
  );

  return base.copyWith(
    colorScheme: scheme,
    scaffoldBackgroundColor: AppTokens.bg,
    textTheme: textTheme,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppTokens.navy,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    dividerTheme: const DividerThemeData(color: AppTokens.border, thickness: 1),
    cardTheme: CardThemeData(
      color: AppTokens.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      shadowColor: AppTokens.cardShadow.color,
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: AppTokens.accent,
        foregroundColor: Colors.black87,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: const TextStyle(fontWeight: FontWeight.w700),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppTokens.primary,
        side: const BorderSide(color: AppTokens.border),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        textStyle: const TextStyle(fontWeight: FontWeight.w600),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppTokens.surface,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppTokens.border),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppTokens.border),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
      labelStyle: const TextStyle(color: AppTokens.textMuted),
    ),
  );
}
