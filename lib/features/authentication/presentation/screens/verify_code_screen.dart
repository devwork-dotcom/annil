
import 'package:annill/core/utils/constants/app_sizer.dart';
import 'package:annill/features/authentication/presentation/widgets/back_to_login.dart';
import 'package:annill/features/authentication/presentation/widgets/title_widget.dart';
import 'package:annill/routes/app_routes.dart';
import 'package:flutter/material.dart';


import 'package:pinput/pinput.dart';
import 'package:get/get.dart';
import '../../../../core/common/widgets/custom_button.dart';
import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/logo_path.dart';
import '../../controllers/verify_controller.dart';

class VerifyCodeScreen extends StatelessWidget {
   VerifyCodeScreen({super.key});

   final OtpController controller = Get.put(OtpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 26),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 30.h),
            Center(child: Image.asset(LogoPath.emailPath, width: 166.w, height: 130.h)),
            SizedBox(height: 32.h),
            TitleWidget(
                title: "Submit Verification Code",
                titleFontSize: 24.sp,
                subtitle: "We already sent a verification code to your email",
                subtitleFontSize: 16.sp,
            ),

            SizedBox(height: 30.h),
            Align(
              alignment: Alignment.center,
              child: Pinput(
                length: 6,
                controller: controller.otpTEController,
                focusNode: controller.focusNode,
                onChanged: (value) {
                  controller.updateOtpValue(value);
                },
                onCompleted: (value) {
                  controller.verifyOtp();
                },
                defaultPinTheme: PinTheme(
                  width: 48.w,
                  height: 48.h,
                  textStyle: TextStyle(
                    fontSize: 24,
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.textWhite,
                    border: Border.all(color: AppColors.borderColors, width: 1.w),
                    borderRadius: BorderRadius.circular(10.w),
                  ),
                ),
                submittedPinTheme: PinTheme(
                  width: 48.w,
                  height: 48.h,
                  textStyle: TextStyle(
                    fontSize: 16.sp,
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.textWhite,
                    border: Border.all(color: AppColors.borderColors, width: 1.w),
                    borderRadius: BorderRadius.circular(10.w),
                  ),
                ),
                separatorBuilder: (index) => SizedBox(width: 8),
              ),
            ),
            SizedBox(height: 36.h),

            Obx(
                  () {
                return Align(
                  alignment: Alignment.center,
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      CustomText(
                        text: controller.isClickable.value
                            ? 'Didn\'t receive the email? '
                            : 'Didn\'t receive the email? ${controller.formatTime(controller.secondsRemaining.value)}',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textSecondary,
                      ),
                      GestureDetector(
                        onTap: controller.isClickable.value
                            ? () {
                          controller.resendOtp();
                        }
                            : null,
                        child: Text(
                          'Click to Resend!',
                          style: TextStyle(
                            decorationThickness: 1,
                            decorationColor: controller.isClickable.value
                                ? AppColors.textPrimary
                                : AppColors.textPrimary,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: controller.isClickable.value
                                ? AppColors.textPrimary
                                : Colors.transparent,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: 36.h),

            CustomButton(
              text: 'Verify Email',
              isUpperCase: false,

              onTap: controller.isButtonEnabled.value
                  ? () {
                Get.toNamed(AppRoute.resetPasswordScreen);
                //controller.verifyOtp();
              } : () {},
            ),

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
