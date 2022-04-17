import 'package:flutter/material.dart';


class SingleCategory extends StatelessWidget {
  final String catId;
  final String catName;
  final String catImage;

  SingleCategory({this.catId, this.catName, this.catImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 8.0 ,left: 8.0),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.red.shade100),
            child: Image.asset(catImage),
          ),
          Text(
            catName,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
