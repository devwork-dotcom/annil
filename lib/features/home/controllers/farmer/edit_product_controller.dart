import 'dart:io';

import 'package:annill/core/common/widgets/custom_text.dart';
import 'package:annill/core/utils/constants/app_colors.dart';
import 'package:annill/core/utils/constants/app_sizer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProductController extends GetxController{
  var productNameController = TextEditingController().obs;
  var descriptionNameController = TextEditingController().obs;

  var selectedCategory = "".obs;
  var selectedUnit = "".obs;
  List<String> categoryItems = [
    "Fruit",
    "Vegetable",
    "Grains & Cereals",
    "Dairy Products",
    "Poultry & Meat",
    "Seafood",
    "Spices & Herbs",
    "Beverages",
    "Bakery Items",
    "Dry Fruits & Nuts",
    "Seeds & Legumes",
    "Frozen Foods",
    "Organic Produce",
    "Flowers & Plants",
    "Honey & Jams",
  ];
  List<String> unitItems = [
    "Kilogram (kg)",
    "Gram (g)",
    "Liter (L)",
    "Milliliter (mL)",
    "Pound (lb)",
    "Ounce (oz)",
    "Piece (pcs)",
    "Dozen (12 pcs)",
    "Bundle",
    "Box",
    "Packet",
    "Bottle",
    "Can",
    "Tray",
    "Bag",
  ];


  var productPriceController = TextEditingController().obs;
  var availableStockController = TextEditingController().obs;


  RxString imagePath = ''.obs;
  final ImagePicker _picker = ImagePicker();
  final Rx<File?> profileImage = Rx<File?>(null);

  void showImagePickerDialog() {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomText(
                text: "Choose Option",
                color: AppColors.textBlack,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 20),


              ListTile(
                leading: Icon(Icons.camera_alt, color: AppColors.primary),
                title: CustomText(
                  text: "Camera",
                  color: AppColors.textBlack,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
                onTap: () {
                  Get.back();
                  pickImage(ImageSource.camera);
                },
              ),


              ListTile(
                leading: Icon(Icons.photo_library, color: AppColors.primary),
                title: CustomText(
                  text: "Gallery",
                  color: AppColors.textBlack,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
                onTap: () {
                  Get.back();
                  pickImage(ImageSource.gallery);
                },
              ),

              SizedBox(height: 10),

              // Cancel Button
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => Get.back(),
                  child: CustomText(
                    text: "Cancel",
                    color: AppColors.textBlack,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> pickImage(ImageSource source) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        profileImage.value = File(pickedFile.path);
        imagePath.value = pickedFile.path;
        //await updateAccount();
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to pick image: $e');
    }
  }
}