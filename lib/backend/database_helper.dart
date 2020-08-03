import 'package:flutter_note_app/backend/note_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';

class DatabaseHelper {
  /*
  In object-oriented programming, a singleton class is
  a class that can have only one object
  (an instance of the class) at a time. I  need to initiate database
  once throughout the lifecycle of this app.
   */
  static DatabaseHelper _databaseHelper; //singleton database helper
  static Database _database; //singleton database
  String noteTable = "note_table";
  String id = 'id';
  String title = 'title';
  String noteBody = 'note_body';
  // Named constructor to create instance of database helper
  DatabaseHelper._createInstance();
  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance();
    }
    return _databaseHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initialiseDatabase();
    }
    return _database;
  }

  Future<Database> initialiseDatabase() async {
    /*
    This function will init database by first retrieving the
    path of the respective os database dir. and after creating
    it will create a table for storing the notes.
     */
    String path = join(await getDatabasesPath(), 'note_schema.db');
    final Future<Database> database = openDatabase(
      path,
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
      // When the database is first created, create a table to store notes.
      onCreate: createDatabase,
    );
    return database;
  }

  void createDatabase(Database db, int newVersion) async {
    await db.execute(
      "CREATE TABLE $noteTable($id INTEGER PRIMARY KEY AUTOINCREMENT, $title TEXT, $noteBody TEXT)",
    );
  }
}
