import 'package:annill/core/common/widgets/custom_button.dart';
import 'package:annill/core/common/widgets/custom_text.dart';
import 'package:annill/core/common/widgets/custom_text_field.dart';
import 'package:annill/core/utils/constants/app_colors.dart';
import 'package:annill/core/utils/constants/app_sizer.dart';
import 'package:annill/features/orders/controllers/customer_review_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomerReviewScreen extends GetView<CustomerReviewController> {
  const CustomerReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Review",
          color: AppColors.textBlack,
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
        ),
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: "Write a review",
              fontWeight: FontWeight.w400,
              color: AppColors.textPrimary,
              fontSize: 18.sp,
            ),
            SizedBox(height: 20.h),

            Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                for (double i = 1; i <= 5; i++)
                  GestureDetector(
                    onTap: () => controller.setRating(i),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 1.w),
                      child: Icon(
                        i <= controller.rating.value ? Icons.star : Icons.star_border,
                        color: i <= controller.rating.value ? AppColors.ratingStarColor : Colors.grey,
                        size: 24.sp,
                      ),
                    ),
                  ),
              ],
            )),
            SizedBox(height: 20.h),

            // CustomTextField without onChanged - manually handle
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.w),
                border: Border.all(
                  color: AppColors.textSecondary.withOpacity(0.3),
                  width: 1,
                ),
              ),
              child: TextField(
                onChanged: (value) => controller.setReviewText(value),
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: "Write a review...",
                  hintStyle: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.textSecondary,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(16.w),
                ),
              ),
            ),

            Spacer(),

            CustomButton(
              text: "Post Review",
              onTap: () {
                if (!controller.isSubmitting.value) {
                  controller.submitReview();
                }
              },
              isUpperCase: false,
              customTextStyle: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white
              ),
            ),
            SizedBox(height: 50.h),
          ],
        ),
      ),
    );
  }
}