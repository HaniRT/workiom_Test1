import 'package:flutter/material.dart';
import 'package:workiom_test1/const/color.dart';
class CustomProgressBar extends StatelessWidget {
  const CustomProgressBar({
    required this.value,
  });

  final double value;

  @override
  Widget build(BuildContext context) {
    Color getColor(double value) {
      if (value == 1.0) {
        return kGreen;
      } else {
        return kYellow;
      }
    }

    return LinearProgressIndicator(
      minHeight: 7,
      value: value,
      backgroundColor: Colors.grey,
      valueColor: AlwaysStoppedAnimation<Color>(getColor(value)),
    );
  }
}
