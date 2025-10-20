import 'package:annill/core/utils/constants/app_colors.dart';
import 'package:annill/core/utils/constants/app_sizer.dart';
import 'package:flutter/material.dart';
import '../../../../core/common/widgets/custom_text.dart';

class ProfileItemCard extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  final IconData? prefixIcon;
  final Color? textColor;
  final Color? iconColor;

  const ProfileItemCard({
    super.key,
    this.onTap,
    required this.text,
    this.prefixIcon,
    this.textColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 44.h,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 5.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (prefixIcon != null)
              Icon(
                prefixIcon,
                size: 24.w,
                color: iconColor ?? AppColors.textSecondary.withOpacity(0.5),
              ),

            if (prefixIcon != null) SizedBox(width: 8.w),

            // Text
            CustomText(
              text: text,
              color: textColor ?? AppColors.textPrimary,
              fontSize: 16.sp,
            ),

            Spacer(),

            // Arrow icon
            Icon(
              Icons.arrow_forward_ios_outlined,
              size: 20.w,
              color: AppColors.textSecondary.withOpacity(0.5),
            ),
          ],
        ),
      ),
    );
  }
}