


import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class CustonSnack{
  static flusbarsnackbar({
    required BuildContext context,
    required String title,
    required String message,
    Color?color
}){
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Flushbar(
      title: title,
      message: message,
      backgroundColor: color??Colors.green,
    )));
}
}