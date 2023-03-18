import 'package:hive_flutter/hive_flutter.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel extends HiveObject{

  @HiveField(0)
  String task;
  @HiveField(1)
  bool isDone;

  TaskModel({required this.task, required this.isDone});

}