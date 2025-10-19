import 'package:annill/core/utils/constants/app_sizer.dart';
import 'package:annill/features/authentication/controllers/email_verification_controller.dart';
import 'package:annill/features/authentication/presentation/widgets/back_to_login.dart';
import 'package:annill/features/authentication/presentation/widgets/title_widget.dart';
import 'package:annill/routes/app_routes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../../core/common/widgets/custom_button.dart';
import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/common/widgets/custom_text_field.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/logo_path.dart';
import '../../controllers/forget_pass_controller.dart';

class EmailVerifyScreen extends GetView<EmailVerificationController> {
   EmailVerifyScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 26),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 30.h),
                Center(child: Image.asset(LogoPath.emailPath, width: 166.w, height: 130.h)),
                SizedBox(height: 32.h),
                TitleWidget(
                  title: "Enter your email",
                  titleFontSize: 24.sp,
                  subtitle: "You will get OTP in your email for password recovery",
                  subtitleFontSize: 16.sp,
                ),

                SizedBox(height: 30.h),
                CustomTextField(
                    hintText: 'Email',
                  controller: controller.emailText,
                  radius: 10,
                ),
                SizedBox(height: 50.h),
                CustomButton(
                    text: 'Continue',
                    isUpperCase: false,
                    onTap: controller.navigateToOTPVerifyScreen),


                SizedBox(height: 60.h),
                BackToLogin(onTap: (){
                  Get.toNamed(AppRoute.loginScreen);
                }),
              ],
            ),
          )),
    );
  }
}
