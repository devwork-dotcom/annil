
import 'package:annill/core/utils/constants/app_sizer.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../core/common/widgets/custom_button.dart';

import '../../../../core/common/widgets/custom_text.dart';

import '../../../../core/common/widgets/custom_text_field.dart';
import '../../../../core/utils/constants/app_colors.dart';

import '../../../../core/utils/validators/app_validator.dart';
import '../../controller/change_password_controller.dart';


class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final changePasswordController = Get.put(ChangePasswordController());
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: CustomText(
          text: "Change Password",
          color: AppColors.textBlack,
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
        ),
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.h),
          child: Form(
            key: _formKey,
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 30.h),
                Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    spacing: 6,

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Current Password

                      Obx(() => CustomTextField(
                        controller: changePasswordController.currentPasswordController,
                        hintText: 'Current Password',
                        radius: 10.w,
                        obscureText:
                        !changePasswordController
                            .isCurrentPasswordVisible
                            .value,
                        suffixIcon: IconButton(
                          icon: Icon(
                            changePasswordController
                                .isCurrentPasswordVisible
                                .value
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: Color(0xFF6C757D),
                          ),
                          onPressed:
                          changePasswordController
                              .toggleCurrentPasswordVisibility,
                        ),
                      ),
                      ),
                      SizedBox(height: 5.h),
                      // New Password

                      Obx(() => CustomTextField(
                        controller:
                        changePasswordController.newPasswordController,
                        hintText: 'New Password',
                        radius: 10.w,
                        obscureText:
                        !changePasswordController.isNewPasswordVisible.value,
                        suffixIcon: IconButton(
                          icon: Icon(
                            changePasswordController.isNewPasswordVisible.value
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: Color(0xFF6C757D),
                          ),
                          onPressed:
                          changePasswordController
                              .toggleNewPasswordVisibility,
                        ),
                        validator: AppValidator.validatePassword,
                      ),
                      ),
                      SizedBox(height: 5.sp),
                      // Confirm Password
                      Obx(() => CustomTextField(
                        controller:
                        changePasswordController.confirmPasswordController,
                        hintText: 'Confirm Password',
                        radius: 10.w,
                        obscureText:
                        !changePasswordController
                            .isConfirmPasswordVisible
                            .value,
                        suffixIcon: IconButton(
                          icon: Icon(
                            changePasswordController
                                .isConfirmPasswordVisible
                                .value
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: const Color(0xFF6C757D),
                          ),
                          onPressed:
                          changePasswordController
                              .toggleConfirmPasswordVisibility,
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please re-type password';
                          }
                          if (value !=
                              changePasswordController.newPasswordController.text.trim()) {
                            return 'Passwords do not match.';
                          }
                          return null;
                        },
                      ),
                      ),
                      SizedBox(height: 36.h),
                    ],
                  ),
                ),
                Spacer(),
                CustomButton(
                  text: 'Change Password',
                  isUpperCase: false,
                  onTap: () {

                    if (_formKey.currentState!.validate()) {
                      changePasswordController.changePassword();
                    }
                  },
                ),
                SizedBox(height: 36.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}