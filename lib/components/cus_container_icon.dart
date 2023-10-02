import 'package:flutter/material.dart';
import 'package:workiom_test1/components/cus_text.dart';

class Cus_Container_Icon extends StatelessWidget {
  Cus_Container_Icon({required this.text,required this.onTap, required this.color, required this.textColor});

  VoidCallback onTap;
  String text;
  Color color;
  Color textColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: color,
        ),
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
        padding: const EdgeInsets.only(left: 100, top: 15, right: 16, bottom: 14),
        width: double.infinity,
        height: 50,
      ),
    );
  }
}
