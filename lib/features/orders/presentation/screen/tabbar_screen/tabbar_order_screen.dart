import 'package:annill/core/common/widgets/custom_button.dart';
import 'package:annill/core/common/widgets/custom_text.dart';
import 'package:annill/core/services/Auth_service.dart';
import 'package:annill/core/utils/constants/app_colors.dart';
import 'package:annill/core/utils/constants/app_sizer.dart';
import 'package:annill/core/utils/constants/image_path.dart';
import 'package:annill/features/orders/controllers/order_controller.dart';
import 'package:annill/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabbarOrdersScreen extends GetView<OrderController> {
  const TabbarOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userRole = AuthService.role;

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,

      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
          child: Obx(()=>Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              ListView.builder(
                itemCount: controller.filteredOrders.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final order = controller.filteredOrders[index];
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
                                  text: order.hotelName,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.textPrimary,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: controller.getStatusColor(order.status),
                                      borderRadius: BorderRadius.circular(10.w)
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
                                    child: CustomText(
                                      text: order.status,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w400,
                                      color: controller.getStatusTextColor(order.status),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            CustomText(
                              text: order.orderId,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textSecondary,
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                CustomText(
                                  text: "${order.productName}-${order.quantity} kg",
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.textSecondary,
                                ),
                                CustomText(
                                  text: "\$${order.price}",
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primary,
                                ),
                              ],
                            ),



                            //Track, Button customer

                            Visibility(
                              visible:userRole == "customer" && (controller.currentTabIndex.value == 0 || controller.currentTabIndex.value == 1),
                              child: Padding(
                                padding:  EdgeInsets.only(top: 10.h),
                                child: CustomButton(
                                  text:"Track" ,
                                  onTap: (){
                                    controller.navigateToOrderTrackingScreen();
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
                            ),

                            Visibility(
                              visible: userRole == "customer" && controller.currentTabIndex.value == 2,
                              child: Padding(
                                padding:EdgeInsets.only(top: 10.h),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: CustomButton(
                                        text:"Invoice" ,
                                        onTap: (){
                                          Get.toNamed(AppRoute.invoiceScreen);
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
                                        text:"Post Review" ,
                                        onTap: (){
                                          controller.navigateCustomerScreen();
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
                              ),
                            ),


                            //Track, Button Farmer

                            Visibility(
                              visible: userRole == "farmer" && controller.currentTabIndex.value == 0,
                              child: Padding(
                                padding:EdgeInsets.only(top: 10.h),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: CustomButton(
                                        text:"Accept" ,
                                        onTap: (){
                                          Get.toNamed(AppRoute.orderDetailsScreen);
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
                                        text:"Reject" ,
                                        onTap: (){
                                          //controller.navigateCustomerScreen();
                                        },
                                        isUpperCase: false,
                                        padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 8.h),
                                        customTextStyle: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 10.sp,
                                          color: AppColors.white,

                                        ),
                                        backgroundColor: AppColors.error,



                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            Visibility(
                              visible: userRole == "farmer" && controller.currentTabIndex.value == 1,
                              child: Padding(
                                padding:EdgeInsets.only(top: 10.h),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: CustomButton(
                                        text:"Complete" ,
                                        onTap: (){
                                          //Get.toNamed(AppRoute.invoiceScreen);
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
                                        text:"Cancel" ,
                                        onTap: (){
                                          //controller.navigateCustomerScreen();
                                        },
                                        isUpperCase: false,
                                        padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 8.h),
                                        customTextStyle: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 10.sp,
                                          color: AppColors.white,

                                        ),
                                        backgroundColor: AppColors.error,



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
                  );
                },
              ),

              SizedBox(height: 30.h),
            ],
          ),),
        ),
      ),
    );
  }
}