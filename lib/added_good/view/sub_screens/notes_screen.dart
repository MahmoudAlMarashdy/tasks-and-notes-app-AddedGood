import 'package:added_good/added_good/controller/note_controller.dart';
import 'package:added_good/added_good/view/screens/add_note_screen.dart';
import 'package:added_good/added_good/view/widgets/category_filter.dart';
import 'package:added_good/added_good/view/widgets/note_card.dart';
import 'package:added_good/core/database/local_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_themes.dart';

class NotesSection extends StatelessWidget {
  const NotesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    NoteController noteController = Get.put(NoteController());

    return Scaffold(
      body: Container(
        child: GetBuilder<NoteController>(
          builder: (controller) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 8,),
              controller.notesList!.isNotEmpty?
              GetBuilder<NoteController>(
                builder: (controller) => Expanded(
                  child: ListView.builder(
                    itemCount: controller.notesList?.length,
                    itemBuilder: (context , index,){
                      return NoteCard(
                        noteID: index,
                        noteModel: controller.notesList![index],
                        noteController: controller,
                      );
                    },
                  ),
                ),
              ):
              Center(
                  child: Text(
                    "No Notes \n press ➕ to add",
                    textAlign: TextAlign.center,
                  )
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: ()=>Get.to(()=>AddNoteScreen(noteController: noteController,)),
      ),
    );
  }
}
