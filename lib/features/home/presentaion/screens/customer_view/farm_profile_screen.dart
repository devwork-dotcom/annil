import 'package:annill/core/common/widgets/custom_text.dart';
import 'package:annill/core/utils/constants/app_colors.dart';
import 'package:annill/core/utils/constants/app_sizer.dart';
import 'package:annill/core/utils/constants/image_path.dart';
import 'package:annill/features/home/presentaion/widgets/farm_profile_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FarmProfileScreen extends StatelessWidget {
  const FarmProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: Column(
          children: [
            CustomText(
              text: "Farm Profile",
              color: AppColors.textBlack,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.textBlack),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding:  EdgeInsets.all(10.w),
              child: Center(
                child: Container(
                  width: 90.w,
                  height: 90.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 4.w,
                      color: AppColors.primary,
                    ),
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      ImagePath.profilePng,
                      fit: BoxFit.cover,
                      width: 30.w,
                      height: 30.w,
                    ),
                  ),
                ),
              ),
            ),

            Center(
              child: CustomText(
                text: "Green Valley Farm",
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.textBlack,
              ),
            ),

            SizedBox(height: 10.h,),
            CustomIconText(icon: Icons.person, text: "John Deo"),
            CustomIconText(icon: Icons.phone, text: "01552322"),
            CustomIconText(icon: Icons.email_outlined, text: "example@mail.com"),
            CustomIconText(icon: Icons.location_on_outlined, text: "123 Rixton Lane, London, UK"),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 15.w,vertical: 15.h),
              child: CustomText(
                text: "Listed Products",
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.textBlack,
              ),
            ),

            ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 6.w),
              itemCount: 15,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(right: 12.w),
                    decoration: BoxDecoration(
                      color: AppColors.verticalCardColors,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 6,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Image.asset(ImagePath.banner_fruit,
                              height: 65.h,
                              width: 85.w,
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: "Organic Potato",
                                  color: AppColors.textBlack,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  textAlign: TextAlign.center,
                                ),
                                CustomText(
                                  text: "\$4.5/kg ",
                                  color: AppColors.primary,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Image.asset(ImagePath.banner_cart,
                              height: 30.w,
                              width: 30.w,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),


          ],
        ),
      ),
    );
  }
}