import 'package:annill/core/common/widgets/custom_button.dart';
import 'package:annill/core/common/widgets/custom_container.dart';
import 'package:annill/core/common/widgets/custom_dropdown.dart';
import 'package:annill/core/common/widgets/custom_text.dart';
import 'package:annill/core/utils/constants/app_colors.dart';
import 'package:annill/core/utils/constants/app_sizer.dart';
import 'package:annill/features/cart/presentation/widgets/text_field_with_title_widget.dart';
import 'package:annill/features/home/controllers/farmer/add_products_controller.dart';
import 'package:annill/features/home/presentaion/widgets/CustomTitleTextField.dart';
import 'package:annill/features/home/presentaion/widgets/add_photo_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class AddProductsScreen extends GetView<AddProductsController> {
  const AddProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerLeft,
          child: CustomText(
            text: "Add Products",
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
      body: Obx((){
        return SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding:  EdgeInsets.all(15.w),
              child: Column(
                children: [

                  CustomContainer(
                      child: Padding(
                        padding:  EdgeInsets.all(15.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            CustomText(
                              text: "Upload Images",
                              color: AppColors.textPrimary,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            Gap(10.h),
                            DashedAddPhotoBox(onTap: (){
                              controller.showImagePickerDialog();
                            }),

                          ],

                        ),
                      )),

                  Gap(20.h),
                  CustomContainer(
                      child: Padding(
                        padding:  EdgeInsets.all(15.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [


                            CustomTitleTextField(
                              title: "Product Name",
                              controller: controller.productNameController.value,
                              keyboardType: TextInputType.text,
                            ),

                            CustomTitleTextField(
                              title: "Description",
                              controller: controller.productNameController.value,
                              keyboardType: TextInputType.text,
                            ),


                            Gap(10.h),
                            Row(

                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      CustomText(
                                        text: "Category",
                                        color: AppColors.textPrimary,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      Gap(5.h),
                                      CustomDropdownField(
                                          hintText: "Select",
                                          textStyle: TextStyle(
                                              fontSize: 10.sp,
                                              color: AppColors.textBlack,
                                              fontWeight: FontWeight.normal
                                          ),
                                          items: controller.categoryItems,
                                          selectedValue: controller.selectedCategory.value,
                                          onChanged: (value)=>controller.selectedCategory.value = value),
                                    ],
                                  ),
                                ),
                                Gap(10.w),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      CustomText(
                                        text: "Unit",
                                        color: AppColors.textPrimary,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      Gap(5.h),
                                      CustomDropdownField(
                                          hintText: "Select",
                                          textStyle: TextStyle(
                                            fontSize: 10.sp,
                                            color: AppColors.textBlack,
                                            fontWeight: FontWeight.normal
                                          ),
                                          items: controller.unitItems,
                                          selectedValue: controller.selectedUnit.value,
                                          onChanged: (value)=>controller.selectedUnit.value = value),
                                    ],
                                  ),
                                ),
                              ],
                            ),


                          ],

                        ),
                      )),

                  Gap(20.h),
                  CustomContainer(
                      child: Padding(
                        padding:  EdgeInsets.all(15.w),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: CustomTitleTextField(
                                title: "Price per unit",
                                controller: controller.productPriceController.value,
                                keyboardType: TextInputType.text,
                              ),
                            ),

                            Gap(10.w),

                            Expanded(
                              flex: 1,
                              child: CustomTitleTextField(
                                title: "Available Stock",
                                controller: controller.availableStockController.value,
                                keyboardType: TextInputType.text,
                              ),
                            ),
                          ],
                        ),
                      )),
                  Gap(20.h),

                  CustomButton(
                      text:"Add Product" ,
                      isUpperCase: false,
                      onTap: (){

                      },
                  ),
                  Gap(20.h),




                ],
              ),
            ),
          ),
        );
      })
    );
  }
}