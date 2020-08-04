import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_note_app/backend/database_helper.dart';
import 'package:flutter_note_app/backend/note_model.dart';
import 'package:flutter_note_app/constants.dart';
import 'package:flutter_note_app/ui/widgets/logo_image_title.dart';
import 'package:flutter_note_app/ui/widgets/write_note_field.dart';

class WriteNoteScreen extends StatefulWidget {
  final Note note;
  WriteNoteScreen(this.note);
  @override
  _WriteNoteScreenState createState() => _WriteNoteScreenState(note);
}

class _WriteNoteScreenState extends State<WriteNoteScreen> {
  TextEditingController noteTitleEditingController = TextEditingController();
  TextEditingController noteBodyEditingController = TextEditingController();
  DatabaseHelper databaseHelper = DatabaseHelper();
  Note note;

  _WriteNoteScreenState(this.note);

  int result;
  void saveNote() async {
    result = await databaseHelper.addNoteToDb(note);
    print("$result added  note to db");
    // if (note.id != 0) {
    //   result = await databaseHelper.updateNoteInDb(note);
    // } else {
    //   result = await databaseHelper.addNoteToDb(note);
    // }

    if (result != 0) {
      _showAlertDialogue("Staus", "Note Saved");
    } else {
      _showAlertDialogue("Status", "Failed to Save Note");
    }
  }

  void deleteNote(noteid) async {
    int result = await databaseHelper.deleteNoteFromDb(note.id);
    if (note.id == null) {
      _showAlertDialogue("Status", "No note was deleted");
      return;
    } else {
      if (result != 0) {
        _showAlertDialogue("Status", "Note was deleted successfully.");
      } else {
        _showAlertDialogue("Status", "Note was failed to be deleted.");
      }
    }
  }

  _showAlertDialogue(String title, String message) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(
      context: context,
      builder: (_) => alertDialog,
    );
  }

  saveTitle() {
    // making the last edited text the title
    note.title = noteTitleEditingController.text;
  }

  saveNoteBody() {
    // making the last edited text the title
    note.noteBody = noteBodyEditingController.text;
  }

  @override
  Widget build(BuildContext context) {
    noteTitleEditingController.text = note.title;
    noteBodyEditingController.text = note.noteBody;

    return WillPopScope(
      // ignore: missing_return
      onWillPop: () {
        Navigator.pop(context, true);
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.keyboard_arrow_left,
              color: navigationIconColor,
            ),
            iconSize: titleFontSize,
            onPressed: () {
              saveNote();
              Navigator.pop(context, true);
            },
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: LogoImageTitle(
            height: 23,
            width: 23,
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.delete_outline,
                  size: 27,
                  color: navigationIconColor,
                ),
                onPressed: () => {deleteNote(note.id)}),
            IconButton(
              icon: Icon(
                Icons.save,
                size: 27,
                color: navigationIconColor,
              ),
              onPressed: () => {
                setState(() {
                  saveNote();
                })
              },
            )
          ],
        ),
        body: Container(
          color: Colors.white,
          child: ListView(
            children: <Widget>[
              WriteNoteField(
                controller: noteTitleEditingController,
                hint: "Title",
                size: 24,
                flex: 2,
                maxChar: 20,
                fontWeight: FontWeight.w700,
                onChangedFunction: saveTitle(),
              ),
              WriteNoteField(
                controller: noteBodyEditingController,
                hint: "Your note goes here...",
                size: normalFontSize,
                flex: 5,
                maxChar: 512,
                onChangedFunction: saveNoteBody(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
