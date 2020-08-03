import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_note_app/constants.dart';
import 'package:flutter_note_app/ui/widgets/logo_image_title.dart';

class WriteNoteScreen extends StatefulWidget {
  @override
  _WriteNoteScreenState createState() => _WriteNoteScreenState();
}

class _WriteNoteScreenState extends State<WriteNoteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_left,
            color: navigationIconColor,
          ),
          iconSize: titleFontSize,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: LogoImageTitle(
          height: 23,
          width: 23,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.delete_outline,
              size: 27,
              color: navigationIconColor,
            ),
            onPressed: () => {},
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          WriteNoteField(
            hint: "Title",
            size: titleFontSize,
            flex: 1,
          ),
          WriteNoteField(
            hint: "Your note goes here...",
            size: normalFontSize,
            flex: 4,
          ),
        ],
      ),
    );
  }
}

class WriteNoteField extends StatelessWidget {
  const WriteNoteField({
    Key key,
    @required this.hint,
    @required this.size,
    this.flex,
  }) : super(key: key);

  final String hint;
  final double size;
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(
        color: Colors.white,
        child: TextField(
          style: TextStyle(
            color: typedTextColor,
            fontSize: size,
          ),
          cursorColor: cursorColor,
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 24.0,
            ),
            hintText: hint,
            hintStyle: TextStyle(
              color: hintTextColor,
              fontSize: size,
            ),
          ),
          maxLines: null,
        ),
      ),
    );
  }
}
