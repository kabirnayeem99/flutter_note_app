import 'package:flutter/material.dart';
import 'package:flutter_note_app/backend/database_helper.dart';
import 'package:flutter_note_app/ui/screens/no_notes_screen.dart';
import 'package:flutter_note_app/ui/screens/notes_list_screen.dart';
import 'package:sqflite/sqflite.dart';

class InitialScreen extends StatefulWidget {
  InitialScreen({Key key}) : super(key: key);

  @override
  _InitialScreenState createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  DatabaseHelper _databaseHelper = DatabaseHelper();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: decideTheNextScreen(),
    );
  }

  Widget decideTheNextScreen() {
    return FutureBuilder(
      future: _databaseHelper.getCount(),
      builder: (context, snapshot) {
        Widget returnScreen =
            (snapshot.data != 0) ? NotesListScreen() : NoNotesScreen();
        print(snapshot.hasError);

        return returnScreen;
      },
    );
  }
}
