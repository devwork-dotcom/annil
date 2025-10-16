import 'package:annill/core/utils/constants/app_sizer.dart';
import 'package:annill/core/utils/constants/logo_path.dart';
import 'package:annill/features/authentication/presentation/widgets/title_widget.dart';
import 'package:annill/routes/app_routes.dart';
import 'package:flutter/material.dart';


import 'package:get/get.dart';
import '../../../../core/common/widgets/custom_button.dart';
import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/common/widgets/custom_text_field.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/icon_path.dart';

import '../../../../core/utils/validators/app_validator.dart';
import '../../controllers/reset_password_controller.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});

  final ResetPasswordController controller = Get.put(ResetPasswordController());
  //final SignUpController signController = Get.put(SignUpController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 26),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              SizedBox(height: 30.h),
              Center(child: Image.asset(LogoPath.splashLogo, width: 126.w, height: 150.h)),
              SizedBox(height: 32.h),
              TitleWidget(
                  title: "Reset your password",
                  subtitle: "Welcome back, please enter your detail"),

              SizedBox(height: 30.h),
              Obx(() {
                return CustomTextField(
                  prefixIconPath: Image.asset(IconPath.images,),
                  hintText: 'Enter New Password',
                  controller: controller.passwordTEController,
                  obscureText: controller.isPasswordVisible.value,
                  suffixIcon: GestureDetector(
                    onTap:
                        () =>
                    controller.isPasswordVisible.value,
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
                );
              }),
              SizedBox(height: 8.h),

              Obx(() {
                return CustomTextField(
                  prefixIconPath: Image.asset(IconPath.images,),
                  hintText: 'Enter Confirm Password',
                  controller: controller.confirmPasswordTEController,
                  obscureText: controller.isComPasswordVisible.value,
                  suffixIcon: GestureDetector(
                    onTap:
                        () =>
                    controller.isComPasswordVisible.value =
                    !controller.isComPasswordVisible.value,
                    child:
                    controller.isComPasswordVisible.value
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
              SizedBox(height: 30.h,),
              CustomButton(
                  text: 'Change Password',
                  onTap: (){
                    if(_formKey.currentState!.validate()){
                      controller.resetPassword();
                    }
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
      )),
    );
  }
}
