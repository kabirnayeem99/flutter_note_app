import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ui/screens/no_notes_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Caveat"),
      debugShowCheckedModeBanner: false,
      title: "Malusa - Note taking App",
      home: NoNotesScreen(),
    );
  }
}
