import 'package:hive_flutter/hive_flutter.dart';
import '../../added_good/model/note/note_model.dart';
import '../../added_good/model/task/task_model.dart';
import '../constants/constants.dart';

class LocalDatabase {

// initialising database
  static initDataBase() async {
    await Hive.initFlutter();
    Hive.registerAdapter(TaskModelAdapter());
    Hive.registerAdapter(NoteModelAdapter());
    await Hive.openBox(tasksBox);
    await Hive.openBox(notesBox);
    print("DataBase initiated");
  }

  static clearBoxes() async {
    await Hive.box(tasksBox).clear();
    await Hive.box(notesBox).clear();
    if(Hive.box(tasksBox).isEmpty&&Hive.box(notesBox).isEmpty){
      print('boxes cleared');
    }else{
      print('clearing failed');
    }
  }

//CRUD methods
  add(String boxName ,dynamic data) async {
    var box = Hive.box(boxName);
    await box.add(data);
  }

  List read(String boxName) {
    var box = Hive.box(boxName);
    return box.values.toList();
  }

  update(int id,String boxName ,dynamic data) async {
    var box = Hive.box(boxName);
    await box.putAt(id, data);
  }

  delete(int id,String boxName) async {
    var box = Hive.box(boxName);
    await box.deleteAt(id);
  }

}
