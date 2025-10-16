import 'package:annill/core/utils/constants/app_sizer.dart';
import 'package:annill/features/authentication/presentation/widgets/title_widget.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

import '../../../../core/common/widgets/custom_button.dart';

import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/common/widgets/custom_text_field.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/icon_path.dart';
import '../../../../core/utils/constants/logo_path.dart';
import 'package:get/get.dart';

import '../../../../core/utils/validators/app_validator.dart';
import '../../../../routes/app_routes.dart';
import '../../controllers/sing_up_controller.dart';
class SignUpScreen extends StatelessWidget {
   SignUpScreen({super.key});

   final SignUpController controller = Get.put(SignUpController());
   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 26),
                child: Form(
                  key: _formKey,
                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30.h),
                      Center(child: Image.asset(LogoPath.splashLogo, width: 126.w, height: 150.h)),
                      SizedBox(height: 32.h),
                      TitleWidget(
                          title: "Create an account",
                          subtitle: "Welcome back, please enter your detail"),

                      SizedBox(height: 30.h),
                      CustomTextField(
                        hintText: 'Full Name',
                        controller: controller.nameTEController,
                        radius: 10,
                        hintTextSize: 18.sp,
                      ),

                      SizedBox(height: 15.h),
                      CustomTextField(
                        hintText: 'Email Address',
                        controller: controller.emailTEController,
                        validator: AppValidator.validateEmail,
                        radius: 10,
                        hintTextSize: 18.sp,
                      ),

                      SizedBox(height: 15.h),
                      Obx(() {
                        return CustomTextField(
                          prefixIconPath: Image.asset(IconPath.lock),
                          hintText: 'Password',
                          controller: controller.passwordTEController,
                          obscureText: controller.isPasswordVisible.value,
                          suffixIcon: GestureDetector(
                            onTap:
                                () =>
                            controller.isPasswordVisible.value =
                            !controller.isPasswordVisible.value,
                            child:
                            controller.isPasswordVisible.value
                                ? Icon(
                              Icons.visibility_off_outlined,
                              color: Colors.grey,
                            )
                                : Icon(
                              Icons.visibility_outlined,
                              color: Colors.grey,
                            ),
                          ),
                          validator: AppValidator.validatePassword,

                          radius: 10,
                          hintTextSize: 18.sp,
                        );
                      }),

                      SizedBox(height: 15.h),
                      CustomTextField(
                        hintText: 'Enter Location',
                        controller: controller.locationTEController,
                        validator: AppValidator.validateEmail,
                        radius: 10,
                        hintTextSize: 18.sp,
                        suffixIcon: Icon(Icons.location_on_outlined),
                      ),


                      SizedBox(height: 32.h),
                      CustomButton(

                          text: 'Sign Up',
                          isUpperCase: false,
                          onTap: () {
                            controller.signUp();
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
                                Get.toNamed(AppRoute.loginScreen);
                              },
                              child: CustomText(text: 'Sign In',
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
              ),
            ))
    );
  }



}
