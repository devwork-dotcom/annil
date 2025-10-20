
import 'package:annill/core/common/widgets/custom_text.dart';
import 'package:annill/core/common/widgets/custom_text_field.dart';
import 'package:annill/core/utils/constants/app_colors.dart';
import 'package:annill/core/utils/constants/app_sizer.dart';
import 'package:annill/features/profile/presentation/widgets/key_point_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LegalPoliciesScreen extends StatelessWidget {
  const LegalPoliciesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: AppColors.backgroundLight,
        appBar: AppBar(
          title: CustomText(
            text: "Legal and Policies",
            color: AppColors.textBlack,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
          backgroundColor: AppColors.white,
          elevation: 0,
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              CustomText(
                text: 'Terms of Service',
                fontSize: 16.sp,
                color: AppColors.textBlack,
                fontWeight: FontWeight.w500,
              ),
              Gap(5.h),
              CustomText(
                text: "By using this platform, you agree to follow all applicable laws and abide by our community standards. Any misuse, fraudulent activity, or breach of our guidelines may result in account suspension or termination.",
                fontSize: 12.sp,
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.justify,
              ),
              Gap(5.h),
              CustomText(
                text: "Key Points :",
                fontSize: 12.sp,
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.justify,
              ),

              KeyPointWidget(keyPoint: "You must be 18 years or older to use this app."),
              KeyPointWidget(keyPoint: "Picks are for entertainment and informational purposes only"),
              KeyPointWidget(keyPoint: "We are not responsible for financial outcomes based on picks purchased or used."),
              KeyPointWidget(keyPoint: "Advisors are independent and responsible for the content they share."),

              Gap(10.h),
              CustomText(
                text: 'Privacy Policy',
                fontSize: 16.sp,
                color: AppColors.textBlack,
                fontWeight: FontWeight.w500,
              ),
              Gap(5.h),
              CustomText(
                text: "We respect your privacy and are committed to protecting your personal data.",
                fontSize: 12.sp,
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.justify,
              ),
              Gap(5.h),
              CustomText(
                text: "What We Collect :",
                fontSize: 12.sp,
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.justify,
              ),

              KeyPointWidget(keyPoint: "Name, email, and payment info"),
              KeyPointWidget(keyPoint: "Usage data (e.g., what picks you view or purchase)"),
              KeyPointWidget(keyPoint: "Communication preferences"),

              Gap(5.h),
              CustomText(
                text: "How We Use It :",
                fontSize: 12.sp,
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.justify,
              ),


              KeyPointWidget(keyPoint: "To provide and improve the app"),
              KeyPointWidget(keyPoint: "To process transactions securely"),
              KeyPointWidget(keyPoint: "To personalize your experience"),

              Gap(5.h),
              CustomText(
                text: "We never sell your information to third parties.",
                fontSize: 12.sp,
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
    );
  }
}
