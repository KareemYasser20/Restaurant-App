import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class Utils {
  static void showSnackBar(BuildContext context, String message){ 
    final scaffold = Scaffold.of(context);
      scaffold
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(content: Text(message)),
        );
  }
  static  void showInfoFlushbar(BuildContext context) {
    Flushbar(
      title: 'This action is prohibited',
      message: 'Lorem ipsum dolor sit amet',
      icon: Icon(
        Icons.info_outline,
        size: 28,
        color: Colors.blue.shade300,
      ),
      leftBarIndicatorColor: Colors.blue.shade300,
      duration: Duration(seconds: 60),
    )..show(context);
  }
}