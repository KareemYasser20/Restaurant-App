import 'package:flutter/material.dart';
import '../../colors.dart';

class SingleTip extends StatelessWidget {
  final String title;
  final String info;
  final String image;

  SingleTip({this.title, this.info, this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            alignment: Alignment.center,
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            title,
            style: TextStyle(
              color: primaryColor,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 60.0),
          child: Text(
            info,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 18.0,
            ),
          ),
        )
      ],
    );
  }
}
