import 'package:flutter/material.dart';

abstract class AppColors {
  AppColors._();

  static const Color background = Color(0xFFFFFFFF);
  static const Color surface = Color(0xFFF2F2F2);
  static const Color textPrimary = Color(0xFF000000);
  static const Color textSecondary = Color(0xFF616161);

  static const Color primary = Color(0xFF000000);
  static const Color onPrimary = Color(0xFFFFFFFF);

  static const Color error = Color(0xFFDC2626);
  static const Color onError = Color(0xFFFFFFFF);

  static const Color success = Color(0xFF059669);

  static const Color accentBlue = Color(0xFF2563EB);
  static const Color onAccent = Color(0xFFFFFFFF);

  static const Color focus = Color(0xFF007AFF);
  static const Color transparent = Color(0x00000000);
  static const Color outline = Color(0xFF616161);
}
