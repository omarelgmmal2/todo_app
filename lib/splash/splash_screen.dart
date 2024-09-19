import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/design/app_image.dart';
import 'package:todo_app/core/design/title_text.dart';
import 'package:todo_app/core/logic/cache_helper.dart';
import 'package:todo_app/core/srevices/srevice_locator.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/core/utils/spacing.dart';
import '../core/utils/app_routes.dart';
import '../core/utils/assets.dart';
import '../core/utils/text_style_theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    bool isVisited = getIt<CacheHelper>().getData(key: AppStrings.onBoardingKey) ?? false;
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacementNamed(
          context,
          isVisited ? Routes.homeRoute : Routes.onBoardingRoute,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppImage(
              AssetsData.logo,
              height: 113.h,
              width: 113.h,
            ),
            verticalSpace(20.h),
            TitleTextWidget(
              label: AppStrings.appName,
              textStyle: TextStyleTheme.textStyle40Bold,
            ),
          ],
        ),
      ),
    );
  }
}
