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

var homeProductList = [
  ProductModel(
    productId: "1",
    productName: "Burger",
    productDescription:"Burger Sandwich with fries and extra cheese and cola drink.",
    productImage: "images/product/burger.jpg",
    productPrice: 10,
    productOffer: 1,
  ),
  ProductModel(
    productId: "2",
    productName: "Fish",
    productDescription: "Food Description and price.",
    productImage: "images/product/fish.jpg",
    productPrice: 15,
    productOffer: 1,
  ),
  ProductModel(
    productId: '4',
    productName: "Pizza",
    productDescription: "Food Description and price.",
    productImage: "images/product/pizza.jpg",
    productPrice: 25,
    productOffer: 0,
  ),
];