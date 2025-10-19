import 'package:annill/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailVerificationController extends GetxController{

  final emailText = TextEditingController();

  void navigateToOTPVerifyScreen (){

    Get.toNamed(AppRoute.verifyCodeScreen);
  }

}