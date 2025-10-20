import 'package:annill/core/common/widgets/custom_text.dart';
import 'package:annill/core/utils/constants/app_colors.dart';
import 'package:annill/core/utils/constants/app_sizer.dart';
import 'package:annill/core/utils/constants/icon_path.dart';
import 'package:annill/core/utils/constants/image_path.dart';
import 'package:annill/features/home/presentaion/widgets/dashboard_item_card.dart';
import 'package:annill/features/products/controller/products_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ProductsScreen extends GetView<ProductsControllerFarmer> {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerLeft,
          child: CustomText(
            text: "My Products",
            color: AppColors.textBlack,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding:  EdgeInsets.all(20.w),
              child: Column(
                children: [



                  CustomDashboardCart(
                    title1: "Total Earning",
                    value1: "\$3930",

                    title2: "Total Sales",
                    value2: "345",


                  ),
                  Gap(10.h),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.h, ),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColors.verticalCardColors,
                              borderRadius: BorderRadius.circular(10.w),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 6,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 5.w),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(10.w),
                                            child: Image.asset(
                                              ImagePath.vegetable_tomato,
                                              height: 75.w,
                                              width: 83.w,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),

                                      Gap(5.h),

                                      Expanded(
                                        flex: 4,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Gap(10.h),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                              children: [
                                                Expanded(
                                                  child: Align(
                                                    alignment: Alignment.centerLeft,
                                                    child: CustomText(
                                                      text: "Organic Potato",
                                                      color: AppColors.textBlack,
                                                      fontSize: 14.sp,
                                                      fontWeight: FontWeight.w600,
                                                      textAlign: TextAlign.center,
                                                    ),
                                                  ),
                                                ),

                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: (){
                                                        controller.navigateToUpdateProductsScreen();

                                                      },
                                                      child: SvgPicture.asset(IconPath.edit,
                                                        height: 15.w,
                                                        width: 15.w,
                                                      ),
                                                    ),
                                                    Gap(10.w),
                                                    GestureDetector(
                                                      onTap: (){

                                                      },
                                                      child: SvgPicture.asset(IconPath.delete,
                                                        height: 15.w,
                                                        width: 15.w,
                                                      ),
                                                    ),
                                                    Gap(10.w),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Gap(5.h),
                                            CustomText(
                                              text: "150 kg available",
                                              color: AppColors.textSecondary,
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w400,
                                              textAlign: TextAlign.center,
                                            ),


                                            Gap(10.h),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                CustomText(
                                                  text: "\$4.5/kg ",
                                                  color: AppColors.primary,
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w600,
                                                  textAlign: TextAlign.center,
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(right: 10.w),
                                                  decoration: BoxDecoration(
                                                      color: AppColors.success.withOpacity(0.1),
                                                      borderRadius: BorderRadius.circular(10.w)
                                                  ),
                                                  child: Padding(
                                                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
                                                    child: CustomText(
                                                      text: "Completed",
                                                      fontSize: 10.sp,
                                                      fontWeight: FontWeight.w400,
                                                      color: AppColors.textPrimary,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),

                                    ],
                                  ),



                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),








                ],
              ),
            ),
          ),


          Positioned(
            right: 30.w,
            bottom: 20.h,
            child: Container(
              width: 50.w,
              height: 50.w,
              decoration: BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.4),
                    blurRadius: 10,
                    offset:  Offset(0, 5),
                  ),
                ],
              ),
              child: FloatingActionButton(
                onPressed: () {
                  controller.navigateToAddProductsScreen();
                },
                elevation: 0,
                backgroundColor: Colors.transparent,
                shape: const CircleBorder(),
                child:  Icon(
                  Icons.add,
                  size: 30.w,
                  color: Colors.white,
                ),
              ),
            ),
          ),


        ],

      ),
    );
  }
}