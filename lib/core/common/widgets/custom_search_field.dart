import 'package:annill/core/utils/constants/app_colors.dart';
import 'package:annill/core/utils/constants/app_sizer.dart';
import 'package:flutter/material.dart';

class CustomSearchField extends StatelessWidget {
  final Function(String)? onChanged;
  final Function()? onSuffixIconTap;
  final Function()? onPrefixIconTap;
  final Function(String)? onSubmitted;
  final String hintText;
  final double borderRadius;
  final Color borderColor;
  final Color fillColor;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final IconData? suffixIconData;
  final IconData? prefixIconData;
  final Color? suffixIconColor;
  final Color? prefixIconColor;
  final double? suffixIconSize;
  final double? prefixIconSize;
  final TextEditingController? controller;
  final bool autoFocus;
  final String? initialValue;
  final TextInputType? keyboardType;
  final int? maxLines;
  final int? maxLength;
  final bool obscureText;
  final TextInputAction? textInputAction;

  const CustomSearchField({
    super.key,
    this.onChanged,
    this.onSuffixIconTap,
    this.onPrefixIconTap,
    this.onSubmitted,
    this.hintText = "Search",
    this.borderRadius = 33,
    this.borderColor = Colors.grey,
    this.fillColor = Colors.white,
    this.suffixIcon,
    this.prefixIcon,
    this.suffixIconData,
    this.prefixIconData,
    this.suffixIconColor,
    this.prefixIconColor,
    this.suffixIconSize,
    this.prefixIconSize,
    this.controller,
    this.autoFocus = false,
    this.initialValue,
    this.keyboardType,
    this.maxLines = 1,
    this.maxLength,
    this.obscureText = false,
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      autofocus: autoFocus,
      keyboardType: keyboardType,
      maxLines: maxLines,
      maxLength: maxLength,
      obscureText: obscureText,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: AppColors.placeHolder,
          fontSize: 14.sp,
        ),
        prefixIcon: _buildPrefixIcon(),
        suffixIcon: _buildSuffixIcon(),
        filled: true,
        fillColor: fillColor,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: borderColor, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: borderColor, width: 1.5),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        counterText: "", // Hide maxLength counter
      ),
    );
  }

  Widget? _buildPrefixIcon() {
    if (prefixIcon != null) {
      return _buildIconWithGestureDetector(
        prefixIcon!,
        onPrefixIconTap,
      );
    } else if (prefixIconData != null) {
      return _buildIconWithGestureDetector(
        Icon(
          prefixIconData,
          color: prefixIconColor ?? AppColors.placeHolder,
          size: prefixIconSize ?? 20,
        ),
        onPrefixIconTap,
      );
    } else {
      return _buildIconWithGestureDetector(
        const Icon(Icons.search, color: AppColors.placeHolder),
        onPrefixIconTap,
      );
    }
  }

  Widget? _buildSuffixIcon() {
    if (suffixIcon != null) {
      return _buildIconWithGestureDetector(
        suffixIcon!,
        onSuffixIconTap,
      );
    } else if (suffixIconData != null) {
      return _buildIconWithGestureDetector(
        Icon(
          suffixIconData,
          color: suffixIconColor ?? AppColors.placeHolder,
          size: suffixIconSize ?? 20,
        ),
        onSuffixIconTap,
      );
    }
    return null;
  }

  Widget _buildIconWithGestureDetector(Widget icon, Function()? onTap) {
    if (onTap != null) {
      return GestureDetector(
        onTap: onTap,
        child: icon,
      );
    }
    return icon;
  }
}
