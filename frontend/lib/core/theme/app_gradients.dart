import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppGradients {
  AppGradients._();

  static const LinearGradient primary = LinearGradient(
    colors: [
      AppColors.primary,
      AppColors.secondary,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient success = LinearGradient(
    colors: [
      Color(0xFF10B981),
      Color(0xFF34D399),
    ],
  );

  static const LinearGradient danger = LinearGradient(
    colors: [
      Color(0xFFDC2626),
      Color(0xFFEF4444),
    ],
  );
}