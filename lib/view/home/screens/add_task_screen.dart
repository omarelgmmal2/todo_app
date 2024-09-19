import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/core/design/app_button.dart';
import 'package:todo_app/core/design/app_input.dart';
import 'package:todo_app/core/design/title_text.dart';
import 'package:todo_app/core/utils/app_color.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/core/utils/spacing.dart';
import 'package:todo_app/core/utils/text_style_theme.dart';
import '../../../features/add_task/add_task_bloc.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.sizeOf(context).width;
    var h = MediaQuery.sizeOf(context).height;
    TaskBloc bloc = BlocProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_outlined,
            color: AppColor.white,
          ),
        ),
        title: TitleTextWidget(
          label: "Add Task",
          textStyle: TextStyleTheme.textStyle24Bold,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: BlocBuilder(
            bloc: bloc,
            builder: (context, state) {
              return Form(
                key: bloc.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleTextWidget(
                      label: AppStrings.title,
                      textStyle: TextStyleTheme.textStyle14Regular,
                    ),
                    AppInput(
                      hintText: AppStrings.enterTitleHere,
                      controller: bloc.titleController,
                      paddingBottom: 24.h,
                      paddingTop: 10.h,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return AppStrings.titleErrorMsg;
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      focusNode: bloc.titleFocusNode,
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(bloc.noteFocusNode);
                      },
                      type: TextInputType.text,
                      prefixIcon: const Icon(IconlyLight.message),
                    ),
                    TitleTextWidget(
                      label: AppStrings.note,
                      textStyle: TextStyleTheme.textStyle14Regular,
                    ),
                    AppInput(
                      hintText: AppStrings.enterNoteHere,
                      controller: bloc.noteController,
                      paddingBottom: 24.h,
                      paddingTop: 10.h,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return AppStrings.noteErrorMsg;
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.done,
                      focusNode: bloc.noteFocusNode,
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(bloc.dateFocusNode);
                      },
                      type: TextInputType.text,
                      prefixIcon: const Icon(Icons.edit_note_outlined),
                    ),
                    TitleTextWidget(
                      label: AppStrings.date,
                      textStyle: TextStyleTheme.textStyle14Regular,
                    ),
                    AppInput(
                      hintText: DateFormat.yMd().format(
                          BlocProvider.of<TaskBloc>(context).currentDate),
                      controller: bloc.dateController,
                      paddingBottom: 24.h,
                      paddingTop: 10.h,
                      focusNode: bloc.dateFocusNode,
                      type: TextInputType.datetime,
                      prefixIcon: const Icon(Icons.edit_calendar_outlined),
                      readOnly: true,
                      suffixIcon: IconButton(
                        onPressed: () {
                          bloc.getDate(context);
                        },
                        icon: const Icon(
                          IconlyLight.calendar,
                          color: AppColor.white,
                        ),
                      ),
                    ),
                    FittedBox(
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TitleTextWidget(
                                label: AppStrings.startTime,
                                textStyle: TextStyleTheme.textStyle14Regular,
                              ),
                              SizedBox(
                                width: w * .41.w,
                                child: AppInput(
                                  hintText: BlocProvider.of<TaskBloc>(context)
                                      .startTime,
                                  controller: bloc.startTimeController,
                                  paddingBottom: 24.h,
                                  paddingTop: 10.h,
                                  type: TextInputType.datetime,
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      bloc.getStartTime(context);
                                    },
                                    icon: const Icon(
                                      IconlyLight.timeCircle,
                                      color: AppColor.white,
                                    ),
                                  ),
                                  readOnly: true,
                                ),
                              ),
                            ],
                          ),
                          horizontalSpace(23.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TitleTextWidget(
                                label: AppStrings.endTime,
                                textStyle: TextStyleTheme.textStyle14Regular,
                              ),
                              SizedBox(
                                width: w * .41.w,
                                child: AppInput(
                                  hintText: BlocProvider.of<TaskBloc>(context)
                                      .endTime,
                                  controller: bloc.endTimeController,
                                  paddingBottom: 24.h,
                                  paddingTop: 10.h,
                                  type: TextInputType.datetime,
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      bloc.getEndTime(context);
                                    },
                                    icon: const Icon(
                                      IconlyLight.timeCircle,
                                      color: AppColor.white,
                                    ),
                                  ),
                                  readOnly: true,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: h * .1.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TitleTextWidget(
                            label: AppStrings.colors,
                            textStyle: TextStyleTheme.textStyle14Regular,
                          ),
                          verticalSpace(10.h),
                          Expanded(
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    bloc.changeCheckMarkIndex(index);
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: bloc.getColor(index),
                                    child: index == bloc.currentIndex
                                        ? const Icon(
                                            Icons.check,
                                            color: AppColor.white,
                                          )
                                        : null,
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  horizontalSpace(10.w),
                              itemCount: 6,
                            ),
                          ),
                        ],
                      ),
                    ),
                    verticalSpace(110.h),
                    state is LoadingCompletedTask
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : AppButton(
                            buttonStyle: ElevatedButton.styleFrom(
                              fixedSize: Size(335.w, 50.h),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10).r,
                              ),
                            ),
                            text: AppStrings.createTask.toUpperCase(),
                            textStyle: TextStyleTheme.textStyle14Regular,
                            onPress: () {
                              if (bloc.formKey.currentState!.validate()) {
                                bloc.insertTask(context);
                              }
                            },
                          ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
