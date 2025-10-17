import 'package:annill/routes/app_routes.dart';
import 'package:get/get.dart';

class ProductController extends GetxController{

  void navigateToProductDetails() {
    Get.toNamed(
      AppRoute.productDetailsScreen,
    );
  }


}