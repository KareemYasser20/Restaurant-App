import 'package:flutter/material.dart';

class SingleProduct extends StatelessWidget {
  final String productId;
  final String productName;
  final String productDescription;
  final String productImage;
  final int productPrice;
  final Function onTapFunction;

  SingleProduct(
      {this.productId,
      this.productName,
      this.productDescription,
      this.onTapFunction,
      this.productPrice,
      this.productImage});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapFunction,
      child: Container(
        padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: AssetImage(productImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              productName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            SizedBox(
              height: 4.0,
            ),
            Text(
              productDescription ,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
