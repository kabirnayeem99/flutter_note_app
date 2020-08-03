import 'package:flutter/material.dart';
import 'package:flutter_note_app/constants.dart';

class LogoImageTitle extends StatelessWidget {
  const LogoImageTitle({
    Key key, this.height, this.width
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "logoImage",
      child: Container(
        height: height,
        width: width,
        child: Image.asset(logoImage),
      ),
    );
  }
}
