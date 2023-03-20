import 'package:added_good/added_good/model/task/task_model.dart';
import 'package:added_good/added_good/view/sub_screens/edit_task_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import '../../../core/styles/app_colors.dart';
import '../../controller/task_controller.dart';

class TaskCard extends StatefulWidget {
  final int taskId;
  final TaskModel taskModel;
  final TaskController taskController;

  TaskCard({
    Key? key,
    required this.taskModel,
    required this.taskController,
    required this.taskId,
  }) : super(key: key);

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {

  bool? isDone = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 25,
      ),
      child: Slidable(
        enabled: false,
        endActionPane: ActionPane(
          extentRatio: 0.20,
          motion: BehindMotion(),
          children: [
            SlidableAction(
              onPressed: null,
              icon: Icons.delete,
            )
          ],
        ),
        child: Card(
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () {
              widget.taskController.taskId = this.widget.taskId;
              showModalBottomSheet(
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                )),
                context: context,
                builder: (context) => EditTaskBottomSheet(
                  taskId: widget.taskController.taskId,
                  taskController: widget.taskController,
                  textController: TextEditingController(text: widget.taskModel.task),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                      flex: 10,
                      child: Row(
                        children: [
                          // Icon(Icons.home_filled,color: AppColors.primary,),
                          // SizedBox(width: 7,),
                          Expanded(
                              child: Text(
                            widget.taskModel.task,
                            style: TextStyle(decoration: isDone == true?
                                TextDecoration.lineThrough :
                                TextDecoration.none
                            ),
                          )),
                        ],
                      )),
                  Flexible(
                      flex: 1,
                      child: Checkbox(
                        value: isDone,
                        onChanged: (bool){
                          widget.taskModel.isDone = bool!;
                          print(widget.taskModel.isDone);
                          setState(() {
                            isDone = bool;
                          });
                        },
                      )
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
