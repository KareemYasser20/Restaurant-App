import 'package:restaurant/models/category_model.dart';
import 'package:restaurant/models/product_model.dart';

var tipsArray = [
  {
    "title": "Find Foods you Love",
    "info": "Discover the best foods from our restaurants",
    "image": "images/tip1.png",
  },
  {
    "title": "Fast Delivery",
    "info": "Fast Delivery to your home, excellent product",
    "image": "images/tip2.png",
  },
  {
    "title": "Live Tracking",
    "info": "Real live tracking of your food",
    "image": "images/tip3.png",
  },
];

var categoryList = [
  CategoryModel(
    categoryId: 1,
    categoryName: "Seafoods",
    categoryImage: "images/category/cat1.png",
    subCategoryProducts: [
      ProductModel(
        productId: 1,
        productName: "Burger",
        productDescription:
            "Burger Sandwich with fries and extra cheese and cola drink.",
        productImage: "images/product/burger.jpg",
        productPrice: 10,
        productOffer: 1,
        productRate: 2.0,
        productFavourite: 1,
        productFirstShow: 0,
        productQuantity: 5,
      ),
      ProductModel(
        productId: 2,
        productName: "Fish",
        productDescription: "Food Description and price.",
        productImage: "images/product/fish.jpg",
        productPrice: 15,
        productOffer: 1,
        productRate: 3.0,
        productFavourite: 0,
        productFirstShow: 1,
        productQuantity: 10,
      ),
    ],
  ),

  CategoryModel(
    categoryId: 2,
    categoryName: "category 2",
    categoryImage: "images/category/cat2.png",
    subCategoryProducts: [
      ProductModel(
        productId: 3,
        productName: "Fresh Juice",
        productDescription: "Food Description and price ",
        productImage: "images/product/fresh_juice.jpg",
        productPrice: 20,
        productOffer: 0,
        productRate: 5.0,
        productFavourite: 1,
        productFirstShow: 0,
        productQuantity: 15,
      ),
      ProductModel(
        productId: 4,
        productName: "Pizza",
        productDescription: "Food Description and price.",
        productImage: "images/product/pizza.jpg",
        productPrice: 25,
        productOffer: 0,
        productRate: 1.0,
        productFavourite: 0,
        productFirstShow: 1,
        productQuantity: 15,
      ),
    ],
  ),

  CategoryModel(
    categoryId: 3,
    categoryName: "category 3",
    categoryImage: "images/category/cat3.png",
    subCategoryProducts: [
      ProductModel(
        productId: 3,
        productName: "Fresh Juice",
        productDescription: "Food Description and price ",
        productImage: "images/product/fresh_juice.jpg",
        productPrice: 20,
        productOffer: 0,
        productRate: 5.0,
        productFavourite: 1,
        productFirstShow: 0,
        productQuantity: 15,
      ),
      ProductModel(
        productId: 4,
        productName: "Pizza",
        productDescription: "Food Description and price.",
        productImage: "images/product/pizza.jpg",
        productPrice: 25,
        productOffer: 0,
        productRate: 1.0,
        productFavourite: 0,
        productFirstShow: 1,
        productQuantity: 15,
      ),
    ],
  ),

  CategoryModel(
    categoryId: 4,
    categoryName: "category 4",
    categoryImage: "images/category/cat4.png",
    subCategoryProducts: [
      ProductModel(
        productId: 3,
        productName: "Fresh Juice",
        productDescription: "Food Description and price ",
        productImage: "images/product/fresh_juice.jpg",
        productPrice: 20,
        productOffer: 0,
        productRate: 5.0,
        productFavourite: 1,
        productFirstShow: 0,
        productQuantity: 15,
      ),
    ],
  ),

  CategoryModel(
    categoryId: 5,
    categoryName: "category 5",
    categoryImage: "images/category/cat5.png",
    subCategoryProducts: [
      ProductModel(
        productId: 3,
        productName: "Fresh Juice",
        productDescription: "Food Description and price ",
        productImage: "images/product/fresh_juice.jpg",
        productPrice: 20,
        productOffer: 0,
        productRate: 5.0,
        productFavourite: 1,
        productFirstShow: 0,
        productQuantity: 15,
      ),
    ],
  ),
  
  CategoryModel(
    categoryId: 6,
    categoryName: "category 6",
    categoryImage: "images/category/cat6.png",
    subCategoryProducts: [
      ProductModel(
        productId: 3,
        productName: "Fresh Juice",
        productDescription: "Food Description and price ",
        productImage: "images/product/fresh_juice.jpg",
        productPrice: 20,
        productOffer: 0,
        productRate: 5.0,
        productFavourite: 1,
        productFirstShow: 0,
        productQuantity: 15,
      ),
    ],
  ),

  CategoryModel(
    categoryId: 7,
    categoryName: "category 7",
    categoryImage: "images/category/cat7.png",
    subCategoryProducts: [
      ProductModel(
        productId: 3,
        productName: "Fresh Juice",
        productDescription: "Food Description and price ",
        productImage: "images/product/fresh_juice.jpg",
        productPrice: 20,
        productOffer: 0,
        productRate: 5.0,
        productFavourite: 1,
        productFirstShow: 0,
        productQuantity: 15,
      ),
    ],
  ),

  CategoryModel(
    categoryId: 8,
    categoryName: "category 8",
    categoryImage: "images/category/cat8.png",
    subCategoryProducts: [
      ProductModel(
        productId: 3,
        productName: "Fresh Juice",
        productDescription: "Food Description and price ",
        productImage: "images/product/fresh_juice.jpg",
        productPrice: 20,
        productOffer: 0,
        productRate: 5.0,
        productFavourite: 1,
        productFirstShow: 0,
        productQuantity: 15,
      ),
    ],
  ),

  CategoryModel(
    categoryId: 9,
    categoryName: "category 9",
    categoryImage: "images/category/cat9.png",
    subCategoryProducts: [
      ProductModel(
        productId: 3,
        productName: "Fresh Juice",
        productDescription: "Food Description and price ",
        productImage: "images/product/fresh_juice.jpg",
        productPrice: 20,
        productOffer: 0,
        productRate: 5.0,
        productFavourite: 1,
        productFirstShow: 0,
        productQuantity: 15,
      ),
    ],
  ),

  CategoryModel(
    categoryId: 10,
    categoryName: "category 10",
    categoryImage: "images/category/cat10.png",
    subCategoryProducts: [
      ProductModel(
        productId: 3,
        productName: "Fresh Juice",
        productDescription: "Food Description and price ",
        productImage: "images/product/fresh_juice.jpg",
        productPrice: 20,
        productOffer: 0,
        productRate: 5.0,
        productFavourite: 1,
        productFirstShow: 0,
        productQuantity: 15,
      ),
    ],
  ),

];

