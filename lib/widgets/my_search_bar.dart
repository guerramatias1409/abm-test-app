import 'package:flutter/material.dart';
import 'package:test_app/extensions/extensions.dart';
import 'package:test_app/themes/themes.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar({
    required this.hintText,
    required this.onChanged,
    this.preffixIcon,
    super.key,
  });

  final String hintText;
  final IconData? preffixIcon;
  final Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: TextField(
        cursorColor: AppThemeColors.generalBlackDisabled,
        textInputAction: TextInputAction.search,
        autofocus: false,
        onChanged: onChanged,
        maxLines: 1,
        controller: TextEditingController(),
        keyboardType: TextInputType.text,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 15),
          fillColor: AppThemeColors.primaryWhite,
          filled: true,
          isCollapsed: true,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppThemeColors.grayDark,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(68),
          ),
          hintText: hintText,
          hintStyle: AppThemeTexts.body2(
            color: AppThemeColors.grayDark,
          ).w500,
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppThemeColors.grayDark,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(68),
          ),
          prefixIcon: preffixIcon != null
              ? Padding(
                  padding: const EdgeInsets.only(left: 16, right: 8),
                  child: Icon(
                    preffixIcon,
                    size: 18,
                    color: AppThemeColors.grayDark,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
