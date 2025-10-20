import 'package:annill/core/utils/constants/image_path.dart';
import 'package:flutter/material.dart';
import 'package:annill/core/utils/constants/app_colors.dart';
import 'package:annill/core/utils/constants/app_sizer.dart';
import 'package:annill/core/common/widgets/custom_text.dart';
import 'package:annill/core/common/widgets/custom_container.dart';

class CustomDashboardCart extends StatelessWidget {
  final String title1;
  final String value1;
  final String? icon1;

  final String? title2;
  final String? value2;
  final String? icon2;

  const CustomDashboardCart({
    super.key,
    required this.title1,
    required this.value1,
    this.icon1,
    this.title2,
    this.value2,
    this.icon2,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 1.h),
      child: Row(
        children: [
          /// 🔹 First Box
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(right: 10.w, top: 5.h, bottom: 5.h),
              child: _buildStatBox(
                title: title1,
                value: value1,
                icon: icon1,
              ),
            ),
          ),

          /// 🔹 Second Box OR Empty Space
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(left: 10.w, top: 5.h, bottom: 5.h),
              child: (title2 != null && value2 != null)
                  ? _buildStatBox(
                title: title2!,
                value: value2!,
                icon: icon2,
              )
                  : SizedBox(height: 80.h), // keeps layout balanced
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatBox({
    required String title,
    required String value,
    String? icon,
  }) {
    return CustomContainer(
      child: Padding(
        padding: EdgeInsets.all(15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Header Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: title,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textPrimary,
                ),
                Image.asset(
                  icon ?? ImagePath.delivery_box, // fallback asset
                  height: 16.w,
                  width: 16.w,
                ),
              ],
            ),

            SizedBox(height: 6.h),

            /// Value
            CustomText(
              text: value,
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.textPrimary,
            ),
          ],
        ),
      ),
    );
  }
}
