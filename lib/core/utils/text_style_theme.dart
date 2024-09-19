import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_color.dart';

class TextStyleTheme {
  static TextStyle textStyle16Regular = GoogleFonts.lato(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColor.grey,
  );

  static TextStyle textStyle30Regular = GoogleFonts.lato(
    fontSize: 30.sp,
    fontWeight: FontWeight.w400,
  );

  static TextStyle textStyle20Regular = GoogleFonts.lato(
    fontSize: 20.sp,
    fontWeight: FontWeight.w400,
    color: AppColor.white,
  );

  static TextStyle textStyle14Regular = GoogleFonts.lato(
    fontSize: 14.sp,
    color: AppColor.white,
  );

  static TextStyle textStyle13Regular = GoogleFonts.lato(
    color: AppColor.red,
    fontSize: 13.sp,
  );

  static TextStyle textStyle24Regular = GoogleFonts.lato(
    fontSize: 24.sp,
    fontWeight: FontWeight.w400,
    color: AppColor.white,
  );

  static TextStyle textStyle32Bold = GoogleFonts.lato(
    fontSize: 32.sp,
    fontWeight: FontWeight.bold,
    color: AppColor.white,
  );

  static TextStyle textStyle22Bold = GoogleFonts.lato(
    fontSize: 22.sp,
    fontWeight: FontWeight.bold,
    color: AppColor.white,
  );

  static TextStyle textStyle24Bold = GoogleFonts.lato(
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
    color: AppColor.white,
  );

  static TextStyle textStyle40Bold = GoogleFonts.lato(
    fontSize: 40.sp,
    fontWeight: FontWeight.bold,
    color: AppColor.white,
  );
}