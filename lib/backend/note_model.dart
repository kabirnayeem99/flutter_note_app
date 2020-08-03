import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Note {
  final String title;
  final String noteBody;

  Note(this.title, this.noteBody);

}