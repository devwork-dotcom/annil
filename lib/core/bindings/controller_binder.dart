
import 'package:annill/features/authentication/controllers/email_verification_controller.dart';
import 'package:annill/features/cart/controller/cart_controller.dart';
import 'package:annill/features/cart/controller/checkout_controller.dart';
import 'package:annill/features/home/controllers/customer/home_controller_customer.dart';
import 'package:annill/features/home/controllers/customer/product_controller_customer.dart';
import 'package:annill/features/home/controllers/farmer/add_products_controller.dart';
import 'package:annill/features/home/controllers/farmer/edit_product_controller.dart';
import 'package:annill/features/home/controllers/farmer/home_controller_farmer.dart';
import 'package:annill/features/orders/controllers/customer_review_controller.dart';
import 'package:annill/features/orders/controllers/invoice_controller.dart';
import 'package:annill/features/orders/controllers/order_controller.dart';
import 'package:annill/features/orders/controllers/order_tracking_controller.dart';
import 'package:annill/features/products/controller/products_controller.dart';
import 'package:annill/features/profile/controller/my_earning_controller.dart';
import 'package:annill/features/role_selection/controller/role_selection_controller.dart';
import 'package:get/get.dart';

import '../../features/nav_bar/controllers/nav_bar_controller.dart';
import '../../features/profile/controller/profile_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut(() => RoleSelectionController(),fenix: true);

    Get.lazyPut<EmailVerificationController>(
          () => EmailVerificationController(),
      fenix: true,
    );

    Get.lazyPut<NavBarController>(
          () => NavBarController(),
      fenix: true,
    );

    Get.lazyPut<HomeControllerCustomer>(
          () => HomeControllerCustomer(),
      fenix: true,
    );


    //Customer Controller Binding
    Get.lazyPut(() => ProductsControllerCustomer(),fenix: true);
    Get.lazyPut(() => CartController(),fenix: true);
    Get.lazyPut(() => CheckoutController(),fenix: true);
    Get.lazyPut(() => OrderController(),fenix: true);
    Get.lazyPut(() => OrderTrackingController(),fenix: true);
    Get.lazyPut(() => InvoiceController(),fenix: true);
    Get.lazyPut(() => CustomerReviewController(),fenix: true);

    Get.lazyPut(() => ProfileController(),fenix: true);

    //Customer Controller Binding
    Get.lazyPut(() => HomeControllerFarmer(),fenix: true);
    Get.lazyPut(() => AddProductsController(),fenix: true);
    Get.lazyPut(() => EditProductController(),fenix: true);
    Get.lazyPut(() => ProductsControllerFarmer(),fenix: true);
    Get.lazyPut(() => MyEarningController(),fenix: true);
  }
}