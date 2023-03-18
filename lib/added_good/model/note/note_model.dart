import 'package:hive_flutter/hive_flutter.dart';

part 'note_model.g.dart';

@HiveType(typeId: 1)
class NoteModel extends HiveObject{

  @HiveField(0)
  String noteTitle;
  @HiveField(1)
  String note;
  @HiveField(2)
  String noteDate;

  NoteModel({required this.noteTitle, required this.note, required this.noteDate});
}