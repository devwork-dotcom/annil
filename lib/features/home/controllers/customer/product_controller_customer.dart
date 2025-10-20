import 'package:annill/routes/app_routes.dart';
import 'package:get/get.dart';

class ProductsControllerCustomer extends GetxController{
  var productQuantity = 1.obs;

  var isDescription = true.obs;

  // Increase quantity
  void increaseQuantity() {
    productQuantity.value++;
  }

  // Decrease quantity (minimum 1)
  void decreaseQuantity() {
    if (productQuantity.value > 1) {
      productQuantity.value--;
    }
  }

  // Reset quantity
  void resetQuantity() {
    productQuantity.value = 1;
  }

  void showDescription() {
    isDescription.value = true;
  }

  void showReview() {
    isDescription.value = false;
  }




  void navigateToProductDetails() {
    Get.toNamed(
      AppRoute.productDetailsScreen,
    );
  }

  void navigateToFarmProfile() {
    Get.toNamed(
      AppRoute.farmProfileScreen,
    );
  }


}