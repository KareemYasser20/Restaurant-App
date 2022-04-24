import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:restaurant/screens/shopping/shopping.dart';
import 'package:restaurant/shared/colors.dart';

class ProductDeatils extends StatefulWidget {
  static const String id = 'productDeatils_screen';
  final String productId;
  final String productName;
  final String productDescription;
  final String productIamge;
  final int productPrice;

  ProductDeatils(
      {this.productId,
      this.productName,
      this.productDescription,
      this.productIamge,
      this.productPrice});

  @override
  State<ProductDeatils> createState() => _ProductDeatilsState();
}

class _ProductDeatilsState extends State<ProductDeatils> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments as ProductDeatils;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          ListView(
            children: [
              DeatilsImageWidget(
                image: args.productIamge,
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
            child: DettilsHeader(),
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

class DeatilsImageWidget extends StatefulWidget {
  final String image;
  DeatilsImageWidget({@required this.image});

  @override
  _DeatilsImageWidgetState createState() => _DeatilsImageWidgetState();
}

class _DeatilsImageWidgetState extends State<DeatilsImageWidget> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10.0, top: 0.0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade100,
            spreadRadius: 1.0,
            offset: Offset(0, 1),
          )
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50.0),
          bottomRight: Radius.circular(50.0),
        ),
      ),
      child: Column(
        children: [
          Image.asset(
            widget.image,
            height: 350.0,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: EdgeInsets.only(top: 25.0),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: primaryColor,
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
                  icon: FaIcon(
                    FontAwesomeIcons.minus,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      counter--;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  counter.toString(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.0,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: primaryColor,
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
                  icon: FaIcon(
                    FontAwesomeIcons.plus,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      counter++;
                    });
                  },
                ),
              ),
            ],
          ),
        ],
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
