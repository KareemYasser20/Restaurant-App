import 'package:flutter/material.dart';
import 'package:restaurant/provider/cart.dart';
import 'package:restaurant/screens/home/home_layout.dart';
import 'package:restaurant/screens/orders/tracking_order.dart';
import 'package:restaurant/shared/api/function.dart';
import 'package:restaurant/shared/colors.dart';

saveCart( BuildContext context , Cart provider) async
    {
      Map arr = {
        "data" : provider.getStringCart(),
        /// TODO get current user id here
        "order_customer_id" : "",
        "order_customer_address" : "", 
        "order_note" : "",
      };

      await saveData(
        arrInsert: arr,
        context: context,
        type: "insert",
        urlPage: "orders/insert_order.php",
        movePage: ()=> TrackingOrder(),
      ); 
      provider.clearCart();

    }
    

void showSheetMessage(BuildContext context , provid) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight:Radius.circular(25.0),
        )
      ),
      builder: (BuildContext bc) {
        return Container(
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 30.0 , bottom: 30.0),
                    child: Image(
                      width: 150.0,
                      height: 150.0,
                      image: AssetImage('images/check_icon.png' ,),
                    
                      ),
                  ),
                  Text(
                    'Thank you for your order.',
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 20.0,),
                  Text(
                    'You can track the delivery through the button at the bottom.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16.0,
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top:40.0 ),
                    child: MaterialButton(
                      child: Container(
                        margin: EdgeInsets.only(top:15.0, right: 15.0, left: 15.0),
                        width: MediaQuery.of(context).size.width,
                        height: 50.0,
                        child: Center(
                          child: Text(
                            'Track my order',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(25.0),

                        ),
                      ),
                      onPressed: () {
                        saveCart(context , provid);
                        Navigator.pushNamed(context, TrackingOrder.id);
                      },
                    ),
                  ),


                    Padding(
                    padding: EdgeInsets.only(top:3.0 ),
                    child: MaterialButton(
                      child: Container(
                        margin: EdgeInsets.all(15.0),
                        width: MediaQuery.of(context).size.width,
                        height: 50.0,
                        child: Center(
                          child: Text(
                            'Order something else',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25.0,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(25.0),

                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, HomeLayout.id);
                      },
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      },
      context: context,
    );
  }
