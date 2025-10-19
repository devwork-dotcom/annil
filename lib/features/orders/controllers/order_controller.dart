import 'package:annill/core/utils/constants/app_colors.dart';
import 'package:annill/features/orders/model/order_data_model.dart';
import 'package:annill/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  var price = 12.obs;
  var status = "Accepted".obs;
  var currentTabIndex = 0.obs;

  final List<String> tabs = [
    "Pending",
    "Accepted",
    "Completed",
    "Reject",
    "Cancelled",
  ];

  // Order items list
  var orders = <OrderItem>[].obs;
  var filteredOrders = <OrderItem>[].obs;

  @override
  void onInit() {
    tabController = TabController(length: tabs.length, vsync: this);
    tabController.addListener(() {
      currentTabIndex.value = tabController.index;
      _filterOrdersByCurrentTab();
    });
    _generateOrders();
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  void _generateOrders() {
    final hotels = [
      "Sunshine Hotel", "Grand Plaza", "Royal Palace", "Ocean View", "Mountain Resort",
      "City Inn", "Luxury Suites", "Business Hotel", "Family Resort", "Budget Stay"
    ];

    final products = [
      "Organic Tomatoes", "Fresh Carrots", "Green Potatoes", "Red Apples", "Bananas",
      "Spinach", "Broccoli", "Cauliflower", "Bell Peppers", "Onions"
    ];

    final statusList = ["Pending", "Accepted", "Completed", "Reject", "Cancelled"];

    orders.clear();

    for (int i = 1; i <= 30; i++) {
      orders.add(OrderItem(
        hotelName: hotels[i % hotels.length],
        productName: products[i % products.length],
        orderId: "ORD-${i.toString().padLeft(3, '0')}",
        quantity: (i % 10) + 1,
        price: (i * 5.0) + 10.0,
        status: statusList[i % statusList.length],
      ));
    }

    _filterOrdersByCurrentTab();
  }

  void _filterOrdersByCurrentTab() {
    String currentStatus = tabs[currentTabIndex.value];
    filteredOrders.value = orders.where((order) => order.status == currentStatus).toList();
  }

  String get currentStatus {
    return tabs[currentTabIndex.value];
  }

  bool get shouldShowTrackButton {
    return currentTabIndex.value == 0 || currentTabIndex.value == 1;
  }

  String get currentTabName {
    return tabs[currentTabIndex.value];
  }

  // Helper method for status color
  Color getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case "accepted":
        return AppColors.success.withOpacity(0.1);
      case "completed":
        return AppColors.primary.withOpacity(0.1);
      case "reject":
        return AppColors.error.withOpacity(0.1);
      case "cancelled":
        return AppColors.error.withOpacity(0.1);
      case "pending":
        return AppColors.error.withOpacity(0.1);
      default:
        return AppColors.error;
    }
  }

  // Helper method for status text color
  Color getStatusTextColor(String status) {
    switch (status.toLowerCase()) {
      case "accepted":
        return AppColors.success;
      case "completed":
        return AppColors.primary;
      case "reject":
        return AppColors.error;
      case "cancelled":
        return AppColors.error;
      case "pending":
        return AppColors.error;
      default:
        return AppColors.error;
    }
  }

  void navigateToOrderTrackingScreen (){
    Get.toNamed(AppRoute.orderTrackingScreen);

  }

  void navigateInvoiceScreen (){
    Get.toNamed(AppRoute.invoiceScreen);

  }
  void navigateCustomerScreen (){
    Get.toNamed(AppRoute.customerReviewScreen);

  }

}