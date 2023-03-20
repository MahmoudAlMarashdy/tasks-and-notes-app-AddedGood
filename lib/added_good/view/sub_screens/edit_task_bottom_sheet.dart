import 'package:added_good/added_good/controller/task_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_themes.dart';
import '../../model/task/task_model.dart';

class EditTaskBottomSheet extends StatelessWidget {
  const EditTaskBottomSheet({Key? key, required this.textController, required this.taskController, required this.taskId}) : super(key: key);

  final int? taskId;
  final TaskController taskController;
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom+10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Edit Task"),
          SizedBox(height: 20,),
          TextField(
            autofocus: true,
            controller: textController,
            maxLines: null,
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: (){
                    taskController.taskTextController=textController;
                    taskController.editTask(
                      taskId!,
                      TaskModel(
                          task: taskController.taskTextController.text,
                          isDone: false
                      )
                    );
                    Get.back();
                  },
                  child: Text("Save")
              ),
              OutlinedButton(
                  onPressed: (){
                    taskController.deleteTask(taskId!);
                    Get.back();
                  },
                  child: Text("delete")
              ),
            ],
          )
        ],
      ),
    );
  }
}
