import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../../core/services/Auth_service.dart';
import '../../../core/common/widgets/app_snackber.dart';
import '../../../routes/app_routes.dart';

class RoleSelectionController extends GetxController {
  // Selected role (farmer / customer)
  var selectedRole = ''.obs;

  /// Farmer role
  Future<void> setFarmerRole() async {
    try {
      selectedRole.value = 'farmer';
      await AuthService.saveRole('farmer');

      if (kDebugMode) print("Saved role: farmer");
      Get.toNamed(AppRoute.signUpScreen, arguments: {"role": "farmer"});
    } catch (e) {
      AppSnackBar.error("Failed to set farmer role: $e");
    }
  }

  /// Customer role
  Future<void> setCustomerRole() async {
    try {
      selectedRole.value = 'customer';
      await AuthService.saveRole('customer');

      if (kDebugMode) print("Saved role: customer");
      Get.toNamed(AppRoute.signUpScreen, arguments: {"role": "customer"});
    } catch (e) {
      AppSnackBar.error("Failed to set customer role: $e");
    }
  }
}
