import 'package:flutter/material.dart';
import 'package:restaurant/models/product_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:restaurant/shared/api/config.dart';

class SingleHomeProduct extends StatelessWidget {
  final ProductModel product;
  final Function onTapFunction;

  SingleHomeProduct(
      {
      this.product,
      this.onTapFunction,
      });

  final String imageProduct = imagesPath + "products/";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapFunction,
      child: Container(
        padding: EdgeInsets.only(left: 5.0, right: 5.0, bottom: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                // image: DecorationImage(
                //   // image: ,
                //   // AssetImage(product.productImage),
                //   fit: BoxFit.cover,
                // ),
              ),
              child: product.productImage == null ? Text("") 
              : CachedNetworkImage(
                imageUrl: imageProduct + product.productImage,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              product.productName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            SizedBox(
              height: 4.0,
            ),
            Text(
              product.productDescription ,
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
