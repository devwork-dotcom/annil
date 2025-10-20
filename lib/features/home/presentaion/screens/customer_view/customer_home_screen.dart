import 'package:annill/core/common/widgets/custom_button.dart';
import 'package:annill/core/common/widgets/custom_search_field.dart';
import 'package:annill/core/common/widgets/custom_text.dart';
import 'package:annill/core/utils/constants/app_colors.dart';
import 'package:annill/core/utils/constants/app_sizer.dart';
import 'package:annill/core/utils/constants/icon_path.dart';
import 'package:annill/core/utils/constants/image_path.dart';
import 'package:annill/features/home/controllers/customer/home_controller_customer.dart';
import 'package:annill/features/home/presentaion/widgets/category_filter_widget.dart';
import 'package:annill/features/home/presentaion/widgets/search_item_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomerHomeScreen extends GetView<HomeControllerCustomer> {
  const CustomerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 200.h,
          flexibleSpace: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(ImagePath.plantPng),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

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
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
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

              Positioned(
                left: 16.w,
                right: 16.w,
                bottom: -20.h,
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  child: Obx(() => CustomSearchField(
                    borderColor: AppColors.borderColors,
                    suffixIcon: Icon(
                      Icons.menu_open_sharp,
                      color: controller.selectedCategory.isEmpty
                          ? AppColors.placeHolder
                          : AppColors.primary,
                    ),
                    onSuffixIconTap: (){
                      controller.showCategoryDialog(context);
                    },
                    hintText: controller.selectedCategory.isEmpty
                        ? "Search"
                        : "${controller.selectedCategory.value}",
                  )),
                ),
              ),
            ],
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
                    return Padding(
                      padding:  EdgeInsets.symmetric(vertical: 5),
                      child: Container(
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
                            Container(
                              decoration: BoxDecoration(
                                color: AppColors.error,
                                borderRadius: BorderRadius.circular(50),

                              ),
                              child: Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 3.h),
                                child: CustomText(
                                  text: "15 % Off",
                                  color: AppColors.whiteHeading,
                                  fontSize: 12.sp,
                                ),
                              ),

                            ),

                            SizedBox(height: 8.h),

                            Image.asset(ImagePath.banner_fruit,
                              height: 62.h,
                              width: 93.w,
                            ),
                            SizedBox(height: 8.h),
                            CustomText(
                              text: "Organic\nPotato",
                              color: AppColors.textBlack,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 8.h),
                            Image.asset(ImagePath.banner_cart,
                              height: 30.w,
                              width: 30.w,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: 24.h),

              Padding(
                padding:  EdgeInsets.symmetric(horizontal:  20.w),
                child: CustomButton(
                    borderRadius: BorderRadius.circular(50.w),
                    backgroundColor: AppColors.backgroundLight,
                    text: "View All Categories",
                    textColor: AppColors.primary,
                    borderColor: AppColors.primary,
                    isOutline: true,
                    isUpperCase: false,
                    onTap: (){}),
              ),

              SizedBox(height: 35.h),

              // Horizontal Scroll List
              Container(
                height: 120.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:  EdgeInsets.symmetric(vertical: 5),
                      child: Container(
                        width: 110.w,
                        margin: EdgeInsets.only(right: 12.w),
                        decoration: BoxDecoration(
                          color: AppColors.backgroundLight,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [

                            SizedBox(height: 10.h),
                            CustomText(
                              text: "Vegetables",
                              color: AppColors.textBlack,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              textAlign: TextAlign.center,
                            ),
                            Spacer(),

                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(50),
                                bottomRight: Radius.circular(50),
                              ),
                              child: Image.asset(
                                ImagePath.banner_vegetables,
                                width: 188.w,
                                height: 62.w,
                                fit: BoxFit.cover, // Important for proper filling
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: 12.h),

              Padding(
                padding:  EdgeInsets.symmetric(horizontal:  20.w),
                child: CustomButton(
                    borderRadius: BorderRadius.circular(50.w),
                    backgroundColor: AppColors.backgroundLight,
                    text: "View All Categories",
                    textColor: AppColors.primary,
                    borderColor: AppColors.primary,
                    isOutline: true,
                    isUpperCase: false,
                    onTap: (){}),
              ),

              SizedBox(height: 12.h),

              // Vertical Scroll List
              /*ListView.builder(
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
                  ),*/

              SizedBox(height: 24.h),
            ],
          ),
        ),

      ],
    );
  }
}
