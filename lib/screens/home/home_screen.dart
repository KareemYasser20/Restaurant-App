import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/screens/product/product_deatils.dart';
import 'package:restaurant/screens/product/sub_category.dart';
import 'package:restaurant/screens/user_page/drawer_screen.dart';
import 'package:restaurant/shared/colors.dart';
import 'package:restaurant/shared/constant.dart';
import 'package:restaurant/shared/widgets/single_category.dart';
import 'package:restaurant/shared/widgets/single_product.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';
  const HomeScreen({Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> _keyDrwaer = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _keyDrwaer,
      endDrawer: DrawerScreen(),
      body: Column(
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
                onPressed: () {},
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
                    _keyDrwaer.currentState.openEndDrawer();
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
                            builder: (context) => SubCategory(
                                  categoryId: categoryList[index]["catId"],
                                  categoryName: categoryList[index]["catName"],
                                )));
                  },
                  child: SingleCategory(
                    catId: categoryList[index]["catId"],
                    catName: categoryList[index]["catName"],
                    catImage: categoryList[index]["catImage"],
                  ),
                );
              },
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 520.0,
            child: ListView.builder(
              itemCount: productList.length,
              itemBuilder: (context, index) {
                return SingleProduct(
                    productId: productList[index]["productId"],
                    productName: productList[index]["productName"],
                    productDescription: productList[index]
                        ["productDescription"],
                    productImage: productList[index]["productImage"],
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
                    });
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 14.0,
        unselectedFontSize: 12.0,
        showSelectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.restaurant_menu,
              size: 25.0,
            ),
            label: "Restaurant",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.local_fire_department,
              size: 25.0,
            ),
            label: "Offers",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 25.0,
            ),
            label: "Account",
          ),
        ],
      ),
    );
  }
}
