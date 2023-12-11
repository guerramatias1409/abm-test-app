import 'package:flutter/material.dart';
import 'package:test_app/extensions/extensions.dart';
import 'package:test_app/themes/themes.dart';

class MyTextButton extends StatelessWidget {
  const MyTextButton({
    required this.label,
    required this.onPressed,
    super.key,
  });

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          EdgeInsets.zero,
        ),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: AppThemeTexts.body2(
          color: AppThemeColors.generalBlackDisabled,
        ).w500,
      ),
    );
  }
}
