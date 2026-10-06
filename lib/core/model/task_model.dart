import 'package:hive_flutter/hive_flutter.dart';
part 'task_model.g.dart';

@HiveType(typeId: 1)
class TaskModel {
  @HiveField(0)
  String title;
  @HiveField(1)
  String description;
  @HiveField(2)
  String status;
  @HiveField(3)
  String time;
  @HiveField(4)
  String date;
  @HiveField(5)
  int color;
  TaskModel({
    required this.title,
    required this.description,
    required this.status,
    required this.date,
    required this.color,
    required this.time,
  });
}
