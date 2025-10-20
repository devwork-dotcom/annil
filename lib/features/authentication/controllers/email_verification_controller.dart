import 'package:annill/features/authentication/presentation/screens/verify_code_screen.dart';
import 'package:annill/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'otp_verify_controller.dart';

class EmailVerificationController extends GetxController{

  final emailText = TextEditingController();



  Future<void> forgetPassword() async {
    Get.delete<OtpController>();
    Get.to(() => VerifyCodeScreen(),
      arguments: {
        'formScreen': AppRoute.emailVerifyScreen,
        "email" : emailText.text.trim(),
      },
    );
  }

}