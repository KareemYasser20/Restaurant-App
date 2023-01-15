import 'package:flutter/material.dart';
import 'package:restaurant/models/category_model.dart';
import 'package:restaurant/models/order_model.dart';
import 'package:restaurant/models/product_model.dart';
import 'package:restaurant/shared/api/function.dart';
import 'package:restaurant/shared/widgets/products_widget/single_category.dart';
import 'package:restaurant/shared/widgets/products_widget/single_home_product.dart';


class LoadData extends ChangeNotifier{

  
List<SingleCategory> categories = [];
List<SingleHomeProduct> products = [];
List<ProductModel> categoryProducts = [];
List<OrderModel> orders = [];


List<SingleCategory> getCategory(){
  return categories;
}


List<ProductModel> getCategProd(){
  return categoryProducts;
}

List<SingleHomeProduct> getProduct(){
  return products;
}

    void getCategoryData() async {

    List categoryArray = await getData(urlPage: "/categories/readcategories.php" , start: 0 , end: 100);

    for (int i = 0; i < categoryArray.length; i++) {
      categories.add(SingleCategory(
        category: CategoryModel.fromJson(categoryArray[i]),));
      notifyListeners();
    }
  }

  void getOrder() async {

    List order = await getData(urlPage: "/orders/total.php");

    for (int i = 0; i < order.length; i++) {

      orders.add(OrderModel.fromJson(order[i]) );
      notifyListeners();
    }

      
   
  }

   int getTotalOrder(){
    List<OrderModel> myarr = orders;
     int sumOrders = 0;
     for(int i=0 ; i<myarr.length ; i++ ){
      sumOrders += sumOrders + orders[i].orderId;
    }
    return sumOrders ;
  } 

   double getTotalPrice(){
    List<OrderModel> myarr =  orders;
     double sumprice = 0;
     for(int i=0 ; i<myarr.length ; i++ ){
      sumprice += sumprice + orders[i].item_price ;
    }
    return sumprice ;
  }

  void getProductData(String searchText) async {

    List productArray = await getData(urlPage: "/products/readproducts.php" , start: 0 , end: 40 , strSearch: searchText);
   
    for (int i = 0; i < productArray.length; i++) {
      products.add(SingleHomeProduct(
        product: ProductModel.fromJson(productArray[i]),
      ));
       notifyListeners();
    }
  }


  
  void getCategoryProduct({categoryId}) async {

    List categoryProductArray = await getData(urlPage: "/categories/read_category_product.php" , param: "cat_id=$categoryId" , start: 0 , end: 20);
    categoryProducts.clear();
    for (int i = 0; i < categoryProductArray.length; i++) {
      categoryProducts.add(  ProductModel.fromJson(categoryProductArray[i]) );
      notifyListeners();
    }
  }

}