import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_note_app/constants.dart';
import 'package:flutter_note_app/ui/screens/write_note_screen.dart';

class NoNotesScreen extends StatelessWidget {
  const NoNotesScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 200,
              width: 150,
              child: Image.asset(logoImage),
            ),
            Center(
              child: Text(
                "No notes !",
                style: TextStyle(
                  color: infoTextColor,
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Center(
              child: Text(
                "You can try writing the first note.",
                style: TextStyle(
                  color: infoTextColor,
                  fontSize: subTitleFontSize,
                ),
              ),
            ),
            RaisedButton(
              padding: EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 24.0,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Text(
                "Create Note",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: normalFontSize,
                ),
              ),
              color: buttonColor,
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WriteNoteScreen(),
                  ),
                ),
              },
            ),
          ],
        ),
      ),
    );
  }
}
