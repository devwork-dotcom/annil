import 'package:annill/core/common/widgets/custom_button.dart';
import 'package:annill/core/common/widgets/custom_search_field.dart';
import 'package:annill/core/common/widgets/custom_text.dart';
import 'package:annill/core/utils/constants/app_sizer.dart';
import 'package:annill/core/utils/constants/image_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/constants/app_colors.dart';
import '../../controllers/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBackground,
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: 170.h,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(ImagePath.plantPng),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        // Profile and Notification
                        Positioned(
                          top: 50.h,
                          left: 0,
                          right: 0,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Profile Section (Left)
                                Row(
                                  children: [
                                    // Profile Image
                                    Container(
                                      width: 50.w,
                                      height: 50.h,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: AssetImage('assets/images/profile.png'),
                                          fit: BoxFit.cover,
                                        ),

                                      ),
                                    ),
                                    SizedBox(width: 12.w),
                                    // Name
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          text: "Welcome",
                                          color: AppColors.whiteHeading,
                                          fontSize: 22.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        CustomText(
                                          text: "Alex John",
                                          color: AppColors.whiteHeading,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                // Notification Icon (Right)
                                Container(
                                  width: 40.w,
                                  height: 40.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.whiteHeading,
                                  ),
                                  child: Icon(
                                    Icons.notifications_none_outlined,
                                    color: Colors.black,
                                    size: 24,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 40.h),

                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 16.w),
                        height: 170.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.w),
                          image: DecorationImage(
                            image: AssetImage(ImagePath.featured_banner),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.w),
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    Colors.black.withOpacity(0.7),
                                    Colors.transparent,
                                  ],
                                ),
                              ),
                            ),
                            // Text Overlay
                            // Text Overlay - Exact Center
                            Positioned(
                              left: 0,
                              right: 0,
                              top: 0,
                              bottom: 0,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CustomText(
                                      text: "Avocado",
                                      color: AppColors.whiteHeading,
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    CustomText(
                                      text: "freshly picked for you",
                                      color: AppColors.whiteHeading,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,

                                    ),
                                    SizedBox(height: 10.h),
                                    Padding(
                                      padding:  EdgeInsets.symmetric(horizontal: 100.w),
                                      child: CustomButton(
                                          text: "Shop Now",
                                          isUpperCase: false,
                                          padding: EdgeInsets.symmetric(vertical: 10.w,),
                                          onTap: (){}
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 24.h),

                      Center(
                        child: CustomText(
                          text: "What’s on Offer",
                          color: AppColors.textBlack,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 120.w,vertical: 5.h),
                        child: Divider(
                          height: 1.h,
                          color: AppColors.error,
                        ),
                      ),

                      SizedBox(height: 12.h),

                      // Horizontal Scroll List
                      Container(
                        height: 217.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Container(
                              width: 100.w,
                              margin: EdgeInsets.only(right: 12.w),
                              decoration: BoxDecoration(
                                color: AppColors.verticalCardColors,
                                borderRadius: BorderRadius.circular(50),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 6,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.category, size: 40, color: AppColors.primary),
                                  SizedBox(height: 8.h),
                                  Text(
                                    'Category ${index + 1}',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),

                      SizedBox(height: 24.h),

                      // Vertical Scroll Section Title
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Text(
                          'Latest Products',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ),

                      SizedBox(height: 12.h),

                      // Vertical Scroll List
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(bottom: 12.h),
                            padding: EdgeInsets.all(12.w),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 6,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 60.w,
                                  height: 60.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: AppColors.primary.withOpacity(0.1),
                                  ),
                                  child: Icon(Icons.shopping_bag, color: AppColors.primary),
                                ),
                                SizedBox(width: 12.w),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Product ${index + 1}',
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 4.h),
                                      Text(
                                        '\$${20 + index}.00',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: AppColors.primary,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),

                      SizedBox(height: 24.h),
                    ],
                  ),
                ),
              ],
            ),

            Positioned(
              top: 190.h,
              left: 16.w,
              right: 16.w,
              child: CustomSearchField(
                borderColor: AppColors.whiteHeading,


              ),
            ),
          ],
        ),
      ),
    );
  }
}