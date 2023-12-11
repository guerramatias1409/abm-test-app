import 'package:flutter/material.dart';
import 'package:test_app/themes/app_theme_colors.dart';

class MyInputField extends StatelessWidget {
  const MyInputField({
    required this.hintText,
    this.obscureText = false,
    this.controller,
    this.initialValue,
    this.suffixIcon,
    this.onSuffixIconPressed,
    this.validator,
    super.key,
  });

  final String hintText;
  final bool obscureText;
  final TextEditingController? controller;
  final String? initialValue;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixIconPressed;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      cursorColor: AppThemeColors.generalBlackDisabled,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppThemeColors.generalBlackDisabled),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppThemeColors.generalBlackDisabled,
            width: 2,
          ),
        ),
        suffixIcon: suffixIcon != null && onSuffixIconPressed != null
            ? IconButton(
                onPressed: onSuffixIconPressed,
                icon: Icon(suffixIcon),
              )
            : null,
      ),
    );
  }
}
