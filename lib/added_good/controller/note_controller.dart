import 'package:added_good/added_good/model/note/note_model.dart';
import 'package:added_good/core/database/local_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constants/constants.dart';

class NoteController extends GetxController{

  TextEditingController noteTitleTextController = TextEditingController();
  TextEditingController noteTextController = TextEditingController();
  LocalDatabase localDatabase = LocalDatabase();
  int? noteId;
  List? notesList;

  @override
  void onInit(){
    notesList = localDatabase.read(notesBox).reversed.toList();
    print('Notes Loaded');
    super.onInit();
  }

  getNotes(){
    notesList = localDatabase.read(notesBox).reversed.toList();
  }

  createNote(NoteModel note){
    if(note.noteTitle.isEmpty){
      List lines = note.note.split('\n');
      note.noteTitle = lines[0];
      note.note = note.note.replaceFirst("${lines[0]}\n", "");
      localDatabase.add(notesBox, note);
      print("note added successfully");
      noteTitleTextController.clear();
      noteTextController.clear();
      getNotes();
      update();
    }else{
      localDatabase.add(notesBox, note);
      print("note added successfully");
      noteTitleTextController.clear();
      noteTextController.clear();
      getNotes();
      update();
    }
  }

  editNote(int noteId,NoteModel note){
    localDatabase.update(noteId, notesBox, note);
    print("note edited successfully");
    noteTitleTextController.clear();
    noteTextController.clear();
    getNotes();
    update();
  }

  deleteNote(int index){
    localDatabase.delete(index,notesBox);
    print("note deleted successfully");
    getNotes();
    update();
  }

}