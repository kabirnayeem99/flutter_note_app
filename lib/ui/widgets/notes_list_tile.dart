import 'package:flutter/material.dart';
import 'package:flutter_note_app/backend/database_helper.dart';
import 'package:flutter_note_app/backend/note_model.dart';
import 'package:flutter_note_app/constants.dart';
import 'package:flutter_note_app/ui/screens/write_note_screen.dart';

class NoteListTile extends StatelessWidget {
  const NoteListTile({
    this.noteList,
    this.index,
    this.context,
    this.callFunction,
    Key key,
  }) : super(key: key);
  final int index;
  final BuildContext context;
  final List<Note> noteList;
  final Function callFunction;

  void navigateToWriteNote(Note note) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WriteNoteScreen(note),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    callFunction();
    DatabaseHelper databaseHelper = DatabaseHelper();
    void _deleteNote(BuildContext context, Note note) async {
      int result = await databaseHelper.deleteNoteFromDb(note.id);
      if (result != 0) {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "$index Note got deleted",
              style: TextStyle(color: hintTextColor, fontFamily: "Caveat"),
            ),
            backgroundColor: Colors.white,
          ),
        );
      }
    }

    return Dismissible(
      key: Key("who"),
      onDismissed: (direction) {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "deleted",
              style: TextStyle(color: hintTextColor),
            ),
            backgroundColor: Colors.white,
          ),
        );
        // Remove the item from the data source.
      },
      child: Container(
        color: Colors.white,
        child: ListTile(
          onTap: () {
            debugPrint("$index th note is  tapped");
            navigateToWriteNote(this.noteList[index]);
          },
          title: Text(
            noteList[index].title,
            style: TextStyle(color: typedTextColor, fontSize: 24),
          ),
          subtitle: Text(
            noteList[index].noteBody,
            style: TextStyle(color: hintTextColor, fontSize: 20),
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.delete_outline,
              color: hintTextColor,
            ),
            iconSize: 20,
            onPressed: () {
              _deleteNote(context, noteList[index]);
            },
          ),
        ),
      ),
    );
  }
}
