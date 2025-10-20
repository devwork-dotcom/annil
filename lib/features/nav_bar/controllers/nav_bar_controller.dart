import 'package:annill/features/home/presentaion/screens/customer_view/customer_home_screen.dart';
import 'package:annill/features/orders/presentation/screen/customer_screen/orders_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/services/Auth_service.dart';
import '../../home/presentaion/screens/home_screen.dart';
import '../../profile/presentation/screens/profile_screen.dart';
import '../../cart/presentation/screen/cart_screen.dart';
import '../../home/presentaion/screens/farmer_view/farmer_home_screen.dart';
import '../../products/presentation/screen/products_screen.dart';

class NavBarController extends GetxController {
  var selectedIndex = 0.obs;
  var role = ''.obs;

  final RxList<Widget> screens = <Widget>[].obs;

  int get currentIndex => selectedIndex.value;

  @override
  void onInit() {
    super.onInit();
    _initRoleAndScreens();
  }

  Future<void> _initRoleAndScreens() async {
    await AuthService.init();
    role.value = AuthService.role ?? "customer";

    if (role.value == "farmer") {
      screens.assignAll([
        const FarmerHomeScreen(),
        const ProductsScreen(),
        const OrdersScreen(),
        const ProfileScreen(),
      ]);
    } else {
      screens.assignAll([
        const CustomerHomeScreen(),
        const CartScreen(),
        const OrdersScreen(),
        const ProfileScreen(),
      ]);
    }
  }

  void changeIndex(int index) {
    if (index != selectedIndex.value) {
      selectedIndex.value = index;
    }
  }

  void backToHome() {
    selectedIndex.value = 0;
  }
}
