import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Note {
  String _title;
  String _noteBody;
  int _id;

  Note(
    this._title,
    this._noteBody,
  );

  Note.withId(
   this._title,
    this._noteBody,
    this._id,
  );

  /*
  Getters and setters are used to protect your data, particularly when creating
  classes. For each instance variable, a getter method returns its value while
  a setter method sets or updates its value. Given this, getters and setters are
   also known as accessors and mutator, respectively.
   */

  int get id => _id;
  String get title => _title;
  String get noteBody => _noteBody;

  set title(String newTitle) {
    /*
    By using the this method, I can be sure the value of number of character
    below 20. This is much better than updating the number
    variable directly
     */
    if(newTitle.length >=  20) {
      this._title = newTitle;
    }
  }

  set noteBody(String updatedBody) {
    if(updatedBody.length != 0 && updatedBody.length >= 255){
      this._noteBody = updatedBody;
    }
  }

  Map toMap() {
    /*
    This function will get the data from the textfield
    and will turn it into a map to submit it later to the db.
     */
    var map = Map<String, dynamic>();
    if (id != null) {
      map["id"] = this._id;
    }
    map["title"] = this._title;
    map["note_body"] = this._noteBody;
    return map;
  }

  Note.fromMap(Map<String, dynamic> mapData) {
    /*
    To show it in the ui, I need to take the db map and turn it
    into widgets.
     */
    this._title = mapData["title"];
    this._noteBody = mapData["noteBody"];
    this._id = mapData["id"];
  }
}
