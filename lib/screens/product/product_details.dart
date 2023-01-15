import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/models/product_model.dart';
import 'package:restaurant/provider/cart.dart';
import 'package:restaurant/screens/shopping/shopping.dart';
import 'package:restaurant/shared/colors.dart';
import 'package:restaurant/shared/widgets/products_widget/details_screen_image.dart';
import 'package:restaurant/shared/widgets/products_widget/details_screen_header.dart';

class ProductDetails extends StatefulWidget {
  static const String id = 'productDetails_screen';
  final ProductModel product;

  ProductDetails(
      {this.product});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments as ProductDetails;
    var myProvid = Provider.of<Cart>(context);
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          ListView(
            children: [
              DetailsImageWidget(
                prod: args.product,
                myProvide: myProvid,

              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      args.product.productName,
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
                      args.product.productDescription,
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
            child: DetailsHeader(prov: myProvid,),
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
              "${args.product.productPrice.toString()}\$",
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

