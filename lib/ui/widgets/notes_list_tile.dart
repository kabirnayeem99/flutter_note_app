import 'package:flutter/material.dart';
import 'package:flutter_note_app/constants.dart';

class NoteListTile extends StatelessWidget {
  const NoteListTile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key("who"),
      onDismissed: (direction) {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text("done", style: TextStyle(color: hintTextColor),),
            backgroundColor: Colors.white,
          ),
        );
        // Remove the item from the data source.
      },
      child: Container(
        color: Colors.white,
        child: ListTile(
          title: Text(
            "Title",
            style: TextStyle(color: typedTextColor, fontSize: 24),
          ),
          subtitle: Text(
            "Subtitle of the note",
            style: TextStyle(color: hintTextColor, fontSize: 20),
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.delete_outline,
              color: hintTextColor,
            ),
            iconSize: 20,
            onPressed: () => {},
          ),
        ),
      ),
    );
  }
}
