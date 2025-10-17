import 'package:annill/core/common/widgets/custom_button.dart';
import 'package:annill/core/common/widgets/custom_text.dart';
import 'package:annill/core/utils/constants/app_colors.dart';
import 'package:annill/core/utils/constants/app_sizer.dart';
import 'package:annill/features/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryFilter extends GetView<HomeController> {
  final String selectedCategory;
  final Function(String) onCategorySelected;
  final Function() onClose;

  const CategoryFilter({
    super.key,
    required this.selectedCategory,
    required this.onCategorySelected,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    String tempSelectedCategory = selectedCategory;

    return StatefulBuilder(
      builder: (context, setState) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.5,
          margin: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.w),
          ),
          child: Column(
            children: [
              // Header
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey.shade300,
                      width: 1,
                    ),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Center(
                        child: CustomText(
                            text: "Shorting",
                          fontWeight: FontWeight.w500,
                          fontSize: 18.sp,

                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: onClose,
                        child: Container(
                          width: 32.w,
                          height: 32.h,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.close, size: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Header
              RadioListTile<String>(
                title: Text(
                  "Vegetables",
                  style: TextStyle(fontSize: 16.sp),
                ),
                value: "Vegetables",
                groupValue: tempSelectedCategory,
                onChanged: (value) {
                  setState(() {
                    tempSelectedCategory = value!;
                  });
                },
                activeColor: AppColors.primary,
              ),

              RadioListTile<String>(
                title: Text(
                  "Fruits",
                  style: TextStyle(fontSize: 16.sp),
                ),
                value: "Fruits",
                groupValue: tempSelectedCategory,
                onChanged: (value) {
                  setState(() {
                    tempSelectedCategory = value!;
                  });
                },
                activeColor: AppColors.primary,
              ),

              RadioListTile<String>(
                title: Text(
                  "Dairy",
                  style: TextStyle(fontSize: 16.sp),
                ),
                value: "Dairy",
                groupValue: tempSelectedCategory,
                onChanged: (value) {
                  setState(() {
                    tempSelectedCategory = value!;
                  });
                },
                activeColor: AppColors.primary,
              ),

              /*Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    RadioListTile<String>(
                      title: Text(
                        "Vegetables",
                        style: TextStyle(fontSize: 16.sp),
                      ),
                      value: "Vegetables",
                      groupValue: tempSelectedCategory,
                      onChanged: (value) {
                        setState(() {
                          tempSelectedCategory = value!;
                        });
                      },
                      activeColor: AppColors.primary,
                    ),

                    RadioListTile<String>(
                      title: Text(
                        "Fruits",
                        style: TextStyle(fontSize: 16.sp),
                      ),
                      value: "Fruits",
                      groupValue: tempSelectedCategory,
                      onChanged: (value) {
                        setState(() {
                          tempSelectedCategory = value!;
                        });
                      },
                      activeColor: AppColors.primary,
                    ),

                    RadioListTile<String>(
                      title: Text(
                        "Dairy",
                        style: TextStyle(fontSize: 16.sp),
                      ),
                      value: "Dairy",
                      groupValue: tempSelectedCategory,
                      onChanged: (value) {
                        setState(() {
                          tempSelectedCategory = value!;
                        });
                      },
                      activeColor: AppColors.primary,
                    ),
                  ],
                ),
              ),*/

              if (tempSelectedCategory.isNotEmpty)
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    border: Border(
                      top: BorderSide(
                        color: Colors.grey.shade300,
                        width: 1,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: AppColors.primary,
                        size: 20,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        "Selected: $tempSelectedCategory",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),

              Container(
                padding: EdgeInsets.symmetric(vertical:  16.w,horizontal: 50.w),
                child: tempSelectedCategory.isNotEmpty
                    ? CustomButton(
                  text: "Apply",
                  onTap: () {
                    onCategorySelected(tempSelectedCategory);
                    Navigator.pop(context);
                    controller.navigateToAllProducts();
                  },
                  backgroundColor: AppColors.primary,
                  textColor: Colors.white,
                  isUpperCase: false,
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  borderRadius: BorderRadius.circular(12.w),
                )
                    : CustomButton(
                  text: "Apply",
                  onTap: () {},
                  backgroundColor: Colors.grey.shade300,
                  textColor: Colors.white,
                  isUpperCase: false,
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  borderRadius: BorderRadius.circular(12.w),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}