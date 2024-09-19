part of 'add_task_bloc.dart';

class TaskStates {}

class GetDataLoadingTaskState extends TaskStates {}

class GetDataSuccessTaskState extends TaskStates {}

class GetDataFailureTaskState extends TaskStates {}

class GetStartTimeLoadingTaskState extends TaskStates {}

class GetStartTimeSuccessTaskState extends TaskStates {}

class GetStartTimeFailureTaskState extends TaskStates {}

class GetEndTimeLoadingTaskState extends TaskStates {}

class GetEndTimeSuccessTaskState extends TaskStates {}

class GetEndTimeFailureTaskState extends TaskStates {}

class ChangeCheckMarkIndexState extends TaskStates {}

class LoadingCompletedTask extends TaskStates {}

class GetSelectedDateSuccessState extends TaskStates {}

class GetSelectedDateLoadingState extends TaskStates {}

class SuccessCompletedTask extends TaskStates {}

class FailureCompletedTask extends TaskStates {}

class GetDataLoadingCompletedTask extends TaskStates {}

class GetDataSuccessCompletedTask extends TaskStates {}

class GetDataFailureCompletedTask extends TaskStates {}

class UpdateDataLoadingCompletedTask extends TaskStates {}

class UpdateDataSuccessCompletedTask extends TaskStates {}

class UpdateDataFailureCompletedTask extends TaskStates {}

class DeleteDataLoadingCompletedTask extends TaskStates {}

class DeleteDataSuccessCompletedTask extends TaskStates {}

class DeleteDataFailureCompletedTask extends TaskStates {}
