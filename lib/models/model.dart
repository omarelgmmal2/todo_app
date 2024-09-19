class TaskModel {
  final int? id;
  final int color;
  final String title;
  final String note;
  final String startTime;
  final String endTime;
  final String date;
  final int isCompleted;

  TaskModel({
    this.id,
    required this.color,
    required this.title,
    required this.note,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.isCompleted,
  });

  factory TaskModel.fromJson(Map<String, dynamic> jsonData) {
    return TaskModel(
      id: jsonData["id"],
      color: jsonData["color"],
      title: jsonData["title"],
      note: jsonData["note"],
      date: jsonData["date"],
      startTime: jsonData["startTime"],
      endTime: jsonData["endTime"],
      isCompleted: jsonData["isCompleted"],
    );
  }
}