import 'package:flutter/material.dart';
import 'package:restaurant/models/product_model.dart';
import '../../colors.dart';

class SingleFavoriteProduct extends StatelessWidget {
  final ProductModel productModel;
  final Function onTapFunction;

  SingleFavoriteProduct({
    this.productModel,
    this.onTapFunction,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapFunction,
      child: Container(
        margin: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
        ),
        padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                alignment: Alignment.topRight,
                child: Icon(
                  Icons.favorite,
                  color: primaryColor,
                )),
            Container(
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.width / 2 - 75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: AssetImage(productModel.productImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Expanded(
              child: Text(
                productModel.productName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),
            SizedBox(
              height: 4.0,
            ),
            Row(
              children: [
                Text(
                  "${productModel.productPrice.toString()} \$",
                ),
                Expanded(
                  child: Text(""),
                ),
                Text(productModel.productRate.toString()),
                Icon(
                  Icons.star_border,
                  color: Colors.yellow,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
