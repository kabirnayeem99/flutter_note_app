import 'package:flutter/material.dart';
import 'package:flutter_note_app/backend/database_helper.dart';
import 'package:flutter_note_app/ui/screens/initial_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final DatabaseHelper databaseHelper = DatabaseHelper();
  @override
  Widget build(BuildContext context) {
    databaseHelper.initialiseDatabase();
    return MaterialApp(
      theme: ThemeData(fontFamily: "Caveat", backgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      title: "Malusa - Note taking App",
      home: InitialScreen(),
    );
  }
}
