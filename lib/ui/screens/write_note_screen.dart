import 'package:flutter/material.dart';
import 'package:flutter_note_app/constants.dart';
import 'package:flutter_note_app/ui/screens/notes_list_screen.dart';
import 'package:flutter_note_app/ui/widgets/logo_image_title.dart';
import 'package:flutter_note_app/ui/widgets/write_note_field.dart';

class WriteNoteScreen extends StatefulWidget {
  @override
  _WriteNoteScreenState createState() => _WriteNoteScreenState();
}

class _WriteNoteScreenState extends State<WriteNoteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_left,
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
              Icons.delete_outline,
              size: 27,
              color: navigationIconColor,
            ),
            onPressed: () => {
              Navigator.push(context, MaterialPageRoute(builder: (context) => NotesListScreen(),))
            },
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          WriteNoteField(
            hint: "Title",
            size: 24,
            flex: 2,
            maxChar: 20,
            fontWeight: FontWeight.w700,
          ),
          WriteNoteField(
            hint: "Your note goes here...",
            size: normalFontSize,
            flex: 5,
            maxChar: 512,
          ),
        ],
      ),
    );
  }
}

