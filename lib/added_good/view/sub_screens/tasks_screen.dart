import 'package:added_good/added_good/controller/task_controller.dart';
import 'package:added_good/added_good/model/task/task_model.dart';
import 'package:added_good/added_good/view/sub_screens/add_task_bottom_sheet.dart';
import 'package:added_good/added_good/view/widgets/category_filter.dart';
import 'package:added_good/added_good/view/widgets/task_card.dart';
import 'package:added_good/core/database/local_database.dart';
import 'package:added_good/core/styles/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/styles/app_colors.dart';

class TasksSection extends StatelessWidget {
  const TasksSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    TaskController taskController = Get.put(TaskController());

    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 8,),
            GetBuilder<TaskController>(
              builder: (controller) =>
                controller.tasksList!.isNotEmpty?
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.tasksList?.length,
                    itemBuilder: (context , index){
                      return TaskCard(
                        taskId: index,
                        taskController: controller,
                        taskModel: controller.tasksList?[index],
                      );
                    },
                  ),
                ):
                Center(
                  child: Text(
                    "No Tasks \n press ➕ to add",
                    textAlign: TextAlign.center,
                    //style: AppThemes.lightAppTheme.textTheme.bodyMedium,
                  )
                ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => showModalBottomSheet(
          isScrollControlled: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )
          ),
          context: context,
          builder:(context) => AddTaskBottomSheet(taskController: taskController,),
        ),
      ),
    );
  }
}
