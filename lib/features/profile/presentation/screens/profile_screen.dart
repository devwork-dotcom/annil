
import 'package:annill/core/utils/constants/app_sizer.dart';
import 'package:annill/core/utils/constants/image_path.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/common/widgets/custom_button.dart';
import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/common/widgets/universal_Image.dart';
import '../../../../core/services/Auth_service.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/app_texts.dart';

import '../../../../core/utils/constants/icon_path.dart';
import '../../../../routes/app_routes.dart';
import '../../controller/profile_controller.dart';

import '../widgets/profile_item_card.dart';
import '../widgets/show_logout_dialog.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: CustomText(
          text: "Profile",
          color: AppColors.textBlack,
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
        ),
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 36.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(20.h),
              Center(
                child: Container(
                  width: 90.w,
                  height: 90.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.borderColors,
                      width: 4.w,
                    ),
                  ),
                  child: ClipOval(
                    child: Image.asset(ImagePath.profilePng,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              Center(
                child: CustomText(
                  text: 'Alex Jone',
                  fontSize: 26.sp,
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Center(
                child: CustomText(
                  text: 'Alex@gmail.com',
                  fontSize: 14.sp,
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w400,
                ),
              ),

              Gap(40.h),

              CustomText(
                text: 'Personal Info',
                fontSize: 14.sp,
                color: AppColors.textBlack,
                fontWeight: FontWeight.w400,
              ),

              // Profile Items
              ProfileItemCard(
                text: "User Information",
                prefixIcon: Icons.person,
                onTap: (){

                  controller.navigateToUpdateUserInfo();
                },
              ),
              ProfileItemCard(
                text: "Company Information (Optional)",
                prefixIcon: Icons.home_work_outlined,
                onTap: (){

                  controller.navigateToCompanyInfo();
                },
              ),

              Gap(5.h),
              //Change Password
              CustomText(
                text: 'Security',
                fontSize: 14.sp,
                color: AppColors.textBlack,
                fontWeight: FontWeight.w400,
              ),
              ProfileItemCard(
                text: "Change Password",
                prefixIcon: Icons.lock,
                onTap: (){

                  controller.navigateToChangePasswordScreen();
                },
              ),

              Gap(5.h),
              //Legal Policy
              CustomText(
                text: 'About',
                fontSize: 14.sp,
                color: AppColors.textBlack,
                fontWeight: FontWeight.w400,
              ),
              ProfileItemCard(
                text: "Legal and Policies",
                prefixIcon: Icons.security,
                onTap: (){
                  controller.navigateToLegalAndPoliciesScreen();
                },
              ),


              Gap(15.h),
              // Sign out
              ProfileItemCard(
                text: "Log Out",
                prefixIcon: Icons.logout,
                iconColor: AppColors.error,
                textColor: AppColors.error,
                onTap: (){

                  controller.showLogoutDialog();
                },
              ),

              Gap(16.h),
              // Added extra gap at the bottom
            ],
          ),
        ),
      ),
    );
  }
}
