import 'package:added_good/core/constants/constants.dart';
import 'package:auto_direction/auto_direction.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../core/database/local_database.dart';
import '../../../core/styles/app_colors.dart';
import '../../controller/note_controller.dart';
import '../../model/note/note_model.dart';

class EditNoteScreen extends StatefulWidget {
  const EditNoteScreen({Key? key, required this.noteController, this.noteId, required this.titleTextController, required this.noteTextController}) : super(key: key);

  final int? noteId;
  final NoteController noteController;
  final TextEditingController titleTextController;
  final TextEditingController noteTextController;

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {

  String titleText = "";
  String noteText = "";
  LocalDatabase localDatabase = LocalDatabase();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: (){
            widget.noteController.noteTitleTextController=widget.titleTextController;
            widget.noteController.noteTextController=widget.noteTextController;
            widget.noteController.editNote(
                widget.noteController.notesList!.length-widget.noteId!-1,
                NoteModel(
                    noteTitle: widget.noteController.noteTitleTextController.text,
                    note: widget.noteController.noteTextController.text,
                    noteDate: DateFormat('dd/MMM/yyyy , h:mm a').format(DateTime.now()),
                )
            );
            Get.back();
          },
        ),
        title: Text("Edit Note"),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: IconButton(onPressed: (){
              widget.noteController.noteTitleTextController=widget.titleTextController;
              widget.noteController.noteTextController=widget.noteTextController;
              widget.noteController.editNote(
                  widget.noteController.notesList!.length-widget.noteId!-1,
                  NoteModel(
                      noteTitle: widget.noteController.noteTitleTextController.text,
                      note: widget.noteController.noteTextController.text,
                      noteDate: DateFormat('dd/MMM/yyyy , h:mm a').format(DateTime.now()),
                  )
              );
              Get.back();
            }, icon: Icon(Icons.check),iconSize: 30,),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
              margin: EdgeInsets.symmetric(vertical: 10,horizontal: 30),
              child: AutoDirection(
                text: titleText,
                child: TextField(
                  onChanged: (txt){
                    setState(() {
                      titleText = txt;
                    });
                  },
                  controller: widget.titleTextController,
                  keyboardType: TextInputType.multiline,
                  style: TextStyle(fontSize: 24),
                  maxLines: null,
                  decoration: InputDecoration(
                    focusedBorder: InputBorder.none,
                      border: InputBorder.none,
                      hintText: "Title",
                  ),
                ),
              )
          ),
          Expanded(
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: AutoDirection(
                  text: noteText,
                  child: TextField(
                    expands: true,
                    onChanged: (txt){
                      setState(() {
                        noteText = txt;
                      });
                    },
                    controller: widget.noteTextController,
                    keyboardType: TextInputType.multiline,
                    style: TextStyle(fontSize: 18),
                    maxLines: null,
                    decoration: InputDecoration(
                      focusedBorder: InputBorder.none,
                        border: InputBorder.none,
                        hintText: "start typing ...",
                    ),
                  ),
                )
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              heroTag: "delete btn",
              onPressed: (){
                widget.noteController.deleteNote(
                  widget.noteController.notesList!.length-widget.noteId!-1,
                );
                Get.back();
              },
              child: Icon(Icons.delete),
            ),
            FloatingActionButton(
              heroTag: "save btn",
              onPressed: (){
                widget.noteController.noteTitleTextController=widget.titleTextController;
                widget.noteController.noteTextController=widget.noteTextController;
                widget.noteController.editNote(
                    widget.noteController.notesList!.length-widget.noteId!-1,
                    NoteModel(
                      noteTitle: widget.noteController.noteTitleTextController.text,
                      note: widget.noteController.noteTextController.text,
                      noteDate: DateFormat('dd/MMM/yyyy , h:mm a').format(DateTime.now()),
                    )
                );
                Get.back();
              },
              child: Icon(Icons.check),
            ),
          ],
        ),
      ),
    );
  }
}
