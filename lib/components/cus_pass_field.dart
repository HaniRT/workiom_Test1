import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workiom_test1/components/cus_text.dart';
import 'package:workiom_test1/const/color.dart';

class Cus_Pass extends StatefulWidget {
  Cus_Pass(
      {super.key,
      required this.label,
      this.controller,
      required this.onChanged,
      required this.obscureText,
      this.suffixIcon,
      required this.preffix,
      this.suffixText,
       this.hintText});

  final TextEditingController? controller;
  final Function(String) onChanged;
  final String label;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget preffix;
  final String? suffixText;
  final String? hintText;

  @override
  State<Cus_Pass> createState() => _Cus_PassState();
}

class _Cus_PassState extends State<Cus_Pass> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 68,
      child: Stack(children: [
        Positioned(
          top: 35,
          child: widget.preffix,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Cus_Text(
              text: widget.label,
              size: 15,
              color: kBlack,
              fontWeight: FontWeight.w400,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: TextField(
                cursorColor: kGrey,
                onChanged: widget.onChanged,
                obscureText: widget.obscureText,
                controller: widget.controller,
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  suffixText: widget.suffixText,
                  suffixIcon: widget.suffixIcon,
                  focusColor: Colors.grey,
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
