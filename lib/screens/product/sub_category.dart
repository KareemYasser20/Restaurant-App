import 'package:flutter/material.dart';
import 'package:restaurant/screens/product/category_products.dart';
import 'package:restaurant/shared/constant.dart';

class SubCategory extends StatefulWidget {
  static const String id = 'SubCategory_screen';
  final String categoryId;
  final String categoryName;

  SubCategory({this.categoryId, this.categoryName});

  @override
  State<SubCategory> createState() => _SubCategoryState();
}

class _SubCategoryState extends State<SubCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          widget.categoryName,
          style: TextStyle(color: Colors.black),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 10.0),
        child: ListView.builder(
            itemCount: subCategoryList.length,
            itemBuilder: (BuildContext context, int index) {
              return SingleSubCategory(
                  subCategoryId: subCategoryList[index]["subCategoryId"],
                  subCategoryImage: subCategoryList[index]["subCategoryImage"],
                  subCategoryName: subCategoryList[index]["subCategoryName"],
                  onTapFunction: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Products(productData: subCategoryList[index],)));
                  },
                  subCategoryCount: subCategoryList[index]["subCategoryCount"]);
            }),
      ),
    );
  }
}

class SingleSubCategory extends StatelessWidget {
  final String subCategoryId;
  final String subCategoryName;
  final String subCategoryImage;
  final String subCategoryCount;
  final Function onTapFunction;

  SingleSubCategory(
      {this.subCategoryId,
      this.subCategoryName,
      this.subCategoryImage,
      this.subCategoryCount,
      this.onTapFunction});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 10.0),
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: onTapFunction,
            child: ListTile(
              leading: Container(
                width: 55.0,
                height: 55.0,
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: Colors.grey[100],
                    image: DecorationImage(
                      image: AssetImage(subCategoryImage),
                      fit: BoxFit.fill,
                    ),
                    ),
              ),
              title: Text(
                subCategoryName,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(subCategoryCount),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
