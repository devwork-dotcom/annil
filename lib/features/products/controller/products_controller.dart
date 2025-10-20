import 'package:annill/routes/app_routes.dart';
import 'package:get/get.dart';

class ProductsControllerFarmer extends GetxController{


  void navigateToAddProductsScreen(){
    Get.toNamed(AppRoute.addProducts);
  }

  void navigateToUpdateProductsScreen(){
    Get.toNamed(AppRoute.editProducts);
  }

}