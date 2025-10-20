import 'package:annill/core/common/widgets/custom_button.dart';
import 'package:annill/core/common/widgets/custom_text.dart';
import 'package:annill/core/utils/constants/app_colors.dart';
import 'package:annill/core/utils/constants/app_sizer.dart';
import 'package:annill/core/utils/constants/image_path.dart';
import 'package:annill/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingInitScreen extends StatelessWidget {
  const OnboardingInitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                SizedBox(height: 20.h),
                CustomText(
                  text: 'Fresh Vegetables',
                  fontSize: 34.sp,
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.bold,

                ),
                SizedBox(height: 10.h),
                CustomText(
                  text:
                  'Discover farm-fresh, chemical-free vegetables picked daily. Order easily, customize quantities, and enjoy healthy goodness delivered straight to your doorstep.',
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w400,
                  fontSize: 18.sp,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24.h),
                Center(child: Image.asset(ImagePath.rolePng,
                  height: 317.h,
                  width: 317.w,
                  fit: BoxFit.cover,
                )),
                SizedBox(height: 56.h),

                CustomButton(
                    text: "Login",
                    isUpperCase: false,
                    onTap: (){
                      Get.offNamed(AppRoute.loginScreen);
                    }),
                SizedBox(height: 20.h),
                CustomButton(
                    text: "Registration",
                    backgroundColor: AppColors.whiteHeading,
                    borderColor: AppColors.primary,
                    textColor: AppColors.textPrimary,
                    isUpperCase: false,
                    isOutline: true,
                    onTap: (){
                      Get.offNamed(AppRoute.roleSelectionScreen);
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
