import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/themes/themes.dart';

class AppThemeTexts {
  static final AppThemeTexts _instance = AppThemeTexts._internal();

  factory AppThemeTexts() => _instance;

  AppThemeTexts._internal();

  static TextStyle h1({
    Color color = AppThemeColors.primaryBlack,
  }) =>
      GoogleFonts.dmSans(
        fontSize: 96,
        color: color,
      );

  static TextStyle h2({
    Color color = AppThemeColors.primaryBlack,
  }) =>
      GoogleFonts.dmSans(
        fontSize: 60,
        color: color,
      );

  static TextStyle h3({
    Color color = AppThemeColors.primaryBlack,
  }) =>
      GoogleFonts.dmSans(
        fontSize: 48,
        color: color,
      );

  static TextStyle h4({
    Color color = AppThemeColors.primaryBlack,
  }) =>
      GoogleFonts.dmSans(
        fontSize: 24,
        color: color,
      );

  static TextStyle h5({
    Color color = AppThemeColors.primaryBlack,
  }) =>
      GoogleFonts.dmSans(
        fontSize: 20,
        color: color,
      );

  static TextStyle h6({
    Color color = AppThemeColors.primaryBlack,
  }) =>
      GoogleFonts.dmSans(
        fontSize: 18,
        color: color,
      );

  static TextStyle body1({
    Color color = AppThemeColors.primaryBlack,
  }) =>
      GoogleFonts.dmSans(
        fontSize: 16,
        color: color,
      );

  static TextStyle body2({
    Color color = AppThemeColors.primaryBlack,
  }) =>
      GoogleFonts.dmSans(
        fontSize: 14,
        color: color,
      );

  static TextStyle body3({
    Color color = AppThemeColors.primaryBlack,
  }) =>
      GoogleFonts.dmSans(
        fontSize: 12,
        color: color,
      );

  static TextStyle caption({
    Color color = AppThemeColors.primaryBlack,
  }) =>
      GoogleFonts.dmSans(
        fontSize: 10,
        color: color,
      );
}
