import 'package:flutter/material.dart';
import 'package:restaurant/screens/shopping/shopping.dart';
import '../colors.dart';

class DetailsHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade100,
                  spreadRadius: 1.0,
                  blurRadius: 1.0,
                  offset: Offset(0, 1),
                )
              ],
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: primaryColor,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Expanded(
            child: Text(""),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade100,
                  spreadRadius: 1.0,
                  blurRadius: 1.0,
                  offset: Offset(0, 1),
                )
              ],
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: primaryColor,
              ),
              onPressed: () {
                Navigator.pushNamed(context, ShoppingScreen.id);
              },
            ),
          ),
        ],
      ),
    );
  }
}
