part of 'add_task_bloc.dart';

// Task Events

class TaskEvents {}

class TaskEvent extends TaskEvents{
  final BuildContext context;

  TaskEvent({required this.context});
}

// Start Time Event

class StartTimeEvent extends TaskEvents{
  final BuildContext context;

  StartTimeEvent({required this.context});
}

// End Time Event

class EndTimeEvent extends TaskEvents{
  final BuildContext context;

  EndTimeEvent({required this.context});
}

// Change Check Mark Index

class ChangeCheckMarkIndexEvent extends TaskEvents{
  final int index;

  ChangeCheckMarkIndexEvent({required this.index});
}

// Completed Task Event

class CompletedTaskEvent extends TaskEvents {
  final BuildContext context;

  CompletedTaskEvent({required this.context});
}

