import 'package:flutter/material.dart';
import 'package:flutter_note_app/backend/database_helper.dart';
import 'package:flutter_note_app/backend/note_model.dart';
import 'package:flutter_note_app/constants.dart';
import 'package:flutter_note_app/ui/widgets/logo_image_title.dart';
import 'package:fleva_icons/fleva_icons.dart';

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
    int result;
    if (note.id != null) {
      // Case 1: Update operation
      result = await databaseHelper.updateNoteInDb(note);
    } else {
      // Case 2: Insert Operation
      result = await databaseHelper.addNoteToDb(note);
    }

    if (result != 0) {
      // Success
      _showAlertDialog('Status', 'Note Saved Successfully');
    } else {
      // Failure
      _showAlertDialog('Status', 'Problem Saving Note');
    }
  }

  void deleteNote(noteid) async {
    int result = await databaseHelper.deleteNoteFromDb(note.id);
    if (note.id == null) {
      _showAlertDialog("Status", "No note was deleted");
      return;
    } else {
      if (result != 0) {
        _showAlertDialog("Status", "Note was deleted successfully.");
      } else {
        _showAlertDialog("Status", "Note was failed to be deleted.");
      }
    }
  }

  _showAlertDialog(String title, String message) {
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

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            FlevaIcons.arrow_ios_back,
            color: navigationIconColor,
          ),
          iconSize: titleFontSize,
          onPressed: () {
            Navigator.pop(context);
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
              FlevaIcons.trash_2_outline,
              size: 27,
              color: navigationIconColor,
            ),
            onPressed: () {
              setState(() {
                deleteNote(note.id);
              });
            },
          ),
          IconButton(
            icon: Icon(
              FlevaIcons.save_outline,
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
            Container(
              color: Colors.white,
              child: TextField(
                maxLength: 40,
                maxLengthEnforced: true,
                maxLines: 1,
                onChanged: (value) {
                  print(value);
                  saveTitle();
                },
                controller: noteTitleEditingController,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: typedTextColor,
                  fontSize: 24,
                ),
                cursorColor: cursorColor,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 24.0,
                  ),
                  hintText: "Title ...",
                  hintStyle: TextStyle(
                    color: hintTextColor,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              child: TextField(
                maxLines: 20,
                onChanged: (value) {
                  print(value);
                  saveNoteBody();
                },
                controller: noteBodyEditingController,
                style: TextStyle(
                  color: typedTextColor,
                  fontSize: 20,
                ),
                cursorColor: cursorColor,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 24.0,
                  ),
                  hintText: "Your note goes here ...",
                  hintStyle: TextStyle(
                    color: hintTextColor,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
