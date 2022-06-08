import 'package:flutter/material.dart';
import 'package:restaurant/models/product_model.dart';
import 'package:restaurant/screens/product/product_details.dart';
import 'package:restaurant/shared/widgets/products_widget/single_category_product.dart';

class CategoryProducts extends StatefulWidget {
  final String categoryName;
  final List<ProductModel> subCategoryProducts;

  CategoryProducts({this.categoryName , this.subCategoryProducts});

  @override
  State<CategoryProducts> createState() => _CategoryProductsState();
}

class _CategoryProductsState extends State<CategoryProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.categoryName,
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
          itemCount: widget.subCategoryProducts.length,
          itemBuilder: (context, index) {
            return SingleCategoryProduct(
              product: widget.subCategoryProducts[index],
                onTapFunction: () {
                  Navigator.pushNamed(context, ProductDetails.id,
                      arguments: ProductDetails(
                        product: widget.subCategoryProducts[index],
                         ));
                });
          },
        ),
      ),
    );
  }
}

