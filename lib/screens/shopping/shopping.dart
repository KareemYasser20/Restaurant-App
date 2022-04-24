import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:restaurant/shared/colors.dart';

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
            child: DettilsHeader(),
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

class DettilsHeader extends StatelessWidget {
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
        ],
      ),
    );
  }
}

var shoppingProduct = [
  {
    "productId": "1",
    "productName": "juice",
    "productPrice": 100,
    "productQuantity": "2",
    "productImage": "images/product/burger.jpg",
  },
  {
    "productId": "2",
    "productName": "burger",
    "productPrice": 100,
    "productQuantity": "2",
    "productImage": "images/product/burger.jpg",
  },
  {
    "productId": "3",
    "productName": "Pizza",
    "productPrice": 100,
    "productQuantity": "2",
    "productImage": "images/product/burger.jpg",
  },
  {
    "productId": "4",
    "productName": "happy meal",
    "productPrice": 100,
    "productQuantity": "2",
    "productImage": "images/product/burger.jpg",
  },
  {
    "productId": "5",
    "productName": "fish",
    "productPrice": 100,
    "productQuantity": "2",
    "productImage": "images/product/burger.jpg",
  },
  {
    "productId": "5",
    "productName": "fish",
    "productPrice": 100,
    "productQuantity": "2",
    "productImage": "images/product/burger.jpg",
  },
  {
    "productId": "5",
    "productName": "fish",
    "productPrice": 100,
    "productQuantity": "2",
    "productImage": "images/product/burger.jpg",
  },
];

class SingleShoppingProduct extends StatelessWidget {
  final String productId;
  final String productName;
  final int productPrice;
  final String productQuantity;
  final String productImage;

  SingleShoppingProduct(
      {this.productId,
      this.productName,
      this.productPrice,
      this.productQuantity,
      this.productImage});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: Icon(
              Icons.cancel,
              color: primaryColor,
            ),
          ),
          Container(
            child: ListTile(
              title: Text(
                productName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              subtitle: Text(
                productPrice.toString(),
                style: TextStyle(),
              ),
              leading: Container(
                width: 50.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(productImage),
                    fit: BoxFit.cover,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
              trailing: Container(
                width: 70.0,
                child: Row(
                  children: [
                    GestureDetector(
                      child: Container(
                        padding: EdgeInsets.all(5.0),
                        child: FaIcon(
                          FontAwesomeIcons.plus,
                          color: Colors.white,
                          size: 18.0,
                        ),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        productQuantity,
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        padding: EdgeInsets.all(5.0),
                        child: FaIcon(
                          FontAwesomeIcons.minus,
                          color: Colors.white,
                          size: 18.0,
                        ),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
