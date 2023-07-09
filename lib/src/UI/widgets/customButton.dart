import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/src/core/constants/colors.dart';
import 'package:movie_app/src/core/extensions/media_quary.dart';

class CustomContainer extends StatelessWidget {
  CustomContainer({
    super.key,
    this.onTap,
    this.text,
    this.color,
    this.textColor,
    this.fontSize,
    this.height,
    this.width,
    this.containerColor,
    this.borderColor,
    this.borderwidth,
    this.widget,
    this.radius,
    this.evlevation,
  });

  Function()? onTap;
  String? text;
  Color? color;
  Color? textColor;
  double? fontSize;
  double? height;
  double? width;
  Color? containerColor;
  Color? borderColor;
  double? borderwidth;
  double? radius;
  Widget? widget;
  double? evlevation;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Material(
        elevation: evlevation ?? 0.0,
        borderRadius: BorderRadius.circular(radius ?? 15.0),
        shadowColor: kBlack,
        child: Container(
          width: width ?? context.width,
          height: height ?? 54.h,
          decoration: BoxDecoration(
            color: containerColor ?? Colors.transparent,
            border: Border.all(
                color: borderColor ?? kWhite, width: borderwidth ?? 0),
            borderRadius: BorderRadius.circular(radius ?? 15.r),
          ),
          child: Center(child: widget),
          // child: Center(
          //   child: manropeText(
          //     letterSpacing: 0,
          //     text: text ?? "",
          //     color: textColor ?? kwhiteColor,
          //     fontSize: fontSize ?? 16.sp,
          //     fontWeight: FontWeight.w700,
          //  ),
          //),
        ),
      ),
    );
  }
}
