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

class UserInformationScreen extends GetView<ProfileController> {
  const UserInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: CustomText(
          text: "User Information",
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
              Center(
                child: Stack(
                  children: [
                    // Profile Image Container
                    Container(
                      width: 90.w,
                      height: 90.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.borderColors,
                          width: 4.w,
                        ),
                      ),
                      child: Obx(() => ClipOval(
                        child: controller.profileImage.value != null
                            ? Image.file(
                          controller.profileImage.value!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        )
                            : Image.asset(
                          ImagePath.profilePng,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      )),
                    ),

                    // Camera Icon
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () => controller.showImagePickerDialog(), // সরাসরি controller call
                        child: Container(
                          width: 28.w,
                          height: 28.w,
                          decoration: BoxDecoration(
                            color: AppColors.primary.withOpacity(0.7),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.white,
                              width: 2.w,
                            ),
                          ),
                          child: Icon(
                            Icons.camera_alt,
                            color: AppColors.white,
                            size: 16.w,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Gap(20.h),
              Padding(
                padding:  EdgeInsets.symmetric(vertical: 10.h),
                child: CustomTextField(
                  hintText: "Your Name",
                  radius: 10.w,
                  controller: controller.nameController,
                ),
              ),

              Padding(
                padding:  EdgeInsets.symmetric(vertical: 10.h),
                child: CustomTextField(
                  hintText: "Type your email",
                  radius: 10.w,
                  controller: controller.emailController,
                ),
              ),

              Padding(
                padding:  EdgeInsets.symmetric(vertical: 10.h),
                child: CustomTextField(
                  hintText: "Phone Number",
                  radius: 10.w,
                  controller: controller.phoneNumberController,
                ),
              ),
              Gap(5.h),
              CustomDropdownField(
                  hintText: "Set availability",
                  items: controller.availabilityItems,
                  selectedValue: controller.selectedAvailability.value,
                  onChanged: (value)=>controller.selectedAvailability.value = value),
              Gap(5.h),
              Padding(
                padding:  EdgeInsets.symmetric(vertical: 10.h),
                child: CustomTextField(
                  hintText: "Type your location",
                  radius: 10.w,
                  controller: controller.locationController,
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
