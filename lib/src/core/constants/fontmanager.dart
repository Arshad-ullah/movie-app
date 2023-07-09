import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/src/core/constants/colors.dart';

Text manropeText({
  required String text,
  Color? color,
  TextAlign? textAlign,
  double? fontSize,
  FontWeight? fontWeight,
  double? letterSpacing,
  Paint? forgroundPaint,
  TextDecoration? decoration,
}) {
  return Text(
    text,
    textAlign: textAlign ?? TextAlign.start,
    style: GoogleFonts.poppins(
      decoration: decoration ?? TextDecoration.none,
      color: color ?? kBlack,
      fontSize: fontSize ?? 14.sp,
      fontWeight: fontWeight ?? FontWeight.w400,
      letterSpacing: letterSpacing ?? 2,
    ),
  );
}

TextStyle manropeTextStyle({
  Color? color,
  double? fontSize,
  FontWeight? fontWeight,
  TextAlign? textAlign,
  double? letterSpacing,
  TextStyle? textStyle,
}) {
  return TextStyle(
    color: color ?? kWhite,
    fontSize: fontSize ?? 14.sp,
    fontWeight: fontWeight,
    letterSpacing: letterSpacing ?? 0.5,
  );
}

TextStyle kTextstyle({
  Color? color,
  double? fontSize,
  String? fontFamily,
  FontWeight? fontWeight,
  TextAlign? textAlign,
  double? letterSpacing,
  TextStyle? textStyle,
}) {
  return TextStyle(
    color: color ?? kBlack,
    fontSize: fontSize ?? 14.sp,
    fontWeight: fontWeight,
    letterSpacing: letterSpacing ?? 0.5,
  );
}
