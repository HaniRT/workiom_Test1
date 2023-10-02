import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workiom_test1/components/cus_text.dart';
import 'package:workiom_test1/const/color.dart';

class CusUpper extends StatelessWidget {
  CusUpper(
      {super.key,
      required this.height,
      required this.width,
      required this.firstText,
      required this.secondText});

  final double width;
  final double height;
  final String firstText;
  final String secondText;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Cus_Text(
            text: firstText,
            size: 22,
            color: kBlack,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.35,
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Cus_Text(
                text: secondText,
                size: 17,
                color: kGrey,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(width: 8),
              Image.asset(
                'assets/waving.png',
                width: width,
                height: height,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
