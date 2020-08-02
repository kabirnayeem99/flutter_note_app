import 'package:flutter/material.dart';
import 'package:flutter_note_app/constants.dart';

class WriteNoteScreen extends StatefulWidget {
  @override
  _WriteNoteScreenState createState() => _WriteNoteScreenState();
}

class _WriteNoteScreenState extends State<WriteNoteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Write your note."), backgroundColor: buttonColor,),
      body: Container(color: Colors.white,
      child: TextField(),),
    );
  }
}
