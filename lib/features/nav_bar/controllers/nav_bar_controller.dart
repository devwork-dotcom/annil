


import 'package:annill/features/cart/presentation/screen/cart_screen.dart';
import 'package:annill/features/orders/presentation/screen/orders_screen.dart';
import 'package:get/get.dart';
import '../../../core/services/Auth_service.dart';
import '../../home/presentaion/screens/home_screen.dart';
import '../../profile/presentation/screens/profile_screen.dart';

class NavBarController extends GetxController {
  var selectedIndex = 0.obs;

  int get currentIndex => selectedIndex.value;

  List screens = [
    HomeScreen(),
    CartScreen(),
    OrdersScreen(),
    ProfileScreen(),
  ];

  @override
  void onInit() {
    super.onInit();
    AuthService.init();
  }

  void changeIndex(int index) {
    if (selectedIndex.value == index) {
      return;
    }

    selectedIndex.value = index;
  }

  void backToHome() {
    changeIndex(0);
  }
}