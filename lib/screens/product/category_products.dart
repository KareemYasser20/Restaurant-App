import 'package:flutter/material.dart';
import 'package:restaurant/screens/product/product_details.dart';
import 'package:restaurant/shared/colors.dart';
import 'package:restaurant/shared/constant.dart';

class Products extends StatefulWidget {
  final Map<String, String> productData;

  Products({this.productData});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.productData["subCategoryName"],
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
        child: ListView.builder(
          itemCount: productList.length,
          itemBuilder: (context, index) {
            return SingleProduct(
                productId: productList[index]["productId"],
                productOffer: productList[index]["ProductOffer"],
                productName: productList[index]["productName"],
                productDescription: productList[index]["productDescription"],
                productImage: productList[index]["productImage"],
                onTapFunction: () {
                  Navigator.pushNamed(context, ProductDetails.id,
                      arguments: ProductDetails(
                        productId: productList[index]["productId"],
                        productName: productList[index]["productName"],
                        productDescription: productList[index]
                            ["productDescription"],
                        productImage: productList[index]["productImage"],
                        productPrice: productList[index]["ProductPrice"],
                      ));
                });
          },
        ),
      ),
    );
  }
}

class SingleProduct extends StatelessWidget {
  final String productId;
  final String productName;
  final String productDescription;
  final String productImage;
  final int productPrice;
  final Function onTapFunction;
  final String productOffer;

  SingleProduct(
      {this.productId,
      this.productName,
      this.productDescription,
      this.onTapFunction,
      this.productPrice,
      this.productOffer,
      this.productImage});

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
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(productImage),
                ),
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
                      productName,
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
                            text: productDescription,
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Text("Burger Queen description of food and what is contain.",
                    // style: TextStyle(
                    //   fontSize: 16.0,
                    //   color: Colors.grey,
                    // ),
                    // ),
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
                  checkOffer(productOffer),

                  // Container(
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(25.0),
                  //     color: primaryColor,

                  //   ),
                  //   child: Text(
                  //     productOffer,
                  //     style: TextStyle(
                  //       color: Colors.white,
                  //     ),
                  //     )
                  //   ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget checkOffer(String productOffer) {
    return productOffer == "1"
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
