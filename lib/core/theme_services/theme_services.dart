import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_color.dart';
import '../utils/text_style_theme.dart';

class Styles {
  static ThemeData themeData() {
    return ThemeData(
      scaffoldBackgroundColor: AppColor.backGroundColor,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColor.primary,
        shape: CircleBorder(),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4).r,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyleTheme.textStyle14Regular,
        fillColor: AppColor.lightBlack,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        errorStyle: TextStyleTheme.textStyle13Regular,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(
            color: AppColor.red,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
      appBarTheme: const AppBarTheme(
        elevation: 0.0,
        backgroundColor: AppColor.backGroundColor,
        centerTitle: true,
      ),
    );
  }
}
