import 'package:annill/core/services/Auth_service.dart';
import 'package:annill/core/utils/constants/app_colors.dart';
import 'package:annill/core/utils/constants/app_sizer.dart';
import 'package:annill/core/utils/constants/icon_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controllers/nav_bar_controller.dart';

class NavBar extends GetView<NavBarController> {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.textSecondary,

      // ✅ Body: only show screen when loaded
      body: Obx(() {
        if (controller.screens.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        return controller.screens[controller.currentIndex];
      }),

      // ✅ Bottom Navigation Bar
      bottomNavigationBar: Obx(() {
        final userRole = controller.role.value;

        return BottomNavigationBar(
          currentIndex: controller.currentIndex,
          onTap: controller.changeIndex,
          backgroundColor: Colors.white,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.navUnselectedColor,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          elevation: 0,
          selectedLabelStyle: GoogleFonts.openSans(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
          unselectedLabelStyle: GoogleFonts.openSans(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
          items: [
            _buildNavItem(iconPath: IconPath.home, label: 'Home'),

            _buildNavItem(
              iconPath: userRole == "farmer"
                  ? IconPath.products
                  : IconPath.carts,
              label: userRole == "farmer" ? 'Products' : 'Carts',
            ),

            _buildNavItem(iconPath: IconPath.orders, label: 'Orders'),
            _buildNavItem(iconPath: IconPath.profile, label: 'Profile'),
          ],
        );
      }),
    );
  }

  BottomNavigationBarItem _buildNavItem({
    required String iconPath,
    required String label,
  }) {
    return BottomNavigationBarItem(
      activeIcon: SvgPicture.asset(
        iconPath,
        width: 20,
        height: 20,
        colorFilter: const ColorFilter.mode(
          AppColors.primary,
          BlendMode.srcIn,
        ),
      ),
      icon: SvgPicture.asset(
        iconPath,
        width: 20,
        height: 20,
        colorFilter: const ColorFilter.mode(
          AppColors.navUnselectedColor,
          BlendMode.srcIn,
        ),
      ),
      label: label,
    );
  }
}
