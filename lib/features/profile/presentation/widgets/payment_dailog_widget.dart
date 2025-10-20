import 'package:flutter/material.dart';
import 'package:annill/core/common/widgets/custom_text.dart';
import 'package:annill/core/utils/constants/app_colors.dart';
import 'package:annill/core/utils/constants/app_sizer.dart';
import 'package:annill/features/cart/presentation/widgets/text_field_with_title_widget.dart';

class PaymentBottomSheet extends StatelessWidget {
  final TextEditingController controller;

  const PaymentBottomSheet({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
      child: Column(
        children: [
          CustomText(
            text: 'Withdraw Request',
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
          SizedBox(height: 20.h),

          // 🧾 Input Field
          CustomTextFieldWithTitle(
            controller: controller,
          ),

          SizedBox(height: 20.h),


          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.w),
                ),
                padding: EdgeInsets.symmetric(vertical: 14.h),
              ),
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Withdraw request submitted successfully!"),
                    backgroundColor: AppColors.primary,
                  ),
                );
              },
              child: CustomText(
                text: "Confirm",
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: 10.h),

        ],
      ),
    );
  }
}
