import 'package:flutter/material.dart';

class Cus_Text extends StatelessWidget {
  Cus_Text(
      {required this.text,
      required this.size,
      required this.color,
      this.fontWeight,
      this.letterSpacing,
      this.textAlign});

  FontWeight? fontWeight;
  String text;
  double size;
  Color color = Color(0xFF0E0F12);
  double? letterSpacing;
  TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
          fontSize: size,
          fontWeight: fontWeight,
          color: color,
          letterSpacing: letterSpacing,
        ),
        textAlign: textAlign);
  }
}
