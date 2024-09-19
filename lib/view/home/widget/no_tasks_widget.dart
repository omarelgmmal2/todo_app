import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/design/app_image.dart';
import '../../../core/design/title_text.dart';
import '../../../core/utils/app_color.dart';
import '../../../core/utils/app_strings.dart';
import '../../../core/utils/assets.dart';
import '../../../core/utils/spacing.dart';
import '../../../core/utils/text_style_theme.dart';

class NoTasksWidget extends StatelessWidget {
  const NoTasksWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppImage(
          AssetsData.noTasks,
          height: 227.h,
          width: 227.h,
        ),
        verticalSpace(10.h),
        TitleTextWidget(
          textAlign: TextAlign.center,
          label: AppStrings.noTaskTitle,
          textStyle: TextStyleTheme.textStyle20Regular,
        ),
        verticalSpace(10.h),
        TitleTextWidget(
          textAlign: TextAlign.center,
          label: AppStrings.noTaskSubTitle,
          textStyle: TextStyleTheme.textStyle16Regular.copyWith(
            color: AppColor.white,
          ),
        ),
      ],
    );
  }
}
