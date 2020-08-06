import 'package:flutter_note_app/backend/note_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class DatabaseHelper {
//  Note note =
  /*
  In object-oriented programming, a singleton class is
  a class that can have only one object
  (an instance of the class) at a time. I  need to initiate database
  once throughout the lifecycle of this app.
   */
  static DatabaseHelper _databaseHelper; //singleton database helper
  static Database _database; //singleton database
  String noteTable = "noteTable";
  String colId = 'id';
  String colTitle = 'title';
  String noteBody = 'noteBody';

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
    String path = join(await getDatabasesPath(), 'noteSchema.db');
    final Future<Database> noteDatabase = openDatabase(
      path,
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
      // When the database is first created, create a table to store notes.
      onCreate: _createDatabase,
    );
    print("noteDatabase was initialised in $path");
    return noteDatabase;
  }

  void _createDatabase(Database db, int newVersion) async {
    await db.execute(
      "CREATE TABLE $noteTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colTitle TEXT, $noteBody TEXT)",
    );
    print("$noteTable was created");
  }

  Future<List<Map<String, dynamic>>> getNoteMapList() async {
    /*
      same as select * from note_table;
       */
    Database db = await this.database;
    var result = db.query(noteTable, orderBy: '$colId');
    print(result);
    return result;
  }

  Future<int> addNoteToDb(Note note) async {
    /*
    add a note to the database by turning the note into a map
    and returns its id
     */
    Database db = await this.database;
    var result = await db.insert(noteTable, note.toMap());
    // rawInsert("INSERT into $noteTable($title, $noteBody) VALUES ("${note.title}", "${note.noteBody}");");
    print('Note added: ${note.title} ${note.noteBody}');
    return result;
  }

  Future<int> updateNoteInDb(Note note) async {
    Database db = await this.database;
    var result = await db.update(
      noteTable,
      note.toMap(),
      where: "$colId = ?",
      whereArgs: [note.id],
    );
    print('$result > updated: ${note.title} ${note.noteBody}');

    return result;
  }

  Future<int> deleteNoteFromDb(int id) async {
    Database db = await this.database;
    int result =
        await db.rawDelete("delete from $noteTable where $colId = $id");
    return result;
  }

  Future<int> getCount() async {
    /*
    Total number of notes in the
    database.
     */
    Database db = await this.database;
    List<Map<String, dynamic>> allObjectsList = await db.query(noteTable);
    int result = Sqflite.firstIntValue(allObjectsList);
    print(result);
    return result;
  }

  Future<List<Note>> getNoteList() async {
    /*
    this function will fetch the note map list 
    and using for loop it will separeate each notemap 
    and will create a list of notes after making these map
    into note objects. 
     */
    var noteMapList = await getNoteMapList();
    int count = noteMapList.length;
    List<Note> noteList = List<Note>();

    for (int eachNoteMapIndex = 0;
        eachNoteMapIndex < count;
        eachNoteMapIndex++) {
      noteList.add(Note.fromMap(noteMapList[eachNoteMapIndex]));
    }

    return noteList;
  }
}
