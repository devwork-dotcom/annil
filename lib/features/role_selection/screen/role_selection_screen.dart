
import 'package:annill/core/common/widgets/custom_text_field.dart';
import 'package:annill/core/utils/constants/app_sizer.dart';
import 'package:annill/core/utils/constants/logo_path.dart';
import 'package:annill/features/authentication/presentation/widgets/back_to_login.dart';
import 'package:annill/features/authentication/presentation/widgets/title_widget.dart';
import 'package:annill/routes/app_routes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../core/utils/constants/app_colors.dart';
import '../../../core/common/widgets/custom_button.dart';
import '../../../core/common/widgets/custom_text.dart';
import '../../../core/utils/constants/image_path.dart';
import '../controller/role_selection_controller.dart';

class RoleSelectionScreen extends GetView<RoleSelectionController> {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 26),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30.h),
                    Center(child: Image.asset(LogoPath.loginRole, width: 130.w, height: 150.h)),
                    SizedBox(height: 32.h),
                    TitleWidget(
                        title: "Choose Your Role",
                        subtitle: "Select the role that best fits your purpose"),

                    SizedBox(height: 30.h),

                    CustomButton(
                        text: "Become a Farmer",
                        isUpperCase: false,
                        onTap: (){
                          controller.setFarmerRole();

                        }),
                    SizedBox(height: 20.h),
                    CustomButton(
                        text: "Become a Customer",
                        isUpperCase: false,
                        backgroundColor: AppColors.whiteHeading,
                        borderColor: AppColors.primary,
                        textColor: AppColors.textPrimary,
                        isOutline: true,
                        onTap: (){
                          controller.setCustomerRole();
                        }),




                    SizedBox(height: 100.h),
                    BackToLogin(onTap: (){
                      Get.toNamed(AppRoute.loginScreen);
                    }),


                  ],
                ),
              ),
            ))
    );
  }
}