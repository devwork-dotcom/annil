import 'package:annill/core/common/widgets/custom_text.dart';
import 'package:annill/core/utils/constants/app_colors.dart';
import 'package:annill/core/utils/constants/app_sizer.dart';
import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color titleColor;
  final Color subtitleColor;
  final double titleFontSize;
  final double subtitleFontSize;
  final FontWeight titleFontWeight;
  final FontWeight subtitleFontWeight;
  final TextAlign textAlign;
  final CrossAxisAlignment crossAxisAlignment;

  const TitleWidget({
    super.key,
    required this.title,
    required this.subtitle,
    this.titleColor = AppColors.textBold,
    this.subtitleColor = AppColors.textGrey,
    this.titleFontSize = 24,
    this.subtitleFontSize = 16,
    this.titleFontWeight = FontWeight.w700,
    this.subtitleFontWeight = FontWeight.w400,
    this.textAlign = TextAlign.center,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Center(
          child: CustomText(
            text: title,
            fontSize: titleFontSize.sp,
            fontWeight: titleFontWeight,
            color: titleColor,
            textAlign: textAlign,
          ),
        ),
        SizedBox(height: 4.h),
        Center(
          child: CustomText(
            text: subtitle,
            color: subtitleColor,
            fontSize: subtitleFontSize.sp,
            fontWeight: subtitleFontWeight,
            textAlign: textAlign,
          ),
        ),
      ],
    );
  }
}