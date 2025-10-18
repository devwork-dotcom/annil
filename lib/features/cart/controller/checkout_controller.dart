
import 'package:annill/core/utils/constants/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CheckoutController extends GetxController{
  var subTotal = 0.0.obs;
  var deliveryFee = 2.0.obs;
  var totalAmount = 0.0.obs;

  var nameController = TextEditingController().obs;
  var emailController = TextEditingController().obs;
  var phoneController = TextEditingController().obs;
  var addressController = TextEditingController().obs;
  var cityController = TextEditingController().obs;
  var countryController = TextEditingController().obs;

  var preferredDate = "mm/dd/yyyy".obs;

  var specialInstructionController = TextEditingController().obs;

  @override
  void onInit() {
    super.onInit();
    calculateTotal();
  }

  void calculateTotal() {
    totalAmount.value = subTotal.value + deliveryFee.value;
  }

  void updateSubTotal(double newSubTotal) {
    subTotal.value = newSubTotal;
    calculateTotal();
  }


  Future<void> selectDate(BuildContext context) async {

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: AppColors.primary, // আপনার app color
            colorScheme: ColorScheme.light(primary: AppColors.primary),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      String formattedDate = DateFormat('MM/dd/yyyy').format(picked);
      preferredDate.value = formattedDate;
    }
  }


}