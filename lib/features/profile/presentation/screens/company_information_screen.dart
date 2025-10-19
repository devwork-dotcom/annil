import 'package:annill/core/common/widgets/custom_button.dart';
import 'package:annill/core/common/widgets/custom_dropdown.dart';
import 'package:annill/core/common/widgets/custom_text.dart';
import 'package:annill/core/common/widgets/custom_text_field.dart';
import 'package:annill/core/utils/constants/app_colors.dart';
import 'package:annill/core/utils/constants/app_sizer.dart';
import 'package:annill/core/utils/constants/image_path.dart';
import 'package:annill/features/profile/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class CompanyInformationScreen extends GetView<ProfileController> {
  const CompanyInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: AppColors.backgroundLight,
        appBar: AppBar(
          title: CustomText(
            text: "Company Information",
            color: AppColors.textBlack,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
          backgroundColor: AppColors.white,
          elevation: 0,
          centerTitle: true,
        ),
        body: Obx((){
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Gap(20.h),
                Padding(
                  padding:  EdgeInsets.symmetric(vertical: 10.h),
                  child: CustomTextField(
                    hintText: "Company Name",
                    radius: 10.w,
                    controller: controller.companyNameController,
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(vertical: 10.h),
                  child: CustomTextField(
                    hintText: "Type your location",
                    radius: 10.w,
                    controller: controller.companyLocationController,
                    suffixIcon: Icon(Icons.location_on_outlined),

                  ),
                ),

                Spacer(),

                CustomButton(
                  text: "Update",
                  onTap: (){

                  },
                  isUpperCase: false,
                ),
                Gap(30.h),

              ],
            ),
          );
        })
    );
  }
}
