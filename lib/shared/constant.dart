import 'package:flutter/material.dart';

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
    {
      "catId": "1",
      "catName": "Seafoods",
      "catImage": "images/category/cat1.png"
    },
    {
      "catId": "2",
      "catName": "category 2",
      "catImage": "images/category/cat2.png"
    },
    {
      "catId": "3",
      "catName": "category 3",
      "catImage": "images/category/cat3.png"
    },
    {
      "catId": "4",
      "catName": "category 4",
      "catImage": "images/category/cat4.png"
    },
    {
      "catId": "5",
      "catName": "category 5",
      "catImage": "images/category/cat5.png"
    },
    {
      "catId": "6",
      "catName": "category 6",
      "catImage": "images/category/cat6.png"
    },
    {
      "catId": "7",
      "catName": "category 7",
      "catImage": "images/category/cat7.png"
    },
    {
      "catId": "8",
      "catName": "category 8",
      "catImage": "images/category/cat8.png"
    },
    {
      "catId": "9",
      "catName": "category 9",
      "catImage": "images/category/cat9.png"
    },
    {
      "catId": "10",
      "catName": "category 10",
      "catImage": "images/category/cat10.png"
    },
  ];
  
var subCategoryList = [
    {
      "subCategoryId": "1",
      "subCategoryName": "Tuna",
      "subCategoryImage": "images/product/burger.jpg",
      "subCategoryCount": "10",
    },
    {
      "subCategoryId": "2",
      "subCategoryName": "Striped bass",
      "subCategoryImage": "images/category/cat2.png",
      "subCategoryCount": "10",
    },
    {
      "subCategoryId": "3",
      "subCategoryName": "Perch",
      "subCategoryImage": "images/category/cat3.png",
      "subCategoryCount": "5",
    },
    {
      "subCategoryId": "4",
      "subCategoryName": "Salmon",
      "subCategoryImage": "images/category/cat4.png",
      "subCategoryCount": "5",
    },
    {
      "subCategoryId": "5",
      "subCategoryName": "Cod",
      "subCategoryImage": "images/category/cat5.png",
      "subCategoryCount": "5",
    },
    {
      "subCategoryId": "6",
      "subCategoryName": "Sardines",
      "subCategoryImage": "images/category/cat6.png",
      "subCategoryCount": "5",
    },
    {
      "subCategoryId": "7",
      "subCategoryName": "Herring",
      "subCategoryImage": "images/category/cat7.png",
      "subCategoryCount": "5",
    },
  ];
  
  var productList = [

    {
      "productId": "1",
      "productName": "Burger",
      "productDescription": "Burger Sandwich with fries and extra cheese and cola drink.",
      "productImage": "images/product/burger.jpg",
      "ProductPrice" : 10,
      "ProductOffer" : "1",
      "ProductRate" : "2.0",

    },
    {
      "productId": "2",
      "productName": "Fish",
      "productDescription": "Food Description and price",
      "productImage": "images/product/fish.jpg",
      "ProductPrice" : 15,
      "ProductOffer" : "1",
      "ProductRate" : "3.0",
    },
    {
      "productId": "3",
      "productName": "Fresh Juice",
      "productDescription": "Food Description and price ",
      "productImage": "images/product/fresh_juice.jpg",
      "ProductPrice" : 20,
      "ProductOffer" : "0",
      "ProductRate" : "5.0",
    },
    {
      "productId": "4",
      "productName": "Pizza",
      "productDescription": "Food Description and price",
      "productImage": "images/product/pizza.jpg",
      "ProductPrice" : 25,
      "ProductOffer" : "0",
      "ProductRate" : "1.0",
    },
    
  ];

  var shoppingProduct = [
  {
    "productId": "1",
    "productName": "juice",
    "productPrice": 100,
    "productQuantity": "2",
    "productImage": "images/product/burger.jpg",
  },
  {
    "productId": "2",
    "productName": "burger",
    "productPrice": 100,
    "productQuantity": "2",
    "productImage": "images/product/burger.jpg",
  },
  {
    "productId": "3",
    "productName": "Pizza",
    "productPrice": 100,
    "productQuantity": "2",
    "productImage": "images/product/burger.jpg",
  },
  {
    "productId": "4",
    "productName": "happy meal",
    "productPrice": 100,
    "productQuantity": "2",
    "productImage": "images/product/burger.jpg",
  },
  {
    "productId": "5",
    "productName": "fish",
    "productPrice": 100,
    "productQuantity": "2",
    "productImage": "images/product/burger.jpg",
  },
  {
    "productId": "5",
    "productName": "fish",
    "productPrice": 100,
    "productQuantity": "2",
    "productImage": "images/product/burger.jpg",
  },
  {
    "productId": "5",
    "productName": "fish",
    "productPrice": 100,
    "productQuantity": "2",
    "productImage": "images/product/burger.jpg",
  },
];


  Widget toastWidget({String message , IconData toastIcon}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.grey[350],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(toastIcon),
          SizedBox(
            width: 10.0,
          ),
          Text(message),
        ],
      ),
    );
  }