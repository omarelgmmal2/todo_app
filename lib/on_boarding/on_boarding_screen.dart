import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:todo_app/core/design/app_button.dart';
import 'package:todo_app/core/design/app_image.dart';
import 'package:todo_app/core/design/custom_text_button.dart';
import 'package:todo_app/core/design/title_text.dart';
import 'package:todo_app/core/logic/cache_helper.dart';
import 'package:todo_app/core/srevices/srevice_locator.dart';
import 'package:todo_app/core/utils/app_color.dart';
import 'package:todo_app/core/utils/app_routes.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/core/utils/spacing.dart';
import '../core/utils/text_style_theme.dart';
import 'model.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: PageView.builder(
        itemBuilder: (context, index) => _ItemOnBoarding(
          model: onBoardingList[index],
        ),
        itemCount: onBoardingList.length,
        controller: pageController,
        onPageChanged: (value) {
          if (value == onBoardingList.length - 1) {
            isLast = true;
            setState(() {});
          } else {
            isLast = false;
            setState(() {});
          }
        },
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      actions: [
        CustomTextButton(
          text: AppStrings.skip,
          onPressed: () {
            Navigator.pushReplacementNamed(
              context,
              Routes.homeRoute,
            );
          },
        ),
      ],
    );
  }
}

final pageController = PageController();
bool isLast = false;

class _ItemOnBoarding extends StatelessWidget {
  final OnBoardingModel model;

  const _ItemOnBoarding({
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppImage(
            model.img,
            height: 296.h,
            width: 271.w,
          ),
          verticalSpace(50.h),
          SmoothPageIndicator(
            controller: pageController,
            count: onBoardingList.length,
            effect: ExpandingDotsEffect(
              dotColor: Colors.grey,
              dotHeight: 4.h,
              dotWidth: 8.w,
              expansionFactor: 4,
              spacing: 5.0,
              activeDotColor: AppColor.white,
            ),
          ),
          verticalSpace(50.h),
          TitleTextWidget(
            label: model.title,
            textStyle: TextStyleTheme.textStyle32Bold,
          ),
          verticalSpace(40.h),
          TitleTextWidget(
            textAlign: TextAlign.center,
            maxLines: 2,
            label: model.subTitle,
            textStyle: TextStyleTheme.textStyle16Regular.copyWith(
              color: AppColor.white.withOpacity(.90),
            ),
          ),
          verticalSpace(95.h),
          Row(
            children: [
              isLast
                  ? const SizedBox.shrink()
                  : CustomTextButton(
                      text: AppStrings.back,
                      onPressed: () {
                        pageController.previousPage(
                          duration: const Duration(
                            milliseconds: 750,
                          ),
                          curve: Curves.fastLinearToSlowEaseIn,
                        );
                      },
                    ),
              const Spacer(),
              AppButton(
                text: isLast ? AppStrings.getStarted : AppStrings.next,
                textStyle: TextStyleTheme.textStyle16Regular.copyWith(
                  color: AppColor.white,
                ),
                onPress: () async {
                  await getIt<CacheHelper>().saveData(
                    key: AppStrings.onBoardingKey,
                    value: true,
                  ).then((value) {
                    if (isLast) {
                      Navigator.pushReplacementNamed(
                        context,
                        Routes.homeRoute,
                      );
                    } else {
                      pageController.nextPage(
                        duration: const Duration(
                          milliseconds: 750,
                        ),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    }
                  }).catchError((e) {
                    debugPrint(e.toString());
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
