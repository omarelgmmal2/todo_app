import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/features/add_task/add_task_bloc.dart';
import '../../../core/utils/app_color.dart';
import '../../../core/utils/text_style_theme.dart';

class CustomDatePicker extends StatelessWidget {
  const CustomDatePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return DatePicker(
      DateTime.now(),
      initialSelectedDate: DateTime.now(),
      selectionColor: AppColor.primary,
      selectedTextColor: AppColor.white,
      height: 121.h,
      width: 61.w,
      dateTextStyle: TextStyleTheme.textStyle16Regular.copyWith(
        color: AppColor.white,
      ),
      monthTextStyle: TextStyleTheme.textStyle16Regular.copyWith(
        color: AppColor.white,
      ),
      dayTextStyle: TextStyleTheme.textStyle16Regular.copyWith(
        color: AppColor.white,
      ),
      onDateChange: (date) {
        BlocProvider.of<TaskBloc>(context).getSelectedDate(date);
      },
    );
  }
}
