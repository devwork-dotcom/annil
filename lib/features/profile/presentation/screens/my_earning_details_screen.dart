import 'package:annill/core/common/widgets/custom_button.dart';
import 'package:annill/core/common/widgets/custom_text.dart';
import 'package:annill/core/utils/constants/app_colors.dart';
import 'package:annill/core/utils/constants/app_sizer.dart';
import 'package:annill/features/profile/controller/my_earning_controller.dart';
import 'package:annill/features/profile/presentation/widgets/payment_dailog_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class MyEarningDetailsScreen extends GetView<MyEarningController> {
  const MyEarningDetailsScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerLeft,
          child: CustomText(
            text: "My Earning",
            color: AppColors.textPrimary,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body:SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
        
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(10.w)
        
                ),
                child: Padding(
                  padding:  EdgeInsets.all(20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
        
                      CustomText(
                        text: "Available Balance",
                        color: AppColors.whiteHeading,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      Gap(3.h),
                      CustomText(
                        text: "\$1,450.66",
                        color: AppColors.whiteHeading,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
        
                    ],
                  ),
                ),
              ),
              Gap(20.h),
              CustomButton(
                  text: "Request payout",
                  onTap: (){
                    showModalBottomSheet(
                        context: context,
                        backgroundColor: AppColors.textWhite,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                        ),
                        builder: (context) => PaymentBottomSheet(controller: controller.paymentAmountController));
                  },
                isUpperCase: false,
                isOutline: true,
                backgroundColor: AppColors.white,
                padding: EdgeInsets.symmetric(vertical: 7.h),
              ),
              Gap(20.h),
              CustomText(
                text: "Transaction history",
                color: AppColors.textPrimary,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
              Gap(10.h),
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
        
            ],
          ),
        ),
      ),

    );
  }
}
