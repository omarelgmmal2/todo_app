import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/core/design/title_text.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/core/utils/spacing.dart';
import 'package:todo_app/view/home/widget/custom_date_picker.dart';
import '../../../core/design/app_button.dart';
import '../../../core/utils/app_color.dart';
import '../../../core/utils/text_style_theme.dart';
import '../../../features/add_task/add_task_bloc.dart';
import 'no_tasks_widget.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  Color getColor(index) {
    switch (index) {
      case 0:
        return AppColor.red;
      case 1:
        return AppColor.green;
      case 2:
        return AppColor.blueGrey;
      case 3:
        return AppColor.blue;
      case 4:
        return AppColor.orange;
      case 5:
        return AppColor.purple;
      default:
        return AppColor.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.sizeOf(context).height;
    var w = MediaQuery.sizeOf(context).width;
    TaskBloc bloc = BlocProvider.of(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: BlocBuilder(
          bloc: bloc,
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleTextWidget(
                  label: DateFormat.yMMMMd().format(DateTime.now()),
                  textStyle: TextStyleTheme.textStyle22Bold,
                ),
                verticalSpace(12.h),
                TitleTextWidget(
                  label: AppStrings.today,
                  textStyle: TextStyleTheme.textStyle22Bold.copyWith(
                    fontSize: 20.sp,
                  ),
                ),
                verticalSpace(12.h),
                const CustomDatePicker(),
                verticalSpace(40.h),
                bloc.tasksList.isEmpty
                    ? const NoTasksWidget()
                    : Expanded(
                        child: ListView.builder(
                          itemCount: bloc.tasksList.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) => Container(
                                    padding: const EdgeInsets.all(24),
                                    height: h * .30.h,
                                    width: double.infinity,
                                    decoration: const BoxDecoration(
                                      color: AppColor.deepGrey,
                                    ),
                                    child: Column(
                                      children: [
                                        bloc.tasksList[index].isCompleted == 1
                                            ? SizedBox.shrink()
                                            : AppButton(
                                                buttonStyle:
                                                    ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      AppColor.primary,
                                                  fixedSize: Size(320.w, 49.h),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(8)
                                                            .r,
                                                  ),
                                                ),
                                                text: AppStrings.taskCompleted
                                                    .toUpperCase(),
                                                textStyle: TextStyleTheme
                                                    .textStyle16Regular
                                                    .copyWith(
                                                  color: AppColor.white,
                                                ),
                                                onPress: () {
                                                  bloc.updateTask(bloc
                                                      .tasksList[index].id!);
                                                  Navigator.pop(context);
                                                },
                                              ),
                                        verticalSpace(24.h),
                                        AppButton(
                                          buttonStyle: ElevatedButton.styleFrom(
                                            backgroundColor: AppColor.red,
                                            fixedSize: Size(320.w, 49.h),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8).r,
                                            ),
                                          ),
                                          text: AppStrings.deleteTask
                                              .toUpperCase(),
                                          textStyle: TextStyleTheme
                                              .textStyle16Regular
                                              .copyWith(
                                            color: AppColor.white,
                                          ),
                                          onPress: () {
                                            bloc.deleteTask(
                                                bloc.tasksList[index].id!);
                                            Navigator.pop(context);
                                          },
                                        ),
                                        verticalSpace(24.h),
                                        AppButton(
                                          buttonStyle: ElevatedButton.styleFrom(
                                            backgroundColor: AppColor.primary,
                                            fixedSize: Size(320.w, 49.h),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8).r,
                                            ),
                                          ),
                                          text: AppStrings.cancel.toUpperCase(),
                                          textStyle: TextStyleTheme
                                              .textStyle16Regular
                                              .copyWith(
                                            color: AppColor.white,
                                          ),
                                          onPress: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.only(bottom: 20.h),
                                height: h * .16.h,
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: getColor(bloc.tasksList[index].color),
                                  borderRadius: BorderRadius.circular(16).r,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TitleTextWidget(
                                            label: bloc.tasksList[index].title,
                                            textStyle:
                                                TextStyleTheme.textStyle24Bold,
                                          ),
                                          verticalSpace(7.h),
                                          Row(
                                            children: [
                                              const Icon(CupertinoIcons.time,
                                                  color: AppColor.white),
                                              horizontalSpace(8.w),
                                              TitleTextWidget(
                                                label:
                                                    "${bloc.tasksList[index].startTime} - ${bloc.tasksList[index].endTime}",
                                                textStyle: TextStyleTheme
                                                    .textStyle16Regular
                                                    .copyWith(
                                                  color: AppColor.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                          verticalSpace(7.h),
                                          TitleTextWidget(
                                            label: bloc.tasksList[index].note,
                                            textStyle: TextStyleTheme
                                                .textStyle24Regular,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: h * .08.h,
                                      width: w * .003.w,
                                      color: AppColor.white,
                                    ),
                                    horizontalSpace(8.w),
                                    RotatedBox(
                                      quarterTurns: 3,
                                      child: TitleTextWidget(
                                        label:
                                            bloc.tasksList[index].isCompleted ==
                                                    1
                                                ? AppStrings.completed
                                                : AppStrings.todo,
                                        textStyle:
                                            TextStyleTheme.textStyle20Regular,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
              ],
            );
          },
        ),
      ),
    );
  }
}
