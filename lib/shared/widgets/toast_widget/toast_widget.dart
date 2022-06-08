import 'package:flutter/material.dart';

Widget toastWidget({String message, IconData toastIcon}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
      color: Colors.grey[350],
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(toastIcon),
        SizedBox(
          width: 10.0,
        ),
        Text(message),
      ],
    ),
  );
}
