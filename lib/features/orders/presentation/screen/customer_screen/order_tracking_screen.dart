import 'package:annill/core/common/widgets/custom_text.dart';
import 'package:annill/core/utils/constants/app_colors.dart';
import 'package:annill/core/utils/constants/app_sizer.dart';
import 'package:annill/features/orders/controllers/order_tracking_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timelines_plus/timelines_plus.dart';

class OrderTrackingScreen extends GetView<OrderTrackingController> {
  const OrderTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Order tracking",
          color: AppColors.textBlack,
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Obx(() {
        final timelineData = controller.timelineData;

        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: CustomText(
                  text: "Status : Order Confirmed",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textPrimary,
                ),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 40.h),
                child: FixedTimeline.tileBuilder(
                  theme: TimelineThemeData(
                    nodePosition: 0.09,
                    indicatorTheme: IndicatorThemeData(
                      size: 30,
                      position: 0.0,
                      color: AppColors.primary,
                    ),
                    connectorTheme: ConnectorThemeData(
                      color: AppColors.textSecondary,
                      thickness: 1.5,
                    ),
                  ),
                  builder: TimelineTileBuilder.connectedFromStyle(
                    itemCount: timelineData.length,
                    contentsAlign: ContentsAlign.basic,
                    connectorStyleBuilder: (context, index) => ConnectorStyle.dashedLine,
                    indicatorStyleBuilder: (context, index) => IndicatorStyle.dot,
                    itemExtentBuilder: (context, index) => 110.h,
                    contentsBuilder: (context, index) {
                      final item = timelineData[index];
                      return Padding(
                        padding:  EdgeInsets.only(left: 8.0, bottom: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                                text: item["title"]!,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textPrimary,
                            ),

                            SizedBox(height: 4),
                            CustomText(
                              text: item["date"]!,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textSecondary,
                            ),
                            if (item['extra'] != null) ...[
                              const SizedBox(height: 4),
                              CustomText(
                                text: item["extra"]!,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textSecondary,
                              ),
                            ]
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
