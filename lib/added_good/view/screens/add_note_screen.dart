import 'package:added_good/added_good/controller/note_controller.dart';
import 'package:added_good/added_good/model/note/note_model.dart';
import 'package:added_good/core/styles/app_colors.dart';
import 'package:auto_direction/auto_direction.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({Key? key, required this.noteController}) : super(key: key);

  final NoteController noteController;

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {

  String titleText = "";
  String noteText = "";

  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: (){
            if(formKey.currentState!.validate()){
              formKey.currentState!.save();
              widget.noteController.createNote(
                  NoteModel(
                    noteTitle: widget.noteController.noteTitleTextController.text,
                    note: widget.noteController.noteTextController.text,
                    noteDate: DateFormat('dd/MMM/yyyy , h:mm a').format(DateTime.now()),
                  )
              );
              Get.back();
            }
            Get.back();
          },
        ),
        title: Text("New Note"),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: IconButton(onPressed: (){
              if(formKey.currentState!.validate()){
                formKey.currentState!.save();
                widget.noteController.createNote(
                    NoteModel(
                      noteTitle: widget.noteController.noteTitleTextController.text,
                      note: widget.noteController.noteTextController.text,
                      noteDate: DateFormat('dd/MMM/yyyy , h:mm a').format(DateTime.now()),
                    )
                );
                Get.back();
              }else{
                autovalidateMode = AutovalidateMode.always;
                setState(() {

                });
              }
            }, icon: Icon(Icons.check),iconSize: 30,),
          )
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
                  controller: widget.noteController.noteTitleTextController,
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
              child: Form(
                key: formKey,
                autovalidateMode: autovalidateMode,
                child: AutoDirection(
                  text: noteText,
                  child: TextFormField(
                    autofocus: true,
                    expands: true,
                    onSaved: onSaved,
                    validator: (value){
                      if(value?.isEmpty ?? true){
                        return("field cannot be empty");
                      }
                    },
                    onChanged: (txt){
                      setState(() {
                        noteText = txt;
                      });
                    },
                    controller: widget.noteController.noteTextController,
                    keyboardType: TextInputType.multiline,
                    style: TextStyle(fontSize: 18),
                    maxLines: null,
                    decoration: InputDecoration(
                      focusedBorder: InputBorder.none,
                      border: InputBorder.none,
                      hintText: "start typing ...",
                    ),
                  ),
                ),
              )
            ),
          ),
        ],
      ),
    );
  }
}
