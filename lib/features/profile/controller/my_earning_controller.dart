import 'dart:math';
import 'dart:ui';

import 'package:annill/core/utils/constants/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MyEarningController extends GetxController{

  final paymentAmountController = TextEditingController();
  final orders = <Map<String, dynamic>>[].obs;

  final List<String> _statuses = [
    "Active",
    "Paid",
  ];

  @override
  void onInit() {
    super.onInit();
    _generateFakeOrders();
  }

  void _generateFakeOrders() {
    final random = Random();
    for (int i = 1; i <= 25; i++) {
      final randomStatus = _statuses[random.nextInt(_statuses.length)];

      orders.add({
        "hotelName": "Hotel ${String.fromCharCode(65 + (i % 26))}",
        "orderId": "ORD${1000 + i}",
        "price": (random.nextInt(500) + 50).toString(),
        "productName": "Product ${i}",
        "quantity": random.nextInt(10) + 1,
        "status": randomStatus,
      });
    }
  }

  Color getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case "active":
        return AppColors.success.withOpacity(0.1);
      case "paid":
        return AppColors.success.withOpacity(0.1);
      case "accepted":
        return AppColors.success.withOpacity(0.1);
      case "completed":
        return AppColors.success.withOpacity(0.1);
      case "reject":
      case "cancelled":
      case "pending":
        return AppColors.error.withOpacity(0.1);
      default:
        return AppColors.error.withOpacity(0.1);
    }
  }

  Color getStatusTextColor(String status) {
    switch (status.toLowerCase()) {
      case "active":
        return AppColors.success;
      case "paid":
      case "accepted":
        return AppColors.success;
      case "completed":
        return AppColors.success;
      case "reject":
      case "cancelled":
      case "pending":
        return AppColors.error;
      default:
        return AppColors.error;
    }
  }
}