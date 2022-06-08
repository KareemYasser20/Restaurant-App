import 'package:flutter/material.dart';
import 'package:restaurant/screens/product/product_details.dart';
import 'package:restaurant/shared/constant.dart';
import 'package:restaurant/shared/widgets/favorite_widgets/single_favorite_product.dart';

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
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        child: GridView.builder(
          itemCount: homeProductList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 0.8),
          itemBuilder: (context, index) {
            return SingleFavoriteProduct(
              productModel: homeProductList[index],
              onTapFunction: () {
                Navigator.pushNamed(context, ProductDetails.id,
                    arguments: ProductDetails(
                      product: homeProductList[index],
                        ));
              },
            );
          },
        ),
      ),
    );
  }
}