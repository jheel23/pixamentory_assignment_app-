import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget addVerticalSpace(double height) {
  return SizedBox(height: height);
}

Widget addHorizontalSpace(double width) {
  return SizedBox(width: width);
}

void showDevToast() {
  Fluttertoast.showToast(
    msg: 'Feature is under Development!',
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.black,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

late ThemeData theme;
late double deviceHeight;
late double deviceWidth;
