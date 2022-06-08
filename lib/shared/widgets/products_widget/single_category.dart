import 'package:flutter/material.dart';
import 'package:restaurant/models/category_model.dart';


class SingleCategory extends StatelessWidget {
  final CategoryModel category;

  SingleCategory({this.category});

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
            child: Image.asset(category.categoryImage),
          ),
          Text(
            category.categoryName,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
