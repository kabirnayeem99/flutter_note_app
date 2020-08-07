import 'package:fleva_icons/fleva_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_note_app/backend/database_helper.dart';
import 'package:flutter_note_app/backend/note_model.dart';
import 'package:flutter_note_app/constants.dart';
import 'package:flutter_note_app/ui/screens/write_note_screen.dart';
import 'package:flutter_note_app/ui/widgets/logo_image_title.dart';
import 'package:sqflite/sqflite.dart';

class NotesListScreen extends StatefulWidget {
  NotesListScreen({Key key}) : super(key: key);

  @override
  _NotesListScreenState createState() => _NotesListScreenState();
}

class _NotesListScreenState extends State<NotesListScreen> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  Note note;
  List<Note> noteList = [];
  int count = 0;

  void _deleteNote(BuildContext context, Note note) async {
    int result = await databaseHelper.deleteNoteFromDb(note.id);
    if (result != 0) {
      _showSnackBar(context, 'Note Deleted Successfully');
      updateListView();
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      backgroundColor: buttonColor,
      content: Text(
        message,
        style: TextStyle(
          fontFamily: "Caveat",
          fontSize: 20,
        ),
      ),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }

  void updateListView() {
    final Future<Database> dbFuture = databaseHelper.initialiseDatabase();
    dbFuture.then((database) {
      Future<List<Note>> noteListFuture = databaseHelper.getNoteList();
      noteListFuture.then((noteList) {
        setState(() {
          this.noteList = noteList;
          this.count = noteList.length;
        });
      });
    });
  }

  void navigateToWriteNote(BuildContext context, Note note) async {
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
      backgroundColor: Colors.white,
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
        actions: actionsList,
      ),
      body: buildNoteListView(),
      floatingActionButton: floatingActionButtonNote(context),
    );
  }

  List<Widget> actionsList = [
    IconButton(
      icon: Icon(
        FlevaIcons.eye_outline,
        color: typedTextColor,
      ),
      onPressed: () {},
    ),
    // IconButton(
    //   icon: Icon(
    //     FlevaIcons.,
    //     color: typedTextColor,
    //   ),
    //   onPressed: () => {},
    // ),
  ];

  Container floatingActionButtonNote(BuildContext context) {
    return Container(
      height: 48.0,
      width: 48.0,
      child: FloatingActionButton(
        child: Icon(FlevaIcons.brush_outline),
        backgroundColor: buttonColor,
        elevation: 1,
        onPressed: () {
          navigateToWriteNote(context, Note("", ""));
        },
      ),
    );
  }

  ListView buildNoteListView() {
    return ListView.builder(
      itemCount: count,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            noteList[index].title,
            style: TextStyle(fontSize: 24),
          ),
          subtitle: Text(
            noteList[index].noteBody,
            style: TextStyle(fontSize: 20),
          ),
          trailing: GestureDetector(
            child: Icon(
              FlevaIcons.trash_2_outline,
              color: Colors.grey,
            ),
            onTap: () {
              _deleteNote(context, noteList[index]);
            },
          ),
          onTap: () {
            debugPrint("$index ListTile Tapped");
            navigateToWriteNote(context, this.noteList[index]);
          },
        );
      },
    );
  }
}
