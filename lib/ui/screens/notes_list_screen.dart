import 'package:flutter/material.dart';
import 'package:flutter_note_app/constants.dart';
import 'package:flutter_note_app/ui/widgets/logo_image_title.dart';
import 'package:flutter_note_app/ui/widgets/notes_list_tile.dart';

class NotesListScreen extends StatefulWidget {
  @override
  _NotesListScreenState createState() => _NotesListScreenState();
}

class _NotesListScreenState extends State<NotesListScreen> {
  @override
  Widget build(BuildContext context) {
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
            onPressed: () => {},
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
          onPressed: () {},
        ),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: ListView(
            padding: const EdgeInsets.all(8),
            children: <Widget>[
              NoteListTile(),
              NoteListTile(),
              NoteListTile(),
              NoteListTile(),
              NoteListTile(),
              NoteListTile(),
              NoteListTile(),
              NoteListTile(),
            ],
          ),
        ),
      ),
    );
  }
}
