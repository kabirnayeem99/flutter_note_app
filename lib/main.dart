import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Caveat"),
      debugShowCheckedModeBanner: false,
      title: "Malusa - Note taking App",
      home: Scaffold(
        body: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  height: 200,
                  width: 150,
                  child: Image.asset("assets/images/notepad.png")),
              Center(
                child: Text(
                  "No notes !",
                  style: TextStyle(
                    color: Color(0xffB02E65),
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Center(
                child: Text(
                  "You can try writing the first note.",
                  style: TextStyle(color: Color(0xffB02E65), fontSize: 24),
                ),
              ),
              RaisedButton(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: Text(
                  "Create Note",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                color: Color(0xffDC854D),
                onPressed: () => {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
