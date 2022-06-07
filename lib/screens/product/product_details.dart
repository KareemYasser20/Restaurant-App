import 'package:flutter/material.dart';
import 'package:restaurant/screens/shopping/shopping.dart';
import 'package:restaurant/shared/colors.dart';
import 'package:restaurant/shared/widgets/details_screen_image.dart';
import 'package:restaurant/shared/widgets/details_screen_header.dart';

class ProductDetails extends StatefulWidget {
  static const String id = 'productDetails_screen';
  final String productId;
  final String productName;
  final String productDescription;
  final String productImage;
  final int productPrice;

  ProductDetails(
      {this.productId,
      this.productName,
      this.productDescription,
      this.productImage,
      this.productPrice});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments as ProductDetails;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          ListView(
            children: [
              DetailsImageWidget(
                image: args.productImage,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      args.productName,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      args.productDescription,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Positioned(
            top: 0.0,
            right: 0.0,
            left: 0.0,
            height: 135.0,
            child: DetailsHeader(),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 75.0,
        margin: EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0, bottom: 20.0),
        padding: EdgeInsets.only(left: 20.0, right: 30.0),
        decoration: BoxDecoration(
          color: primaryColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade100,
              spreadRadius: 7.0,
              blurRadius: 4.0,
              offset: Offset(0, 3),
            )
          ],
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: Row(
          children: [
            Text(
              "${args.productPrice}\$",
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: Text(""),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, ShoppingScreen.id);
              },
              child: Container(
                padding: EdgeInsets.only(
                    top: 15.0, left: 25.0, right: 25.0, bottom: 15.0),
                decoration: BoxDecoration(
                  color: Colors.blueGrey.shade50,
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: Row(
                  children: [
                    Container(
                      child: Icon(
                        Icons.shopping_bag,
                        color: primaryColor,
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Container(
                      child: Text(
                        'Add to cart',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

