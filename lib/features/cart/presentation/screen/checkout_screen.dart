
import 'package:annill/core/common/widgets/custom_button.dart';
import 'package:annill/core/common/widgets/custom_text.dart';
import 'package:annill/core/common/widgets/custom_text_field.dart';
import 'package:annill/core/utils/constants/app_colors.dart';
import 'package:annill/core/utils/constants/app_sizer.dart';
import 'package:annill/features/cart/controller/checkout_controller.dart';
import 'package:annill/features/cart/presentation/widgets/text_field_with_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutScreen extends GetView<CheckoutController> {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: CustomText(
          text: "Checkout",
          color: AppColors.textBlack,
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Obx(() => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [



              //Delivery Information
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15.w),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20.w),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.cardShadowColor.withOpacity(0.25),
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "Delivery Information",
                        color: AppColors.textBlack,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),

                      
                      CustomTextFieldWithTitle(
                          title: "Full Name",
                          controller: controller.nameController.value,
                          keyboardType: TextInputType.text,
                      ),

                      CustomTextFieldWithTitle(
                        title: "Email",
                        controller: controller.emailController.value,
                        keyboardType: TextInputType.emailAddress,
                      ),

                      CustomTextFieldWithTitle(
                        title: "Phone",
                        controller: controller.phoneController.value,
                        keyboardType: TextInputType.phone,
                      ),

                      CustomTextFieldWithTitle(
                        title: "Delivery Address",
                        controller: controller.addressController.value,
                        keyboardType: TextInputType.emailAddress,
                      ),

                      CustomTextFieldWithTitle(
                        title: "City",
                        controller: controller.cityController.value,
                        keyboardType: TextInputType.emailAddress,
                      ),

                      CustomTextFieldWithTitle(
                        title: "Country",
                        controller: controller.countryController.value,
                        keyboardType: TextInputType.emailAddress,
                      ),

                    ],
                  ),
                ),
              ),

              //Delivery Date
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15.w),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20.w),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.cardShadowColor.withOpacity(0.25),
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "Delivery Date",
                        color: AppColors.textBlack,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),


                      Padding(
                        padding:  EdgeInsets.symmetric(vertical: 5.h),
                        child: CustomText(
                          text: "Preferred Delivery Date",
                          color: AppColors.textPrimary,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),

                      GestureDetector(
                        onTap: (){
                          controller.selectDate(context);
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(width: 1.w,color: AppColors.borderColors)

                          ),
                          child: Padding(
                            padding:  EdgeInsets.all(10.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  text: controller.preferredDate.value,
                                  color: AppColors.textBlack,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                                Icon(Icons.calendar_month,size: 20.w,color: AppColors.primary,)
                              ],
                            ),
                          ),
                        ),
                      ),




                    ],
                  ),
                ),
              ),

              //Special Instruction
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15.w),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20.w),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.cardShadowColor.withOpacity(0.25),
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "Special Instruction",
                        color: AppColors.textBlack,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),


                      CustomTextFieldWithTitle(
                          controller: controller.specialInstructionController.value,
                          keyboardType: TextInputType.text,
                          maxLines: 4,
                      ),



                    ],
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15.w),
                child: Container(
                  padding: EdgeInsets.all(20.w),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.cardShadowColor.withOpacity(0.25),
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "Order Summary",
                        color: AppColors.textPrimary,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: "Subtotal",
                            color: AppColors.textSecondary,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600,
                          ),
                          CustomText(
                            text: "\$${controller.subTotal.value.toStringAsFixed(2)}",
                            color: AppColors.textSecondary,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: "Delivery fee",
                            color: AppColors.textSecondary,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600,
                          ),
                          CustomText(
                            text: "\$${controller.deliveryFee.value.toStringAsFixed(2)}",
                            color: AppColors.textSecondary,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                      Divider(color: AppColors.borderColors.withOpacity(0.3)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: "Total",
                            color: AppColors.textPrimary,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          CustomText(
                            text: "\$${controller.totalAmount.value.toStringAsFixed(2)}",
                            color: AppColors.primary,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              /*Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15.w),
                child: Container(
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
                    padding: EdgeInsets.all(20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "Order Summary",
                          color: AppColors.textPrimary,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: "Subtotal (${controller.cartItems.length} items)",
                              color: AppColors.textSecondary,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            CustomText(
                              text: "\$${controller.subTotal.toStringAsFixed(2)}",
                              color: AppColors.textSecondary,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                        SizedBox(height: 6.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: "Delivery fee",
                              color: AppColors.textSecondary,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            CustomText(
                              text: "\$${controller.deliveryFee.toStringAsFixed(2)}",
                              color: AppColors.textSecondary,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.h),
                          child: Divider(
                            height: 1.w,
                            color: AppColors.borderColors.withOpacity(0.30),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: "Total",
                              color: AppColors.textPrimary,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            CustomText(
                              text: "\$${controller.totalAmount.toStringAsFixed(2)}",
                              color: AppColors.primary,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),*/

              SizedBox(height: 20.h),


              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 5.h),
                child: CustomButton(
                  text: "Place Order",
                  onTap: () {},
                  isUpperCase: false,
                ),
              ),

              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}
