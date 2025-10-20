import 'package:annill/core/common/widgets/custom_button.dart';
import 'package:annill/core/common/widgets/custom_container.dart';
import 'package:annill/core/common/widgets/custom_text.dart';
import 'package:annill/core/utils/constants/app_colors.dart';
import 'package:annill/core/utils/constants/app_sizer.dart';
import 'package:annill/core/utils/constants/image_path.dart';
import 'package:annill/features/home/controllers/farmer/home_controller_farmer.dart';
import 'package:annill/features/home/presentaion/widgets/dashboard_item_card.dart';
import 'package:annill/features/home/presentaion/widgets/icon_button_widget.dart';
import 'package:annill/features/nav_bar/controllers/nav_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class FarmerHomeScreen extends GetView<HomeControllerFarmer> {
  const FarmerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding:  EdgeInsets.all(20.w),
            child: Column(
              children: [
                // Profile Section (Left)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
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
                              color: AppColors.textBlack,
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            CustomText(
                              text: "Alex John",
                              color: AppColors.textBlack,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        CustomCircleIconButton(onTap: (){}, imagePath: ImagePath.dollar),
                        Gap(15.w),
                        CustomCircleIconButton(onTap: (){}, imagePath: ImagePath.notification),


                      ],
                    ),
                  ],
                ),
                Gap(20.h),

                CustomDashboardCart(
                  title1: "Active Status",
                  value1: "30",

                  title2: "Pending Orders",
                  value2: "45",


                ),
                CustomDashboardCart(
                  title1: "Total Earning",
                  value1: "\$3930",

                  title2: "Total Sales",
                  value2: "345",


                ),

                //Add and View order buttons
                Gap(20.h),
                CustomContainer(
                    child: Padding(
                      padding:  EdgeInsets.all(15.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          CustomText(
                            text: "Quick Status",
                            color: AppColors.textPrimary,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          Gap(10.h),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: CustomButton(
                                  text:"Add Product" ,
                                  onTap: (){
                                    controller.navigateToAddProductScreen();

                                  },
                                  isUpperCase: false,
                                  padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 8.h),
                                  customTextStyle: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 10.sp,
                                      color: AppColors.white
                                  ),


                                ),
                              ),
                              SizedBox(width: 10.h,),
                              Expanded(
                                flex: 1,
                                child: CustomButton(
                                  text:"View Orders" ,
                                  onTap: (){
                                    final navController = Get.find<NavBarController>();
                                    navController.changeIndex(1);
                                  },
                                  isUpperCase: false,
                                  isOutline: true,
                                  padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 8.h),
                                  customTextStyle: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 10.sp,
                                    color: AppColors.textBlack,

                                  ),
                                  backgroundColor: AppColors.white,



                                ),
                              ),
                            ],
                          ),

                        ],

                      ),
                    )),

                //List view
                Gap(20.h),
                CustomContainer(
                    child: Padding(
                      padding:  EdgeInsets.all(15.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          CustomText(
                            text: "Recent Orders",
                            color: AppColors.textPrimary,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          Gap(10.h),

                          Obx(()=>Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              ListView.builder(
                                itemCount: controller.orders.length,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  final order = controller.orders[index];
                                  return Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10, ),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: AppColors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color: AppColors.cardShadowColor.withOpacity(0.25),
                                            blurRadius: 5,
                                            offset: const Offset(0, 0),
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all( 20.w),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [

                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [

                                                CustomText(
                                                  text: order["hotelName"],
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColors.textPrimary,
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                      color: controller.getStatusColor(order["status"]),
                                                      borderRadius: BorderRadius.circular(10.w)
                                                  ),
                                                  child: Padding(
                                                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
                                                    child: CustomText(
                                                      text: order["status"],
                                                      fontSize: 10.sp,
                                                      fontWeight: FontWeight.w400,
                                                      color: controller.getStatusTextColor(order["status"]),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),

                                            CustomText(
                                              text: order["orderId"],
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.textSecondary,
                                            ),

                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [

                                                CustomText(
                                                  text: "${order["productName"]}-${order["quantity"]} kg",
                                                  fontSize: 10.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.textSecondary,
                                                ),
                                                CustomText(
                                                  text: "\$${order["price"]}",
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColors.primary,
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

                              SizedBox(height: 30.h),
                            ],
                          ),),





                        ],

                      ),
                    )),





              ],
            ),
          ),
        ),
      ),
    );
  }
}
