import 'package:added_good/added_good/model/task/task_model.dart';
import 'package:added_good/core/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/styles/app_themes.dart';
import '../../controller/task_controller.dart';
import '../widgets/category_filter.dart';

class AddTaskBottomSheet extends StatefulWidget {

  AddTaskBottomSheet({Key? key, required this.taskController}) : super(key: key);
  final TaskController taskController;

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {

  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom+10,
      ),
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Add Task",style: AppThemes().lightAppTheme.textTheme.bodyLarge),
            SizedBox(height: 20,),
            TextFormField(
              style: TextStyle(
                color: AppColors.flexSchemeLight.primary
              ),
              onSaved: onSaved,
              validator: (value){
                if(value?.isEmpty ?? true){
                  return("field cannot be empty");
                }
              },
              maxLines: null,
              controller: widget.taskController.taskTextController,
            ),
            SizedBox(height: 20,),
            ElevatedButton(
            onPressed: () {
              if(formKey.currentState!.validate()){
                formKey.currentState!.save();
                widget.taskController.createTask(
                    TaskModel(
                        task: widget.taskController.taskTextController.text,
                        isDone: false
                    )
                );
                Get.back();
              }else{
                autovalidateMode = AutovalidateMode.always;
                setState(() {

                });
              }
            },
            child: Text("Add")
        ),
          ],
        ),
      ),
    );
  }
}
