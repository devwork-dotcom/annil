
import 'package:annill/features/home/presentaion/screens/customer_view/all_products_screen.dart';
import 'package:annill/features/home/presentaion/widgets/category_filter_widget.dart';
import 'package:annill/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeControllerCustomer extends GetxController {
  var selectedCategory = ''.obs;
  var showBottomPopup = false.obs;





  void selectCategory(String category) {
    selectedCategory.value = category;
    showBottomPopup.value = false;
  }


  void clearSelection() {
    selectedCategory.value = '';
  }

  void showCategoryDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {

        return CategoryFilter(
          selectedCategory: selectedCategory.value,
          onCategorySelected: selectCategory,
          onClose: () => Navigator.pop(context),

        );
      },
    );
  }

  void navigateToAllProducts() {
    Get.toNamed(
      AppRoute.allProductScreen,
      arguments: selectedCategory.value,
    );
  }

}