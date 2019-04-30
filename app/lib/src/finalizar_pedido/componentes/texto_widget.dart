import 'package:flutter/material.dart';

class TextoWidget extends StatelessWidget {
  String texto;
  double fontSize;
  Color color;

  TextoWidget({this.texto, this.fontSize, this.color}) {
    fontSize = (fontSize == null) ? 30 : fontSize;
    color = (color == null) ? Colors.white : color;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 5),
      child: Text(
        texto,
        style: TextStyle(color: color, fontSize: fontSize),
        textAlign: TextAlign.center,
      ),
    );
  }
}
