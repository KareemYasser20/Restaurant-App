import 'package:flutter/material.dart';
import 'package:restaurant/models/category_model.dart';
import 'package:restaurant/shared/api/config.dart';
import 'package:cached_network_image/cached_network_image.dart';

class SingleCategory extends StatelessWidget {
  final CategoryModel category;
  final Function onTapFunction;

  SingleCategory({this.category , this.onTapFunction});
  
  final String imageCategory = imagesPath + "categories/";

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapFunction,
      child: Container(
        padding: EdgeInsets.only(right: 8.0 ,left: 8.0),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.red.shade100),
                  // images/category/cat1.png  category.categoryImage
              child: category.categoryImage == null ? Text("") 
              : CachedNetworkImage(
                imageUrl: imageCategory + category.categoryImage,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              // Image.asset(category.categoryImage),
            ),
            Text(
              category.categoryName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
