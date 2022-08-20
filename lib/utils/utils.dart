
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class Utils {

  static toast(String message, {bool isError = false}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 3,
        backgroundColor: isError ? Colors.red.shade300 : Colors.green.shade300,
        textColor: isError ? Colors.white : Colors.black,
        fontSize: 16.0);
  }


}