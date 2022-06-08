import 'package:restaurant/models/product_model.dart';

class CategoryModel {
  int categoryId;
  String categoryName;
  String categoryImage;
  List<ProductModel> subCategoryProducts;

  CategoryModel({
    this.categoryId,
    this.categoryName,
    this.categoryImage,
    this.subCategoryProducts,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      categoryId: json[''],
      categoryName: json[''],
      categoryImage: json[''],
      subCategoryProducts: json[''],
    );
  }
}

// class SubCategoryModel {
//   int subCategoryId;
//   String subCategoryName;
//   String subCategoryImage;
//   int subCategoryCount;

//   SubCategoryModel({
//     this.subCategoryId,
//     this.subCategoryName,
//     this.subCategoryImage,
//     this.subCategoryCount,
//   });

//   factory SubCategoryModel.fromJson(Map<String, dynamic> json) {
//     return SubCategoryModel(
//       subCategoryId: json[''],
//       subCategoryName: json[''],
//       subCategoryImage: json[''],
//       subCategoryCount: json[''],
//     );
//   }

// }
