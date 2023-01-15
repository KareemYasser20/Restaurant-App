
class CategoryModel {
  String categoryId;
  String categoryName;
  String categoryImage;
  // List<ProductModel> subCategoryProducts;

  CategoryModel({
    this.categoryId,
    this.categoryName,
    this.categoryImage,
    // this.subCategoryProducts,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      categoryId: json['cat_id'],
      categoryName: json['cat_name'],
      categoryImage: json['cat_image'],
      // subCategoryProducts: json[''],
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
