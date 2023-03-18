import 'package:added_good/added_good/controller/note_controller.dart';
import 'package:added_good/added_good/model/note/note_model.dart';
import 'package:added_good/added_good/view/screens/edit_note_screen.dart';
import 'package:auto_direction/auto_direction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import '../../../core/styles/app_colors.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({Key? key, required this.noteModel, required this.noteID, required this.noteController}) : super(key: key);

  final int noteID;
  final NoteModel noteModel;
  final NoteController noteController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Slidable(
        enabled: false,
        endActionPane: ActionPane(
          extentRatio: 0.20,
          motion: ScrollMotion(),
          children: [
            SlidableAction(onPressed: null, icon: Icons.delete,foregroundColor: AppColors.primary,)
          ],
        ),
        child: Card(
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () {
              noteController.noteId = this.noteID;
              Get.to(()=>EditNoteScreen(
                  noteId: noteController.noteId,
                  noteController: noteController,
                  titleTextController: TextEditingController(text: noteModel.noteTitle),
                  noteTextController: TextEditingController(text: noteModel.note),
                )
              );
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 15,vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Flexible(flex: 5,
                      child: Row(
                      children: [
                      //Icon(Icons.home_filled,color: AppColors.primary,),
                      //SizedBox(width: 7,),
                      Expanded(
                          child: AutoDirection(
                            text: noteModel.noteTitle,
                            child: Text(
                              "${noteModel.noteTitle}",
                              style: TextStyle(color: AppColors.flexSchemeLight.primary,fontSize: 22,),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                      ),
                    ],)),
                  ],),
                  SizedBox(height: 4,),
                  Text(
                    "${noteModel.noteDate}",
                    style: TextStyle(color: AppColors.primary,fontSize: 12),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 15,),
                  AutoDirection(
                    text: noteModel.note,
                    child: Text(
                      "${noteModel.note}",
                      style: TextStyle(color: AppColors.flexSchemeLight.primary,fontSize: 14),
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
