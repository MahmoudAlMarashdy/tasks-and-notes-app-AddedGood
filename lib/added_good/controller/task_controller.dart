import 'package:added_good/added_good/model/task/task_model.dart';
import 'package:added_good/core/database/local_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constants/constants.dart';

class TaskController extends GetxController{

  TextEditingController taskTextController = TextEditingController();
  LocalDatabase localDatabase = LocalDatabase();
  int? taskId;
  var tasksList;

  @override
  void onInit(){
    tasksList = localDatabase.read(tasksBox);
    print('Tasks Loaded');
    super.onInit();
  }

  getTasks(){
    tasksList = localDatabase.read(tasksBox);
  }

  createTask(TaskModel task){
    localDatabase.add(tasksBox, task);
    print("task added successfully");
    taskTextController.clear();
    getTasks();
    update();
  }

  editTask(int taskId,TaskModel taskModel){
    localDatabase.update(taskId, tasksBox, taskModel);
    print("task edited successfully");
    taskTextController.clear();
    getTasks();
    update();
  }

  deleteTask(int index){
    localDatabase.delete(index,tasksBox);
    print("task deleted successfully");
    getTasks();
    update();
  }

}