var homeProductList = [
  ProductModel(
    productId: 1,
    productName: "Burger",
    productDescription:"Burger Sandwich with fries and extra cheese and cola drink.",
    productImage: "images/product/burger.jpg",
    productPrice: 10,
    productOffer: 1,
    productRate: 2.0,
    productFavourite: 1,
    productFirstShow: 1,
    productQuantity: 5,
  ),
  ProductModel(
    productId: 2,
    productName: "Fish",
    productDescription: "Food Description and price.",
    productImage: "images/product/fish.jpg",
    productPrice: 15,
    productOffer: 1,
    productRate: 3.0,
    productFavourite: 0,
    productFirstShow: 1,
    productQuantity: 10,
  ),
  ProductModel(
    productId: 4,
    productName: "Pizza",
    productDescription: "Food Description and price.",
    productImage: "images/product/pizza.jpg",
    productPrice: 25,
    productOffer: 0,
    productRate: 1.0,
    productFavourite: 0,
    productFirstShow: 1,
    productQuantity: 15,
  ),
];

var shoppingProduct = [

  ProductModel(
    productId: 1,
    productName: "juice",
    productDescription: "Food Description and price.",
    productImage: "images/product/fresh_juice.jpg",
    productPrice: 100,
    productOffer: 0,
    productRate: 1.0,
    productFavourite: 0,
    productFirstShow: 1,
    productQuantity: 2,
  ),

  ProductModel(
    productId: 2,
    productName: "Fish",
    productDescription: "Food Description and price.",
    productImage: "images/product/fish.jpg",
    productPrice: 15,
    productOffer: 1,
    productRate: 3.0,
    productFavourite: 0,
    productFirstShow: 1,
    productQuantity: 10,
  ),
  ProductModel(
    productId: 4,
    productName: "Pizza",
    productDescription: "Food Description and price.",
    productImage: "images/product/pizza.jpg",
    productPrice: 25,
    productOffer: 0,
    productRate: 1.0,
    productFavourite: 0,
    productFirstShow: 1,
    productQuantity: 15,
  ),
  
];