import 'dart:io';
import 'package:annill/features/home/controllers/farmer/add_products_controller.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:annill/core/utils/constants/app_colors.dart';
import 'package:annill/core/utils/constants/app_sizer.dart';

class DashedAddPhotoBox extends StatelessWidget {
  final VoidCallback onTap;

  const DashedAddPhotoBox({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AddProductsController>();
    final borderRadius = 10.w;

    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: DottedBorder(
          options: CustomPathDottedBorderOptions(
            padding: const EdgeInsets.all(8),
            color: AppColors.textBlack,
            strokeWidth: 1,
            dashPattern: const [4, 4],
            customPath: (size) => Path()
              ..addRRect(
                RRect.fromRectAndRadius(
                  Rect.fromLTWH(0, 0, size.width, size.height),
                  Radius.circular(borderRadius),
                ),
              ),
          ),
          child: Container(
            width: double.infinity,
            height: 100.h,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(borderRadius),
            ),


            child: Obx(() {
              final imageFile = controller.profileImage.value;

              if (imageFile != null) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(borderRadius),
                  child: Image.file(
                    imageFile,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                );
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      size: 24.w,
                      color: AppColors.textBlack,
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      "Add Photo",
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                );
              }
            }),
          ),
        ),
      ),
    );
  }
}
