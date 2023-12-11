import 'package:flutter/material.dart';
import 'package:test_app/themes/themes.dart';

class MySnackBar {
  MySnackBar();

  show(BuildContext context, {required String message}) {
    var snack = SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(20),
      duration: const Duration(milliseconds: 2000),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      content: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Text(
          message,
          style: AppThemeTexts.body2(color: AppThemeColors.primaryWhite),
        ),
      ),
      showCloseIcon: true,
      backgroundColor: AppThemeColors.primaryBlack,
    );
    ScaffoldMessenger.of(context).showSnackBar(snack);
  }
}
