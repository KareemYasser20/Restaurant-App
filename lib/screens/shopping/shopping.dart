import 'package:flutter/material.dart';
import 'package:restaurant/shared/colors.dart';
import 'package:restaurant/shared/constant.dart';
import 'package:restaurant/shared/widgets/shopping_screen_header.dart';
import 'package:restaurant/shared/widgets/single_shopping_product.dart';

class ShoppingScreen extends StatefulWidget {
  static const String id = 'Shopping_screen';
  final String productId;
  final String productName;
  final String productDescription;
  final String productIamge;
  final int productPrice;

  ShoppingScreen(
      {this.productId,
      this.productName,
      this.productDescription,
      this.productIamge,
      this.productPrice});

  @override
  State<ShoppingScreen> createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> {
  @override
  Widget build(BuildContext context) {
    //  final args = ModalRoute.of(context).settings.arguments as ShoppingScreen;
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 60.0),
            child: ListView.builder(
              itemCount: shoppingProduct.length,
              itemBuilder: (context, index) {
                return SingleShoppingProduct(
                  productId: shoppingProduct[index]["productId"],
                  productName: shoppingProduct[index]["productName"],
                  productPrice: shoppingProduct[index]["productPrice"],
                  productQuantity: shoppingProduct[index]["productQuantity"],
                  productImage: shoppingProduct[index]["productImage"],
                );
              },
            ),
          ),
          Positioned(
            top: 0.0,
            right: 0.0,
            left: 0.0,
            height: 135.0,
            child: ShoppingHeader(),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 190.0,
        alignment: Alignment.center,
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("Items Subtotal : "),
                        Expanded(
                          child: Text(""),
                        ),
                        Text("200 \$"),
                      ],
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                    Row(
                      children: [
                        Text("Delivery : "),
                        Expanded(
                          child: Text(""),
                        ),
                        Text("200 \$"),
                      ],
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                    Row(
                      children: [
                        Text("Total : "),
                        Expanded(
                          child: Text(""),
                        ),
                        Text("200 \$"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(
                  top: 10.0, left: 5.0, right: 5.0),
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
              height: 50.0,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: GestureDetector(
                child: Text(
                  "Confirm Your order",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

