import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:workiom_test1/const/color.dart';

AppBar cus_appbar(onPressed) {
  return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leadingWidth: 45,
      leading: IconButton(
        onPressed: onPressed,
        icon: Icon(
          Icons.arrow_back_ios_rounded,
          color: kAppbarBlue,
        ),
      ));
}
