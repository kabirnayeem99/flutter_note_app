import 'package:flutter/material.dart';
import 'package:flutter_note_app/constants.dart';

class WriteNoteField extends StatelessWidget {
  const WriteNoteField({
    Key key,
    @required this.hint,
    @required this.size,
    this.flex,
    this.maxChar,
    this.fontWeight,
  }) : super(key: key);

  final String hint;
  final double size;
  final int flex;
  final int maxChar;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(
        color: Colors.white,
        child: TextField(
          maxLength: maxChar,
          style: TextStyle(
            fontWeight: fontWeight,
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
