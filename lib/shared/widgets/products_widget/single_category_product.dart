import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/models/product_model.dart';
import 'package:restaurant/shared/api/config.dart';
import '../../colors.dart';

class SingleCategoryProduct extends StatelessWidget {
  final ProductModel product;
  final Function onTapFunction;

  SingleCategoryProduct(
      {
        this.product,
      this.onTapFunction,
      });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapFunction,
      child: Container(
        margin: EdgeInsets.all(5.0),
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.grey.shade100,
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(
                right: 8.0,
              ),
              height: 100.0,
              width: 100.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child:  CachedNetworkImage(
                imageUrl: imageProduct + product.productImage,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
                fit: BoxFit.cover,
                height: 350.0,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            Expanded(
              child: Container(
                width: 100.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.productName,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    RichText(
                      overflow: TextOverflow.clip,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: product.productDescription,
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 100.0,
              width: 50.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.favorite_border),
                  checkOffer(product.productOffer),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget checkOffer(int productOffer) {
    return productOffer == 1
        ? Container(
          height: 30.0,
          alignment: Alignment.center,
            padding: EdgeInsets.only(left: 5.0, right: 5.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: primaryColor,
            ),
            child: Text(
              "Offer",
              style: TextStyle(
                color: Colors.white,
              ),
            ))
        : Text("");
  }
}
