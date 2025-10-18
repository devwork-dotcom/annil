
import 'package:annill/features/cart/controller/cart_controller.dart';
import 'package:annill/features/cart/controller/checkout_controller.dart';
import 'package:annill/features/home/controllers/product_controller.dart';
import 'package:annill/features/orders/controllers/order_controller.dart';
import 'package:get/get.dart';

import '../../features/home/controllers/home_controller.dart';
import '../../features/nav_bar/controllers/nav_bar_controller.dart';
import '../../features/profile/controller/profile_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavBarController>(
          () => NavBarController(),
      fenix: true,
    );

    Get.lazyPut<HomeController>(
          () => HomeController(),
      fenix: true,
    );

    Get.lazyPut<ProfileController>(
          () => ProfileController(),
      fenix: true,
    );

    Get.lazyPut(() => ProductController(),fenix: true);
    Get.lazyPut(() => CartController(),fenix: true);
    Get.lazyPut(() => CheckoutController(),fenix: true);
    Get.lazyPut(() => OrderController(),fenix: true);


  }
}