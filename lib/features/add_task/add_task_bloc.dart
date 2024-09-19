import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/core/srevices/srevice_locator.dart';
import '../../core/database/sqflite_helper.dart';
import '../../core/logic/helper_methods.dart';
import '../../core/utils/app_color.dart';
import '../../models/model.dart';

part 'add_task_event.dart';

part 'add_task_state.dart';

class TaskBloc extends Cubit<TaskStates> {
  TaskBloc() : super(TaskStates());

  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final noteController = TextEditingController();
  final dateController = TextEditingController();
  final startTimeController = TextEditingController();
  final endTimeController = TextEditingController();
  final titleFocusNode = FocusNode();
  final noteFocusNode = FocusNode();
  final dateFocusNode = FocusNode();
  DateTime currentDate = DateTime.now();
  DateTime selectedDate = DateTime.now();
  int currentIndex = 0;
  String startTime = DateFormat("hh:mm a").format(DateTime.now());
  String endTime = DateFormat("hh:mm a").format(
    DateTime.now().add(
      const Duration(minutes: 45),
    ),
  );

  void getDate(BuildContext context) async {
    emit(GetDataLoadingTaskState());
    DateTime? pickedDate = await showDatePicker(
      //context: event.context,
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
      keyboardType: TextInputType.datetime,
    );
    if (pickedDate != null) {
      currentDate = pickedDate;
      emit(GetDataSuccessTaskState());
    } else {
      emit(GetDataFailureTaskState());
      debugPrint("pickedDate  == null");
    }
  }

  void getStartTime(BuildContext context) async {
    emit(GetStartTimeLoadingTaskState());
    TimeOfDay? pickedStartTime = await showTimePicker(
      context: context,
      //context: event.context,
      initialTime: TimeOfDay.fromDateTime(
        DateTime.now(),
      ),
    );
    if (pickedStartTime != null) {
      startTime = pickedStartTime.format(context);
      //startTime = pickedStartTime.format(event.context);
      emit(GetStartTimeSuccessTaskState());
    } else {
      emit(GetStartTimeFailureTaskState());
      debugPrint("pickedStartTime  == null");
    }
  }

  void getEndTime(BuildContext context) async {
    emit(GetEndTimeLoadingTaskState());
    TimeOfDay? pickedEndTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(
        DateTime.now(),
      ),
    );
    if (pickedEndTime != null) {
      endTime = pickedEndTime.format(context);
      emit(GetEndTimeSuccessTaskState());
    } else {
      emit(GetEndTimeFailureTaskState());
      debugPrint("pickedEndTime  == null");
    }
  }

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

  void changeCheckMarkIndex(int index) {
    currentIndex = index;
    emit(ChangeCheckMarkIndexState());
  }

  void getSelectedDate(date) {
    emit(GetSelectedDateLoadingState());
    selectedDate = date;
    emit(GetSelectedDateSuccessState());
    getTasks();
  }

  List<TaskModel> tasksList = [];

  void insertTask(BuildContext context) async {
    emit(LoadingCompletedTask());
    try {
      await Future.delayed(const Duration(seconds: 2));
      await getIt<SqfliteHelper>().insertToDatabase(
        TaskModel(
          color: currentIndex,
          title: titleController.text,
          note: noteController.text,
          date: DateFormat.yMd().format(currentDate),
          startTime: startTime,
          endTime: endTime,
          isCompleted: 0,
        ),
      );
      getTasks();
      // tasksList.add(
      //   TaskModel(
      //     id: 1,
      //     color: currentIndex,
      //     title: titleController.text,
      //     note: noteController.text,
      //     date: DateFormat.yMd().format(currentDate),
      //     startTime: startTime,
      //     endTime: endTime,
      //     isCompleted: 0,
      //   ),
      // );
      emit(SuccessCompletedTask());
      showToast(msg: "The operation was successfully completed");
      Navigator.pop(context);
      titleController.clear();
      noteController.clear();
    } catch (ex) {
      emit(FailureCompletedTask());
    }
  }

  void getTasks() async {
    emit(GetDataLoadingCompletedTask());
    await getIt<SqfliteHelper>().getFromDatabase().then(
      (value) {
        tasksList = value
            .map((e) => TaskModel.fromJson(e))
            .toList()
            .where(
              (element) => element.date == DateFormat.yMd().format(selectedDate),
            )
            .toList();
        emit(GetDataSuccessCompletedTask());
      },
    ).catchError((e) {
      debugPrint(e.toString());
      emit(GetDataFailureCompletedTask());
    });
  }

  // updateTask

  void updateTask(int id) async {
    emit(UpdateDataLoadingCompletedTask());
    await getIt<SqfliteHelper>().updateDatabase(id).then(
      (value) {
        emit(UpdateDataSuccessCompletedTask());
        getTasks();
      },
    ).catchError((e) {
      debugPrint(e.toString());
      emit(UpdateDataFailureCompletedTask());
    });
  }

// deleteTask

  void deleteTask(int id) async {
    emit(DeleteDataLoadingCompletedTask());
    await getIt<SqfliteHelper>().deleteFromDatabase(id).then(
      (value) {
        emit(DeleteDataSuccessCompletedTask());
        getTasks();
      },
    ).catchError((e) {
      debugPrint(e.toString());
      emit(DeleteDataFailureCompletedTask());
    });
  }
}
