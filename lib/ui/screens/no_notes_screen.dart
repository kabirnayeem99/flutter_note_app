import 'package:flutter/material.dart';
import 'package:flutter_note_app/backend/note_model.dart';
import 'package:flutter_note_app/constants.dart';
import 'package:flutter_note_app/ui/screens/write_note_screen.dart';
import 'package:flutter_note_app/ui/widgets/logo_image_title.dart';

class NoNotesScreen extends StatelessWidget {
  const NoNotesScreen({
    Key key,
  }) : super(key: key);

  navigateToWriteScreen(Note note, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WriteNoteScreen(note),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            LogoImageTitle(
              height: 200,
              width: 150,
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
              onPressed: () => {navigateToWriteScreen(Note("", ""), context)},
            ),
          ],
        ),
      ),
    );
  }
}
