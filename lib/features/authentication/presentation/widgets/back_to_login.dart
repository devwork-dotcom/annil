import 'package:annill/core/common/widgets/custom_text.dart';
import 'package:annill/core/utils/constants/app_colors.dart';
import 'package:annill/core/utils/constants/app_sizer.dart';
import 'package:flutter/material.dart';

class BackToLogin extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final Color textColor;
  final double textSize;
  final Color iconColor;
  final double iconSize;
  final MainAxisAlignment mainAxisAlignment;

  const BackToLogin({
    super.key,
    required this.onTap,
    this.text = 'Back to login',
    this.textColor = AppColors.textPrimary,
    this.textSize = 16,
    this.iconColor = AppColors.textPrimary,
    this.iconSize = 24,
    this.mainAxisAlignment = MainAxisAlignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Icon(
                Icons.arrow_back,
                size: iconSize,
                color: iconColor,
              ),
              const SizedBox(width: 6),
              CustomText(
                text: text,
                color: textColor,
                fontSize: textSize.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}