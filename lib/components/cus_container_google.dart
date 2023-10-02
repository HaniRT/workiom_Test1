import 'package:flutter/material.dart';
import 'package:workiom_test1/components/cus_text.dart';
import 'package:workiom_test1/const/color.dart';

class Cus_Container extends StatelessWidget {
  Cus_Container({required this.text, required this.color,});

  String text;
  Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: color,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(
            'assets/icons_google.png',
            width: 16,
            height: 16,
          ),
          Cus_Text(
            text: text,
            size: 15,
            color: kBlack,
            fontWeight: FontWeight.bold,
          )
        ],
      ),
      padding: const EdgeInsets.only(left: 85, top: 14, bottom: 15, right: 85),
      alignment: Alignment.center,
      width: double.infinity,
      height: 50,
    );
  }
}
