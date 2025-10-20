
import 'package:annill/core/common/widgets/custom_text.dart';
import 'package:annill/core/utils/constants/app_colors.dart';
import 'package:annill/core/utils/constants/app_sizer.dart';
import 'package:flutter/material.dart';

class CustomIconTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;

  const CustomIconTextWidget({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 16.w,
          color: AppColors.textSecondary,
        ),
        SizedBox(width: 3.w),
        Expanded(
          child: CustomText(
            text: text,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.textSecondary,
            maxLines: 3,
          ),
        ),
      ],
    );
  }
}