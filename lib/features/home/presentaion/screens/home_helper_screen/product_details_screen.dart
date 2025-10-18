
import 'package:annill/core/common/widgets/custom_button.dart';
import 'package:annill/core/common/widgets/custom_text.dart';
import 'package:annill/core/utils/constants/app_colors.dart';
import 'package:annill/core/utils/constants/app_sizer.dart';
import 'package:annill/core/utils/constants/image_path.dart';
import 'package:annill/features/home/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends GetView<ProductController> {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: Column(
          children: [
            CustomText(
              text: "Products Details",
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
          children: [

            Center(
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal:  15.w,vertical: 10.h),
                child: Container(
                  width: double.infinity,
                  height: 200.h,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.w),
                    child: Image.asset(
                      ImagePath.vegetable_tomato,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 200.h,
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding:  EdgeInsets.symmetric(horizontal:  15.w,vertical: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                      text: "Organic Tomatoes",
                    color: AppColors.textBlack,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                  ),
                  Wrap(
                    children: [
                      CustomText(
                        text: "Status: ",
                        color: AppColors.textBlack,
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                      ),
                      CustomText(
                        text: "In Stock",
                        color: AppColors.primary,
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Padding(
              padding:  EdgeInsets.symmetric(horizontal:  20.w,vertical: 5.h),
              child: Row(
                children: [
                  Icon(Icons.location_on_outlined,size: 15.w,),
                  SizedBox(width: 3.w,),
                  CustomText(
                    text: "123 Rixton Lane, London, UK",
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                  ),
                ],
              ),
            ),

            Padding(
              padding:  EdgeInsets.symmetric(horizontal:  20.w,vertical: 5.h),
              child: Row(
                children: [
                  Icon(Icons.star,size: 15.w,color: AppColors.ratingStarColor,),
                  SizedBox(width: 3.w,),
                  CustomText(
                    text: "5.0 ",
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                  ),
                  CustomText(
                    text: "(520 Review)",
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                  ),
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal:  20.w,vertical: 15.h),
              child: Row(
                children: [

                  CustomText(
                    text: "Price: ",
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                  ),
                  CustomText(
                    text: "4.5/kg",
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 24.sp,
                  ),
                ],
              ),
            ),

            //Increase decrease Button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Decrease Button (-)
                  GestureDetector(
                    onTap: () {
                      controller.decreaseQuantity();
                    },
                    child: Container(
                      width: 30.w,
                      height: 30.w,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(50.w),
                      ),
                      child: Icon(
                        Icons.remove,
                        color: Colors.white,
                        size: 20.w,
                      ),
                    ),
                  ),

                  SizedBox(width: 16.w),

                  // Quantity Number
                  Obx(() => CustomText(
                    text: controller.productQuantity.value.toString(),
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp,
                  )),

                  SizedBox(width: 16.w),

                  // Increase Button (+)
                  GestureDetector(
                    onTap: () {
                      controller.increaseQuantity();
                    },
                    child: Container(
                      width: 30.w,
                      height: 30.w,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(50.w),
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20.w,
                      ),
                    ),
                  ),
                ],
              ),
            ),



            //Description column
            Obx(()=> Visibility(
              visible: controller.isDescription.value,
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 15.w,vertical: 20.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Description and review
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(50.w),
                      ),
                      child: Row(
                        children: [

                          Expanded(
                            flex: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.circular(50.w),
                              ),
                              child: Padding(
                                padding:  EdgeInsets.all(8.w),
                                child: Center(
                                  child: CustomText(
                                    text: "Description",
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.whiteHeading,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Expanded(
                            flex: 1,
                            child: GestureDetector(
                              onTap: (){
                                controller.showReview();

                              },
                              child: Padding(
                                padding:  EdgeInsets.all(8.w),
                                child: Center(
                                  child: CustomText(
                                    text: "Review",
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.textBlack,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 15.h,),
                    CustomText(
                      text: "Sort bio:",
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textBlack,
                    ),
                    SizedBox(height: 5.h,),
                    CustomText(
                      text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has",
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textSecondary,
                      textAlign: TextAlign.justify,
                    ),

                    SizedBox(height: 15.h,),
                    CustomText(
                      text: "Farm Information :",
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textBlack,
                    ),
                    SizedBox(height: 10.h,),
                    GestureDetector(
                      onTap: (){
                        controller.navigateToFarmProfile();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.w),
                            border: Border.all(width: 1.w,color: AppColors.borderColors)
                        ),
                        child: Padding(
                          padding:  EdgeInsets.all(15.w),
                          child: Row(
                            children: [

                              ClipOval(
                                child: Image.asset(
                                  ImagePath.vegetable_tomato,
                                  fit: BoxFit.cover,
                                  width: 40,
                                  height: 40,
                                ),
                              ),

                              SizedBox(width: 12.w),

                              // Name
                              Expanded(
                                child: CustomText(
                                  text: "Green Valley Farm",
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.textBlack,
                                ),
                              ),


                              Icon(
                                Icons.arrow_forward_ios,
                                size: 20.w,
                                color: Colors.grey.shade500,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 30.h,),

                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 20.w),
                      child: CustomButton(
                        text: "Add to cart",
                        onTap: (){},
                        isUpperCase: false,
                        customTextStyle: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.white
                        ),

                      ),
                    ),
                    SizedBox(height: 30.h,),


                  ],
                ),
              ),
            ),),


            //Review column
            Obx(()=>Visibility(
              visible: !controller.isDescription.value,
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 15.w,vertical: 20.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Description and review
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(50.w),
                      ),
                      child: Row(
                        children: [

                          Expanded(
                            flex: 1,
                            child: GestureDetector(
                              onTap: (){
                                controller.showDescription();
                              },
                              child: Padding(
                                padding:  EdgeInsets.all(8.w),
                                child: Center(
                                  child: CustomText(
                                    text: "Description",
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.textBlack,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Expanded(
                            flex: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.circular(50.w),
                              ),
                              child: Padding(
                                padding:  EdgeInsets.all(8.w),
                                child: Center(
                                  child: CustomText(
                                    text: "Review",
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.whiteHeading,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 15.h,),
                    Row(
                      children: [
                        CustomText(
                          text: "Review ",
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textBlack,
                        ),
                        CustomText(
                          text: "(520) ",
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textSecondary,
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h,),
                    ListView.builder(
                      itemCount: 15,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: (){
                            controller.navigateToProductDetails();
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 5, ),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(width: 1.w,color: AppColors.borderColors)
                              ),
                              child: Padding(
                                padding: EdgeInsets.all( 10.w),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [

                                    Row(
                                      children: [

                                        CircleAvatar(
                                          radius: 16.w,
                                          backgroundColor: AppColors.blueColor,
                                          child: CircleAvatar(
                                            radius: 15.w,
                                            backgroundImage: AssetImage(ImagePath.profilePng),
                                          ),
                                        ),

                                        SizedBox(width: 12.w),

                                        // Name
                                        Expanded(
                                          child: CustomText(
                                            text: "Devon Lane",
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.textBlack,
                                          ),
                                        ),


                                        Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              size: 24.w,
                                              color: AppColors.ratingStarColor,
                                            ),
                                            CustomText(
                                              text: " 4.8",
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.textBlack,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),

                                    SizedBox(height: 20.h,),
                                    CustomText(
                                      text: "“Perfect call! The analysis nailed it and the pick hit exactly as expected. Good break down and a win, but could use quicker and fst delivery before game time.”",
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.textBlack,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),


                  ],
                ),
              ),
            ),),


          ],
        ),
      ),
    );
  }
}