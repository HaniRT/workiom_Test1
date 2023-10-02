import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workiom_test1/components/cus_text.dart';
import 'package:workiom_test1/const/color.dart';

class CusBottom extends StatelessWidget {
  const CusBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Cus_Text(
            text: "Stay organized with",
            size: 15,
            color: kGrey,
            fontWeight: FontWeight.w400),
        const SizedBox(width: 8),
        Image.asset('assets/workiom_logo_clr.png',
            width: 23.25149, height: 15.49969),
        Image.asset('assets/workiom_text.png',
            width: 69.75, height: 31),
      ],
    );
  }
}
