import 'package:annill/core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final Widget child;
  final Color? color;
  final List<BoxShadow>? shadow;
  final BorderRadius? borderRadius;
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final EdgeInsets? margin;

  const CustomContainer({
    Key? key,
    required this.child,
    this.color,
    this.shadow,
    this.borderRadius,
    this.width,
    this.height,
    this.padding,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: color ?? AppColors.white,
        borderRadius: borderRadius ?? BorderRadius.circular(10),
        boxShadow: shadow ?? [
          BoxShadow(
            color: AppColors.cardShadowColor.withOpacity(0.25),
            blurRadius: 5,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: child,
    );
  }
}