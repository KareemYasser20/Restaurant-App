import 'package:flutter/material.dart';
import 'package:restaurant/models/cartItem_model.dart';
import 'package:restaurant/models/order_model.dart';

class Cart extends ChangeNotifier{

  List<Item> items =[];

  double price = 0 ;

  List orders = [];

  void addCart(Item item){
    items.add(item);

    price = price + item.itemPrice;
    notifyListeners();
  }

  // int getTotalOrder(){
  //   List<OrderModel> myarr = [];
  //    int sumOrders = 0;
  //    for(int i=0 ; i<myarr.length ; i++ ){
  //     sumOrders += 1;
  //   }
  //   return sumOrders ;
  // } 

  //  int getTotalPrice(){
  //   List<OrderModel> myarr =  [];
  //    int sumprice = 0;
  //    for(int i=0 ; i<myarr.length ; i++ ){
  //     sumprice += 1;
  //   }
  //   return sumprice ;
  // } 
  
  void removeCart(Item item){
    items.remove(item);

    price = price - item.itemPrice;
    notifyListeners();
  }

  List<Item> listItems(){

    List<Item> result = [];
    items.forEach((item) {
      var contain = result.where((element) => element.itemId == item.itemId );
      if(contain.isEmpty){
        result.add(item);
      }
      else{
        print("already exists");
      }
      
     });
      return result;
  }


//  List<OrderModel> orders(){

//     List<OrderModel> result = [];
//         result.add();

//       return result;
//   }
  int getCountItems(){
    return items.length;
  }

  double totalItems(){
     List<Item> myarr = listItems();
     double sumItem = 0;
     for(int i=0 ; i<myarr.length ; i++ ){
      sumItem += myarr[i].itemPrice * getCountByItem(myarr[i]);
    }
    return sumItem ;
  }


  String getStringCart(){
     List<Item> myarr = listItems();
     String str = "";
     for(int i=0 ; i<myarr.length ; i++ ){
      str += myarr[i].itemId;
      str += "," + getCountByItem(myarr[i]).toString();
      str +=  "," + myarr[i].itemPrice.toString();
      str += "#";
      
        }
    return str ;
  }

  int getCountByItem(Item item){
    int count =0;
    for(int i=0 ; i<items.length ; i++ ){
      if(items[i].itemId == item.itemId){
        count ++;
      }
    }
    return count;
  }

  double getPrice(){
    return price;
  }

  void clearCart(){
    items.clear();
  }
}