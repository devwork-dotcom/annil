
import 'package:annill/features/authentication/controllers/email_verification_controller.dart';
import 'package:annill/features/cart/controller/cart_controller.dart';
import 'package:annill/features/cart/controller/checkout_controller.dart';
import 'package:annill/features/home/controllers/product_controller.dart';
import 'package:annill/features/orders/controllers/customer_review_controller.dart';
import 'package:annill/features/orders/controllers/invoice_controller.dart';
import 'package:annill/features/orders/controllers/order_controller.dart';
import 'package:annill/features/orders/controllers/order_tracking_controller.dart';
import 'package:get/get.dart';

import '../../features/home/controllers/home_controller.dart';
import '../../features/nav_bar/controllers/nav_bar_controller.dart';
import '../../features/profile/controller/profile_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut<EmailVerificationController>(
          () => EmailVerificationController(),
      fenix: true,
    );

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
    Get.lazyPut(() => OrderTrackingController(),fenix: true);
    Get.lazyPut(() => InvoiceController(),fenix: true);
    Get.lazyPut(() => CustomerReviewController(),fenix: true);


    Get.lazyPut(() => ProfileController(),fenix: true);


  }
}