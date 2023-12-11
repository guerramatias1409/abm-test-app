import 'package:flutter/material.dart';

class AppThemeColors {
  static final AppThemeColors _instance = AppThemeColors._internal();

  factory AppThemeColors() => _instance;

  AppThemeColors._internal();

  static const Color primaryBlack = Color(0xFF000000);
  static const Color primaryWhite = Color(0xFFFFFFFF);
  static const Color primaryColor = Color(0xFFE41D2C);
  static const Color grayDark = Color(0xFF292B1D);
  static const Color gray90 = Color(0xFF434545);
  static const Color black90 = Color(0xFF0D0D0D);

  static const Color generalBlackDisabled = Color(0x60080816);
  static const Color generalBlackHighEmphasis = Color(0xFF222222);
  static const Color maximumGreenYelow = Color(0xFFE4F353);
}
