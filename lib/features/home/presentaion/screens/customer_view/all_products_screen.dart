import 'package:annill/features/home/controllers/customer/product_controller_customer.dart';
import 'package:flutter/material.dart';
import 'package:annill/core/common/widgets/custom_text.dart';
import 'package:annill/core/utils/constants/app_colors.dart';
import 'package:annill/core/utils/constants/app_sizer.dart';
import 'package:annill/core/utils/constants/image_path.dart';
import 'package:get/get.dart';

class AllProductsScreen extends GetView<ProductsControllerCustomer> {
  final String selectedCategory;


   AllProductsScreen({super.key, required selectedCategory}) : selectedCategory = Get.arguments ?? '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: Column(
          children: [
            CustomText(
              text: "All Products",
              color: AppColors.textBlack,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
            if (selectedCategory.isNotEmpty) ...[
              SizedBox(height: 4.h),
              CustomText(
                text: "Category: $selectedCategory",
                color: AppColors.primary,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ],
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.textBlack),
          onPressed: () => Get.back(),
        ),
      ),
      body: Column(
        children: [


          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 6.w),
              itemCount: 15,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    controller.navigateToProductDetails();
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Container(
                      width: double.infinity,
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
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Image.asset(ImagePath.banner_fruit,
                                height: 65.h,
                                width: 85.w,
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: "Organic Potato",
                                    color: AppColors.textBlack,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    textAlign: TextAlign.center,
                                  ),
                                  CustomText(
                                    text: "\$4.5/kg ",
                                    color: AppColors.primary,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Image.asset(ImagePath.banner_cart,
                                height: 30.w,
                                width: 30.w,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}