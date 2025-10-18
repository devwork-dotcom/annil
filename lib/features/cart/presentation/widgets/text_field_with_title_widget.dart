
import 'package:annill/core/common/widgets/custom_text.dart';
import 'package:annill/core/utils/constants/app_colors.dart';
import 'package:annill/core/utils/constants/app_sizer.dart';
import 'package:flutter/material.dart';

class CustomTextFieldWithTitle extends StatelessWidget {
  final String? title;
  final String? hintText;
  final TextEditingController controller;
  final double borderWidth;
  final double borderRadius;
  final double fontSize;
  final FontWeight fontWeight;
  final Color textColor;
  final Color borderColor;
  final bool isRequired;
  final TextInputType? keyboardType;
  final int? maxLines;
  final Widget? suffixIcon;
  final bool obscureText;
  final String? Function(String?)? validator;

  const CustomTextFieldWithTitle({
    Key? key,
    this.title,
    required this.controller,
    this.hintText,
    this.borderWidth = 1,
    this.borderRadius = 10,
    this.fontSize = 12,
    this.fontWeight = FontWeight.w400,
    this.textColor = AppColors.textPrimary,
    this.borderColor = AppColors.borderColors,
    this.isRequired = false,
    this.keyboardType,
    this.maxLines = 1,
    this.suffixIcon,
    this.obscureText = false,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null && title!.isNotEmpty) ...[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                children: [
                  CustomText(
                    text: title!,
                    fontWeight: fontWeight,
                    fontSize: fontSize,
                    color: textColor,
                  ),
                  if (isRequired)
                    CustomText(
                      text: " *",
                      fontWeight: fontWeight,
                      fontSize: fontSize,
                      color: Colors.red,
                    ),
                ],
              ),
            ),
            SizedBox(height: 3.h),
          ],

          // TextField
          TextField(
            controller: controller,
            keyboardType: keyboardType,
            maxLines: maxLines,
            obscureText: obscureText,
            style: TextStyle(
              fontSize: fontSize.sp,
            ),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                fontSize: fontSize.sp,
                color: Colors.grey.shade500,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide(
                  width: borderWidth.w,
                  color: borderColor,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide(
                  width: borderWidth.w,
                  color: borderColor,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide(
                  width: borderWidth.w,
                  color: borderColor,
                ),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 12.w,
                vertical: 12.h,
              ),
              suffixIcon: suffixIcon,
            ),
          ),
        ],
      ),
    );
  }
}