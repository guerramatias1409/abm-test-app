import 'package:flutter/material.dart';
import 'package:test_app/themes/themes.dart';

class AppText {
  AppText._();

  static Text h1({
    required String label,
    TextAlign? textAlign,
    Color color = AppThemeColors.primaryBlack,
  }) =>
      Text(
        label,
        textAlign: textAlign,
        style: AppThemeTexts.h1(
          color: color,
        ),
      );

  static Text h2({
    required String label,
    TextAlign? textAlign,
    Color color = AppThemeColors.primaryBlack,
  }) =>
      Text(
        label,
        textAlign: textAlign,
        style: AppThemeTexts.h2(
          color: color,
        ),
      );

  static Text h3({
    required String label,
    TextAlign? textAlign,
    Color color = AppThemeColors.primaryBlack,
  }) =>
      Text(
        label,
        textAlign: textAlign,
        style: AppThemeTexts.h3(
          color: color,
        ),
      );

  static Text h4({
    required String label,
    TextAlign? textAlign,
    Color color = AppThemeColors.primaryBlack,
  }) =>
      Text(
        label,
        textAlign: textAlign,
        style: AppThemeTexts.h4(
          color: color,
        ),
      );

  static Text h5({
    required String label,
    TextAlign? textAlign,
    Color color = AppThemeColors.primaryBlack,
  }) =>
      Text(
        label,
        textAlign: textAlign,
        style: AppThemeTexts.h5(
          color: color,
        ),
      );

  static Text h6({
    required String label,
    TextAlign? textAlign,
    Color color = AppThemeColors.primaryBlack,
  }) =>
      Text(
        label,
        textAlign: textAlign,
        style: AppThemeTexts.h6(
          color: color,
        ),
      );

  static Text body1({
    required String label,
    TextAlign? textAlign,
    Color color = AppThemeColors.primaryBlack,
  }) =>
      Text(
        label,
        textAlign: textAlign,
        style: AppThemeTexts.body1(
          color: color,
        ),
      );

  static Text body2({
    required String label,
    TextAlign? textAlign,
    Color color = AppThemeColors.primaryBlack,
  }) =>
      Text(
        label,
        textAlign: textAlign,
        style: AppThemeTexts.body2(
          color: color,
        ),
      );

  static Text body3({
    required String label,
    TextAlign? textAlign,
    Color color = AppThemeColors.primaryBlack,
  }) =>
      Text(
        label,
        textAlign: textAlign,
        style: AppThemeTexts.body3(
          color: color,
        ),
      );

  static Text caption({
    required String label,
    TextAlign? textAlign,
    Color color = AppThemeColors.primaryBlack,
  }) =>
      Text(
        label,
        textAlign: textAlign,
        style: AppThemeTexts.caption(
          color: color,
        ),
      );
}
