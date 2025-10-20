import 'package:annill/core/common/widgets/custom_button.dart';
import 'package:annill/core/common/widgets/custom_search_field.dart';
import 'package:annill/core/common/widgets/custom_text.dart';
import 'package:annill/core/services/Auth_service.dart';
import 'package:annill/core/utils/constants/app_sizer.dart';
import 'package:annill/core/utils/constants/icon_path.dart';
import 'package:annill/core/utils/constants/image_path.dart';
import 'package:annill/features/home/controllers/customer/home_controller_customer.dart';
import 'package:annill/features/home/presentaion/screens/customer_view/customer_home_screen.dart';
import 'package:annill/features/home/presentaion/screens/farmer_view/farmer_home_screen.dart';
import 'package:annill/features/home/presentaion/widgets/category_filter_widget.dart';
import 'package:annill/features/home/presentaion/widgets/search_item_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../core/utils/constants/app_colors.dart';

class HomeScreen extends GetView<HomeControllerCustomer> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userRole = AuthService.role;

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SafeArea(
        top: false,
        child:
        userRole =="farmer" ?
        const FarmerHomeScreen():
        const CustomerHomeScreen(),
      ),
    );
  }
}

