import 'package:annill/core/localization/app_texts.dart';
import 'package:annill/core/utils/constants/app_sizer.dart';
import 'package:annill/features/authentication/presentation/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


import '../../../../core/common/widgets/custom_button.dart';
import '../../../../core/common/widgets/custom_text.dart';
import 'package:get/get.dart';

import '../../../../core/common/widgets/custom_text_field.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/icon_path.dart';
import '../../../../core/utils/constants/logo_path.dart';
import '../../../../routes/app_routes.dart';
import '../../controllers/login_controller.dart';
import '../../controllers/social_auth_login.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final LoginController controller = Get.put(LoginController());
  final SocialAuthController socialAuthController = Get.put(SocialAuthController());
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
                    Center(child: Image.asset(LogoPath.splashLogo, width: 126.w, height: 150.h)),
                    SizedBox(height: 32.h),
                    TitleWidget(
                        title: "Login to your account",
                        subtitle: "Welcome back, please enter your detail"),

                    SizedBox(height: 30.h),


                    CustomTextField(
                      hintText: 'Email address',
                      controller: controller.phoneText,
                      radius: 10,
                    ),
                    SizedBox(height: 16.h),

                    Obx(() {
                      return CustomTextField(

                        hintText: AppText.enterYourPassword.tr,
                        controller: controller.passwordText,
                        obscureText: controller.obSecureText.value,
                        radius: 10,
                        suffixIcon: GestureDetector(
                          onTap:
                              () =>
                          controller.obSecureText.value =
                          !controller.obSecureText.value,
                          child:
                          controller.obSecureText.value
                              ? Icon(
                            Icons.visibility_off_outlined,
                            color: Colors.grey,
                          )
                              : Icon(
                            Icons.visibility_outlined,
                            color: Colors.grey,
                          ),
                        ),
                      );
                    }),
                    SizedBox(height: 8.h),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoute.emailVerifyScreen);
                        },
                        child: CustomText(
                          text: 'Forgot Password?',
                          color: AppColors.brandColor,
                        ),
                      ),
                    ),
                    SizedBox(height: 32.h),
                    CustomButton(

                        text: 'Sign In',
                        isUpperCase: false,
                        onTap: () {
                          controller.signIn();
                        }),
                    SizedBox(height: 32.h),
                    Center(
                      child: Wrap(
                        children: [
                          CustomText(text: 'Doesn’t have account? ',
                              color: AppColors.paragraphColor,
                            fontSize: 16.sp,
                          ),
                          GestureDetector(
                            onTap: (){
                              Get.toNamed(AppRoute.roleSelectionScreen);
                            },
                            child: CustomText(text: 'Sign Up',
                                color: AppColors.textPrimary,
                              fontSize: 16.sp,
                            ),
                          ),
                        ],
                      ),
                    ),



                  ],
                ),
              ),
            ))
    );
  }
}
