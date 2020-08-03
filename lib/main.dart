import 'package:flutter/material.dart';
import 'package:flutter_note_app/ui/screens/notes_list_screen.dart';
import 'ui/screens/no_notes_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Caveat", backgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      title: "Malusa - Note taking App",
      home: NotesListScreen(),
    );
  }
}
