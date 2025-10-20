import 'package:annill/core/common/widgets/custom_button.dart';
import 'package:annill/core/common/widgets/custom_container.dart';
import 'package:annill/core/common/widgets/custom_text.dart';
import 'package:annill/core/utils/constants/app_colors.dart';
import 'package:annill/core/utils/constants/app_sizer.dart';
import 'package:annill/features/orders/controllers/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class OrderDetails extends GetView<OrderController> {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerLeft,
          child: CustomText(
            text: "Order Details",
            color: AppColors.textBlack,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.textBlack),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding:  EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              CustomContainer(
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal:  20.w,vertical: 20.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "Buyer Information",
                          color: AppColors.textPrimary,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        Gap(10.h),
                        CustomText(
                          text: "Sunshine Hotel",
                          color: AppColors.textPrimary,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),

                        CustomText(
                          text: "Contact: Sarah Johnson",
                          color: AppColors.textSecondary,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        Gap(6.h),
                        Padding(
                          padding:  EdgeInsets.symmetric(vertical: 3.h),
                          child: Row(
                            children: [
                              Icon(Icons.phone_forwarded,size: 16.h,color: AppColors.textSecondary,),
                              Gap(5.w),
                              CustomText(
                                text: "+1 (868) 555-0123",
                                color: AppColors.textSecondary,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.symmetric(vertical: 3.h),
                          child: Row(
                            children: [
                              Icon(Icons.mail,size: 16.h,color: AppColors.textSecondary,),
                              Gap(5.w),
                              CustomText(
                                text: "orders@sunshinehotel.com",
                                color: AppColors.textSecondary,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.symmetric(vertical: 3.h),
                          child: Row(
                            children: [
                              Icon(Icons.location_on_outlined,size: 16.h,color: AppColors.textSecondary,),
                              Gap(5.w),
                              CustomText(
                                text: "123 Beach Road, Port of Spain, Trinidad",
                                color: AppColors.textSecondary,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  )),

              Gap(20.h),

              CustomContainer(
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal:  20.w,vertical: 20.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "Order Detail",
                          color: AppColors.textPrimary,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        Gap(10.h),

                        Container(

                          decoration: BoxDecoration(
                            color: AppColors.placeHolder.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10.w)
                          ),
                          child: Padding(
                            padding:  EdgeInsets.all(10.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                CustomText(
                                  text: "Organic Tomatoes",
                                  color: AppColors.textPrimary,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                                Gap(4.h),
                                CustomText(
                                  text: "\$2.50/kg",
                                  color: AppColors.placeHolder,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                                Gap(6.h),

                                Divider(height: 1.w,),
                                Gap(3.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                      text: "Quantity: 50 kg",
                                      color: AppColors.textBlack,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    CustomText(
                                      text: "\$120",
                                      color: AppColors.primary,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Gap(10.h),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: "Order date",
                                  color: AppColors.textPrimary,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                                CustomText(
                                  text: "March 15, 2024",
                                  color: AppColors.textPrimary,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                CustomText(
                                  text: "Delivery date",
                                  color: AppColors.textPrimary,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                                CustomText(
                                  text: "March 18, 2024",
                                  color: AppColors.textPrimary,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ],
                            ),
                          ],
                        ),


                      ],
                    ),
                  )),

              Gap(20.h),

              CustomContainer(
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal:  20.w,vertical: 20.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "Special Instructions",
                          color: AppColors.textPrimary,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),

                        CustomText(
                          text: "Please ensure tomatoes are firm and ripe. Prefer smaller sizes for salads.",
                          color: AppColors.textSecondary,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        Gap(6.h),

                      ],
                    ),
                  )),

              Gap(20.h),
              CustomContainer(
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal:  20.w,vertical: 20.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "Payment Summary",
                          color: AppColors.textPrimary,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        Gap(10.h),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: "Subtotal",
                              color: AppColors.textSecondary,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            CustomText(
                              text: "\$120",
                              color: AppColors.textSecondary,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: "Platform Fee (2%)",
                              color: AppColors.textSecondary,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            CustomText(
                              text: "\$1.20",
                              color: AppColors.textSecondary,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                        Gap(3.h),
                        Divider(height: 1.w,color: AppColors.borderColors.withOpacity(0.4),),
                        Gap(3.h),

                        CustomText(
                          text: "You'll Receive",
                          color: AppColors.textPrimary,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                        ),

                      ],
                    ),
                  )),

              Gap(20.h),

              Padding(
                padding:EdgeInsets.only(top: 10.h),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: CustomButton(
                        text:"Accept" ,
                        onTap: (){

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


            ],
          ),
        ),
      ),
    );
  }
}
