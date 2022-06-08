import 'package:flutter/material.dart';
import 'package:restaurant/screens/product/product_details.dart';
import 'package:restaurant/screens/product/category_products_screen.dart';
import 'package:restaurant/shared/colors.dart';
import 'package:restaurant/shared/constant.dart';
import 'package:restaurant/shared/widgets/products_widget/single_category.dart';
import 'package:restaurant/shared/widgets/products_widget/single_home_product.dart';

class RestaurantScreen extends StatefulWidget {
  static const String id = 'restaurant_screen';

  final GlobalKey<ScaffoldState> drawer;

  RestaurantScreen({this.drawer});

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  TextEditingController searchController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          Container(
            alignment: Alignment.bottomLeft,
            margin: EdgeInsets.only(top: 45.0),
            padding: EdgeInsets.only(left: 15.0),
            child: Text(
              'Delivering to',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 15.0),
                child: Text(
                  'Current location',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.black,
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: primaryColor,
                ),
                onPressed: () {
                  // TODO: Get Current Location here
                },
              )
            ],
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: TextFormField(
                      controller: searchController,
                      autocorrect: true,
                      style: TextStyle(color: Colors.black),
                      cursorColor: primaryColor,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search",
                        suffixIcon: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    widget.drawer.currentState.openEndDrawer();
                  },
                  child: Icon(
                    Icons.menu,
                    color: primaryColor,
                    size: 35.0,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 110.0,
            child: ListView.builder(
              itemCount: categoryList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CategoryProducts(
                              categoryName: categoryList[index].categoryName,
                              subCategoryProducts: categoryList[index].subCategoryProducts,
                                )));
                  },
                  child: SingleCategory(
                    category: categoryList[index],
                  ),
                );
              },
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height /1.68 , //520
            child: ListView.builder(
              itemCount: homeProductList.length,
              itemBuilder: (context, index) {
                return SingleHomeProduct(
                  product: homeProductList[index],
                    onTapFunction: () {
                      Navigator.pushNamed(context, ProductDetails.id,
                          arguments: ProductDetails(
                            product: homeProductList[index],
                          ));
                    });
              },
            ),
          ),
        ],
      );  
  }
}