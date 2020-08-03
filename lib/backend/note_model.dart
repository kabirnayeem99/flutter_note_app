import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Note {
  String title;
  String noteBody;
  int id;

  Note({
    @required this.title,
    @required this.noteBody,
    @required this.id,
  });

  Map toMap() {
    /*
    This function will get the data from the textfield
    and will turn it into a map to submit it later to the db.
     */
    var map = Map<String, dynamic>();
    map["title"] = this.title;
    map["noteBody"] = this.noteBody;
    return map;
  }

  Note.fromMap(Map<String, dynamic> mapData) {
    /*
    To show it in the ui, I need to take the db map and turn it
    into widgets.
     */
    this.title = mapData["title"];
    this.noteBody = mapData["noteBody"];
    this.id = mapData["id"];
  }
}
