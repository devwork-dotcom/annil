
import 'package:annill/core/common/widgets/custom_text.dart';
import 'package:annill/core/utils/constants/app_colors.dart';
import 'package:annill/core/utils/constants/app_sizer.dart';
import 'package:annill/core/utils/constants/image_path.dart';
import 'package:annill/features/home/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends GetView<ProductController> {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: Column(
          children: [
            CustomText(
              text: "Products Details",
              color: AppColors.textBlack,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.textBlack),
          onPressed: () => Get.back(),
        ),
      ),
      body: Column(
        children: [

          Center(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal:  15.w,vertical: 10.h),
              child: Container(
                width: double.infinity,
                height: 200.h,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.w),
                  child: Image.asset(
                    ImagePath.vegetable_tomato,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 200.h,
                  ),
                ),
              ),
            ),
          ),

          Padding(
            padding:  EdgeInsets.symmetric(horizontal:  15.w,vertical: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                    text: "Organic Tomatoes",
                  color: AppColors.textBlack,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                ),
                Wrap(
                  children: [
                    CustomText(
                      text: "Status: ",
                      color: AppColors.textBlack,
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                    ),
                    CustomText(
                      text: "In Stock",
                      color: AppColors.primary,
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                    ),
                  ],
                ),
              ],
            ),
          ),

          Padding(
            padding:  EdgeInsets.symmetric(horizontal:  20.w,vertical: 5.h),
            child: Row(
              children: [
                Icon(Icons.location_on_outlined,size: 15.w,),
                SizedBox(width: 3.w,),
                CustomText(
                  text: "123 Rixton Lane, London, UK",
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                ),
              ],
            ),
          ),

          Padding(
            padding:  EdgeInsets.symmetric(horizontal:  20.w,vertical: 5.h),
            child: Row(
              children: [
                Icon(Icons.star,size: 15.w,color: AppColors.ratingStarColor,),
                SizedBox(width: 3.w,),
                CustomText(
                  text: "5.0 ",
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                ),
                CustomText(
                  text: "(520 Review)",
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                ),
              ],
            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal:  20.w,vertical: 15.h),
            child: Row(
              children: [

                CustomText(
                  text: "Price: ",
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                ),
                CustomText(
                  text: "4.5/kg",
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 24.sp,
                ),
              ],
            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal:  20.w,),
            child: Row(
              children: [

                Container(

                ),
                CustomText(
                  text: "1",
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                ),

              ],
            ),
          ),


        ],
      ),
    );
  }
}