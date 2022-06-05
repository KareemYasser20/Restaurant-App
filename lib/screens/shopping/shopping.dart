import 'package:flutter/material.dart';
import 'package:restaurant/screens/home/home_screen.dart';
import 'package:restaurant/screens/orders/tracking_order.dart';
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
  void _showSheetMessage(BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight:Radius.circular(25.0),
        )
      ),
      builder: (BuildContext bc) {
        return Container(
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 30.0 , bottom: 30.0),
                    child: Image(
                      width: 150.0,
                      height: 150.0,
                      image: AssetImage('images/check_icon.png' ,),
                    
                      ),
                  ),
                  Text(
                    'Thank you for your order.',
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 20.0,),
                  Text(
                    'You can track the delivery through the button at the bottom.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16.0,
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top:40.0 ),
                    child: MaterialButton(
                      child: Container(
                        margin: EdgeInsets.only(top:15.0, right: 15.0, left: 15.0),
                        width: MediaQuery.of(context).size.width,
                        height: 50.0,
                        child: Center(
                          child: Text(
                            'Track my order',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(25.0),

                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, TrackingOrder.id);
                      },
                    ),
                  ),


                    Padding(
                    padding: EdgeInsets.only(top:3.0 ),
                    child: MaterialButton(
                      child: Container(
                        margin: EdgeInsets.all(15.0),
                        width: MediaQuery.of(context).size.width,
                        height: 50.0,
                        child: Center(
                          child: Text(
                            'Order something else',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25.0,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(25.0),

                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, HomeScreen.id);
                      },
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      },
      context: context,
    );
  }

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
              margin: EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0),
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
                onTap: () {
                  _showSheetMessage(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
