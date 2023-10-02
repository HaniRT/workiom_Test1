import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workiom_test1/components/cus_text.dart';
import 'package:workiom_test1/const/color.dart';

class Cus_Button extends StatelessWidget {
  Cus_Button(
      {super.key,
      required this.text,
      required this.color,
      required this.textColor,
      required this.onTap});

  VoidCallback onTap;
  final String text;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(width: double.infinity,
      height: 50,color: Colors.green,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Cus_Text(text: text, size: 15, color: textColor),
            Image.asset(
              'assets/enter.png',
              height: 16,
              width: 16,
            )
          ],
        ),
      ),
    );
  }
}
