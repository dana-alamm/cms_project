import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryRed = Color(0xffED1C24);
  static const Color primaryRedDak = Color(0xFFB80710); //when Hover

  static const Color darkBg = Color(0xFF141416);
  static const Color darkBgGlow = Color(0xFF330C11);

  static const Color textDark = Color(0xFF1E2022);
  // static const Color textMuted = Color(0xFF777E90);
  static const Color textLight = Colors.white;
  static const Color labelColor = Color(0xFF353945);
  static const Color textMuted=Color(0xff71717A);
  

  static const Color scaffoldBg = Color(0xFFF8F9FA);
  static const Color cardBg = Colors.white;
  static const Color inputFill = Color(0xFFFAFAFA);
  static const Color borderLight = Color(0xFFE6E8EC);
  static const Color borderFocused = primaryRed;
  static const RadialGradient gradient = RadialGradient(
    center: Alignment(0.65, -0.8),
    radius: 1.1,
    colors: [
      Color(0xFF6A0E16),
      Color(0xFF421116),
      Color(0xFF2A1618),
      Color(0xFF1B1113),
    ],
    stops: [0.0, 0.25, 0.5, 1.0],
  );
}
