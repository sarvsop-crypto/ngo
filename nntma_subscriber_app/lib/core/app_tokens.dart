import 'package:flutter/material.dart';

class AppTokens {
  static const Color primary = Color(0xFF0A2D58);
  static const Color primaryDark = Color(0xFF041B33);
  static const Color accent = Color(0xFFFCC63A);
  static const Color accentSoft = Color(0xFFEAF4FF);
  static const Color navy = Color(0xFF041B33);
  static const Color bg = Color(0xFFF5F7FB);
  static const Color surface = Colors.white;
  static const Color text = Color(0xFF071A31);
  static const Color textMuted = Color(0xFF4A5464);
  static const Color textSoft = Color(0xFF7A8797);
  static const Color textFooter = Color(0xFF9CB1CB);
  static const Color border = Color(0xFFD2DCEB);
  static const Color govSectionBg = Color(0xFFEFF4FA);

  static const double radiusMd = 12;
  static const BoxShadow cardShadow = BoxShadow(
    color: Color(0x14000000),
    blurRadius: 24,
    offset: Offset(0, 4),
  );
  static const List<BoxShadow> cardShadows = [
    BoxShadow(color: Color(0x05000000), blurRadius: 4, offset: Offset(0, 1)),
    BoxShadow(color: Color(0x14000000), blurRadius: 20, offset: Offset(0, 6)),
  ];
}

class AppSpace {
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 24;
}
