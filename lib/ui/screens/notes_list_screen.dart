import 'package:flutter/material.dart';
import 'package:flutter_note_app/backend/database_helper.dart';
import 'package:flutter_note_app/backend/note_model.dart';
import 'package:flutter_note_app/constants.dart';
import 'package:flutter_note_app/ui/screens/write_note_screen.dart';
import 'package:flutter_note_app/ui/widgets/logo_image_title.dart';
import 'package:flutter_note_app/ui/widgets/notes_list_tile.dart';
import 'package:sqflite/sqflite.dart';

class NotesListScreen extends StatefulWidget {
  @override
  _NotesListScreenState createState() => _NotesListScreenState();
}

class _NotesListScreenState extends State<NotesListScreen> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  int counter = 0;
  List<Note> noteList;

  void navigateToWriteNote(Note note) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WriteNoteScreen(note),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    updateListView();
    return Scaffold(
        appBar: AppBar(
          leading: Transform.scale(
            scale: 0.5,
            child: LogoImageTitle(
              height: 23,
              width: 23,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.search,
                color: typedTextColor,
              ),
              onPressed: () {
                databaseHelper.getCount();
              },
            ),
            IconButton(
              icon: Icon(
                Icons.sort,
                color: typedTextColor,
              ),
              onPressed: () => {},
            ),
          ],
        ),
        floatingActionButton: Container(
          height: 48.0,
          width: 48.0,
          child: FloatingActionButton(
            child: Icon(Icons.create),
            backgroundColor: buttonColor,
            elevation: 1,
            onPressed: () {
              navigateToWriteNote(Note("Untitled", "No body"));
            },
          ),
        ),
        body: ListView.builder(
            itemCount: counter,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Text("$index", style: TextStyle(color: Colors.red)),
              );
            }));
    //     NoteListTile(
    //       index: index,
    //       context: context,
    //       noteList: noteList,
    // //       callFunction: updateListView(),
    //     )
    //   },
    // )
//    ListView(
//            padding: const EdgeInsets.all(8),
//            children: <Widget>[
//              NoteListTile(),
//              NoteListTile(),
//              NoteListTile(),
//              NoteListTile(),
//              NoteListTile(),
//              NoteListTile(),
//              NoteListTile(),
//              NoteListTile(),
//            ],
//          ),
    //         ),
    //   ),
    // );
  }

  updateListView() {
    //   /*
    //     wil call the singleton object
    //     after getting the database i will then get the instance
    //     of the notelist.
    //     after getting the notelist i will update
    //     the vars of this class.
    //    */
    //   final Future<Database> dbFuture = databaseHelper.initialiseDatabase();
    //   dbFuture.then((database) {
    //     Future<List<Note>> noteListFuture = databaseHelper.getNoteList();
    //     noteListFuture.then((noteList) {
    //       setState(() {
    //         this.noteList = noteList;
    //         this.counter = noteList.length;
    //       });
    //     });
    //   });
  }
}
