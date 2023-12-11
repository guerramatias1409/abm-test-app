import 'package:flutter/material.dart';
import 'package:test_app/extensions/extensions.dart';
import 'package:test_app/themes/themes.dart';

class MyElevatedButton extends StatelessWidget {
  const MyElevatedButton({
    required this.label,
    required this.onPressed,
    this.textVerticalPadding,
    this.isLoading = false,
    super.key,
  });

  final String label;
  final VoidCallback onPressed;
  final double? textVerticalPadding;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          AppThemeColors.primaryBlack,
        ),
      ),
      child: isLoading
          ? const Padding(
              padding: EdgeInsets.symmetric(vertical: 6),
              child: CircularProgressIndicator(
                color: AppThemeColors.primaryWhite,
              ),
            )
          : Padding(
              padding: EdgeInsets.symmetric(vertical: textVerticalPadding ?? 0),
              child: Text(
                label,
                style: AppThemeTexts.body2(
                  color: AppThemeColors.primaryWhite,
                ).w500,
              ),
            ),
    );
  }
}
