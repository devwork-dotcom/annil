import 'package:annill/core/common/widgets/custom_button.dart';
import 'package:annill/core/common/widgets/custom_text.dart';
import 'package:annill/core/utils/constants/app_colors.dart';
import 'package:annill/core/utils/constants/app_sizer.dart';
import 'package:annill/core/utils/constants/image_path.dart';
import 'package:annill/features/cart/controller/cart_controller.dart';
import 'package:annill/features/cart/presentation/widgets/icon_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';


class CartScreen extends GetView<CartController> {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: CustomText(
          text: "Shopping Cart",
          color: AppColors.textBlack,
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Obx(
            () => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


              ListView.builder(
                itemCount: controller.cartItems.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final item = controller.cartItems[index];

                  return Padding(
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
                        padding: EdgeInsets.all(10.w),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 3,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  ImagePath.vegetable_tomato,
                                  height: 104.h,
                                  width: 108.w,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),

                            // 📄 Product Info
                            Expanded(
                              flex: 6,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: CustomText(
                                            text: item.name,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.textPrimary,
                                            maxLines: 3,
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () => controller.removeItem(index),
                                          child: Icon(
                                            Icons.delete_forever_rounded,
                                            size: 20.w,
                                            color: AppColors.error,
                                          ),
                                        ),
                                      ],
                                    ),

                                    Gap(3.h),
                                    CustomText(
                                      text: "Green Valley Farm",
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.textSecondary,
                                    ),
                                    Gap(3.h),
                                    const CustomIconTextWidget(
                                      icon: Icons.location_on_outlined,
                                      text: "123 Rixton Lane, London, UK",
                                    ),
                                    Gap(10.h),

                                    // ➕➖ Quantity & Price
                                    Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(vertical: 3.h),
                                          decoration: BoxDecoration(
                                            color: AppColors.white,
                                            borderRadius: BorderRadius.circular(10),
                                            border: Border.all(width: 1.w, color: AppColors.textBlack),
                                          ),
                                          width: 80.w,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              GestureDetector(
                                                onTap: () => controller.decreaseQuantity(index),
                                                child: Icon(
                                                  Icons.remove,
                                                  color: AppColors.textBlack,
                                                  size: 20.w,
                                                ),
                                              ),
                                              Flexible(
                                                child: CustomText(
                                                  text: item.quantity.toString(),
                                                  color: AppColors.primary,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14.sp,
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () => controller.increaseQuantity(index),
                                                child: Icon(
                                                  Icons.add,
                                                  color: AppColors.textBlack,
                                                  size: 20.w,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Gap(10.h),
                                        CustomText(
                                          text: "Total : ",
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.textBlack,
                                        ),
                                        Expanded(
                                          child: CustomText(
                                            text: "\$${item.totalPrice.toStringAsFixed(2)}",
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.primary,
                                          ),
                                        ),
                                      ],
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

              // 🧾 Order Summary
              Padding(
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
              ),

              SizedBox(height: 20.h),

              // ✅ Buttons
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 5.h),
                child: CustomButton(
                  text: "Proceed to Checkout",
                  onTap: () {
                    controller.navigateToCheckoutScreen();
                  },
                  isUpperCase: false,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 5.h),
                child: CustomButton(
                  text: "Continue Shopping",
                  onTap: () {},
                  isUpperCase: false,
                  isOutline: true,
                  borderColor: AppColors.primary,
                  backgroundColor: AppColors.backgroundLight,
                  textColor: AppColors.textBlack,
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
