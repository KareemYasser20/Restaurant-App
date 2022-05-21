import 'package:flutter/material.dart';
import 'package:restaurant/screens/product/product_deatils.dart';
import 'package:restaurant/shared/colors.dart';
import 'package:restaurant/shared/constant.dart';

class FavoriteScreen extends StatefulWidget {
  static const String id = 'Favorite_screen';

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: Text(
          "Favorites",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {Navigator.pop(context);},
        ),
      ),
      body: Container(
        child: GridView.builder(
          itemCount: productList.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8
                ),
          itemBuilder: (context, index) {
            return SingleFavoriteProduct(
              productId: productList[index]["productId"],
              productName: productList[index]["productName"],
              productImage: productList[index]["productImage"],
              productPrice: productList[index]["ProductPrice"],
              productDescription: productList[index]["productDescription"],
              productRate: productList[index]["ProductRate"],
              onTapFunction: () {
                Navigator.pushNamed(context, ProductDeatils.id,
                    arguments: ProductDeatils(
                      productId: productList[index]["productId"],
                      productName: productList[index]["productName"],
                      productDescription: productList[index]
                          ["productDescription"],
                      productIamge: productList[index]["productImage"],
                      productPrice: productList[index]["ProductPrice"],
                    ));
              },
            );
          },
        ),
      ),
    );
  }
}

class SingleFavoriteProduct extends StatelessWidget {
  final String productId;
  final String productName;
  final String productDescription;
  final String productImage;
  final int productPrice;
  final Function onTapFunction;
  final String productRate;

  SingleFavoriteProduct(
      {this.productId,
      this.productName,
      this.productRate,
      this.productDescription,
      this.onTapFunction,
      this.productPrice,
      this.productImage});

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
                  image: AssetImage(productImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Expanded(
              child: Text(
                productName,
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
                  "${productPrice.toString()} \$",
                ),
                Expanded(
                  child: Text(""),
                ),
                Text(productRate),
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
