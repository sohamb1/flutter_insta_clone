import 'package:feedup/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToastMessage(String message) {
  Fluttertoast.showToast(
    backgroundColor: color_toast_green,
    textColor: Colors.white,
    fontSize: 17,
    gravity: ToastGravity.BOTTOM,
    msg: message,
    toastLength: Toast.LENGTH_LONG,
  );
}

double getDynamicWidthSize(BuildContext context, double size) {
  return MediaQuery.of(context).size.width * size;
}

double getDynamicHeightSize(BuildContext context, double size) {
  return MediaQuery.of(context).size.height * size;
}