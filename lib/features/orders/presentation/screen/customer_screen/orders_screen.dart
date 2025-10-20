import 'package:annill/core/common/widgets/custom_text.dart';
import 'package:annill/core/utils/constants/app_colors.dart';
import 'package:annill/core/utils/constants/app_sizer.dart';
import 'package:annill/features/orders/controllers/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../tabbar_screen/tabbar_order_screen.dart';

class OrdersScreen extends GetView<OrderController> {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: Column(
          children: [
            CustomText(
              text: "Orders",
              color: AppColors.textBlack,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48.h),
          child: TabBar(
            padding: EdgeInsets.zero,
            controller: controller.tabController,
            isScrollable: true,
            indicatorColor: AppColors.primary,
            indicatorWeight: 3.h,
            labelColor: AppColors.primary,
            unselectedLabelColor: AppColors.textSecondary,
            labelPadding: EdgeInsets.symmetric(horizontal: 20.w),
            labelStyle: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textSecondary

            ),
            unselectedLabelStyle: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textSecondary
            ),
            tabs: controller.tabs.map((tab) => Tab(text: tab)).toList(),
          ),
        ),
      ),
      body: TabBarView(
        controller: controller.tabController,
        physics: const BouncingScrollPhysics(),
        children: const [
          TabbarOrdersScreen(),
          TabbarOrdersScreen(),
          TabbarOrdersScreen(),
          TabbarOrdersScreen(),
          TabbarOrdersScreen(),
        ],
      ),
    );
  }
}
