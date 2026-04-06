import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_tokens.dart';

ThemeData buildAppTheme() {
  final base = ThemeData(useMaterial3: true);
  final txt = GoogleFonts.dmSansTextTheme(base.textTheme);

  return base.copyWith(
    scaffoldBackgroundColor: AppTokens.bg,
    colorScheme: ColorScheme.fromSeed(seedColor: AppTokens.primary),
    textTheme: txt.apply(bodyColor: AppTokens.text, displayColor: AppTokens.text),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppTokens.navy,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
  );
}
