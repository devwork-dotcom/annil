import 'package:annill/core/common/widgets/custom_text.dart';
import 'package:annill/core/utils/constants/app_colors.dart';
import 'package:annill/core/utils/constants/app_sizer.dart';
import 'package:annill/features/orders/controllers/invoice_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InvoiceScreen extends GetView<InvoiceController> {
  const InvoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Invoice",
          color: AppColors.textBlack,
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
        ),
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding:  EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


              RepaintBoundary(
                key: controller.invoiceKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1.w,color: AppColors.borderColors)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding:  EdgeInsets.all(10.w),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text: "Billed to",
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.textBlack,
                                      ),
                                      CustomText(
                                        text: "Emily Rose",
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.textSecondary,
                                      ),
                                      CustomText(
                                        text: "example@gmail.com",
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.textSecondary,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: 1.w,
                                height: 100.h,
                                color: AppColors.borderColors,
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding:  EdgeInsets.all(10.w),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text: "Billed date",
                                        fontSize: 16.sp,
                                        color: AppColors.textBlack,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      CustomText(
                                        text: "January 15, 2025",
                                        fontSize: 12.sp,
                                        color: AppColors.textSecondary,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(height: 1.w,color: AppColors.borderColors,),
                          SizedBox(height: 10.h,),


                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: "Email",
                                  fontSize: 16.sp,
                                  color: AppColors.textBlack,
                                  fontWeight: FontWeight.w600,
                                ),
                                SizedBox(height: 3.h,),
                                CustomText(
                                  text: "example@gmail.com",
                                  fontSize: 12.sp,
                                  color: AppColors.textSecondary,
                                  fontWeight: FontWeight.w400,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: "Phone",
                                  fontSize: 16.sp,
                                  color: AppColors.textBlack,
                                  fontWeight: FontWeight.w600,
                                ),
                                SizedBox(height: 3.h,),
                                CustomText(
                                  text: "90487539078",
                                  fontSize: 12.sp,
                                  color: AppColors.textSecondary,
                                  fontWeight: FontWeight.w400,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: "Address",
                                  fontSize: 16.sp,
                                  color: AppColors.textBlack,
                                  fontWeight: FontWeight.w600,
                                ),
                                SizedBox(height: 3.h,),
                                CustomText(
                                  text: "123 Design Street, Suite 200, Austin, TX 78701, USA ",
                                  fontSize: 12.sp,
                                  color: AppColors.textSecondary,
                                  fontWeight: FontWeight.w400,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10.h,),

                        ],
                      ),
                    ),


                    SizedBox(height: 20.h),

                    _buildItemsTable(),
                    SizedBox(height: 30.h),


                    Center(
                      child: GestureDetector(
                        onTap: () => controller.downloadInvoice(),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 12.h),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: CustomText(
                            text: "Download invoice",
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildItemsTable() {
    return Column(
      children: [

        Container(
          padding: EdgeInsets.symmetric(vertical: 12.h,horizontal: 5.w),
          decoration: BoxDecoration(
            border: Border.all(width: 1.w,color: AppColors.borderColors),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: CustomText(
                  text: "Item",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textBlack,
                ),
              ),
              Expanded(
                flex: 1,
                child: CustomText(
                  text: "Quantity",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textBlack,
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                flex: 1,
                child: CustomText(
                  text: "Rate",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textBlack,
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                flex: 1,
                child: CustomText(
                  text: "Total",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textBlack,
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
        ),


        _buildTableRow("Tomato", "19", "\$4.5/kg", "\$45"),
        _buildTableRow("Chilli", "1", "\$9.5/kg", "\$5"),
        _buildTableRow("Potato", "10", "\$7.7/kg", "\$45.99"),



        Padding(
          padding:  EdgeInsets.symmetric(vertical:  5.h),
          child: Divider(height: 1.w,color: AppColors.borderColors,),
        ),
        _buildTotalRow("Subtotal", "\$45"),
        SizedBox(height: 8.h),        // Total
        _buildTotalRow("Total", "\$45", isBold: true),
      ],
    );
  }

  Widget _buildTableRow(String item, String quantity, String rate, String total) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.h,horizontal: 5.w),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: CustomText(
              text: item,
              fontSize: 14.sp,
              color: AppColors.textBlack,
              textAlign: TextAlign.start,
            ),
          ),
          Expanded(
            flex: 1,
            child: CustomText(
              text: quantity,
              fontSize: 14.sp,
              color: AppColors.textBlack,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 1,
            child: CustomText(
              text: rate,
              fontSize: 14.sp,
              color: AppColors.textBlack,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 1,
            child: CustomText(
              text: total,
              fontSize: 14.sp,
              color: AppColors.textBlack,
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTotalRow(String label, String value, {bool isBold = false}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.h,horizontal: 5.w),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: CustomText(
              text: label,
              fontSize: 14.sp,
              fontWeight: isBold ? FontWeight.w600 : FontWeight.w500,
              color: AppColors.textBlack,
            ),
          ),
          Expanded(
            child: CustomText(
              text: value,
              fontSize: 14.sp,
              fontWeight: isBold ? FontWeight.w600 : FontWeight.w500,
              color: AppColors.textBlack,
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}