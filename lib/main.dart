import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/provider/cart.dart';
import 'package:restaurant/provider/load_data.dart';
import 'package:restaurant/screens/accounts/change_password.dart';
import 'package:restaurant/screens/accounts/forget_password.dart';
import 'package:restaurant/screens/accounts/login.dart';
import 'package:restaurant/screens/home/my_account.dart';
import 'package:restaurant/screens/accounts/register.dart';
import 'package:restaurant/screens/drawer/drawer_screen.dart';
import 'package:restaurant/screens/favorite/favorite_screen.dart';
import 'package:restaurant/screens/home/restaurant_screen.dart';
import 'package:restaurant/screens/product/product_details.dart';
import 'package:restaurant/screens/start_screens/getStart_screen.dart';
import 'package:restaurant/screens/home/home_layout.dart';
import 'package:restaurant/screens/orders/tracking_order.dart';
import 'package:restaurant/screens/shopping/shopping.dart';
import 'package:restaurant/screens/start_screens/splash_screen.dart';
import 'package:restaurant/screens/start_screens/tips_screen.dart';
import 'package:restaurant/screens/statistics/statistics.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoadData()
          ),

          ChangeNotifierProvider<Cart>(
          create: (context) => Cart()
          ),
     
      ],
      child: MyApp(),
    )
    
    );
}
class MyApp extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       initialRoute: Splash.id,
      routes: {
        Splash.id : (context)=> Splash(),
        GetStartScreen.id : (context) => GetStartScreen(),
        Tips.id : (context) => Tips(),
        RegisterScreen.id : (context) => RegisterScreen(),
        LoginScreen.id : (context) => LoginScreen(),
        ForgetPasswordScreen.id : (context) => ForgetPasswordScreen(),
        HomeLayout.id : (context) => HomeLayout(),
        RestaurantScreen.id : (context) => RestaurantScreen(),
        DrawerScreen.id : (context) => DrawerScreen(),
        ProductDetails.id : (context) => ProductDetails(),
        ShoppingScreen.id : (context) => ShoppingScreen(),
        MyAccountScreen.id : (context) => MyAccountScreen(),
        ChangePasswordScreen.id : (context) => ChangePasswordScreen(),
        FavoriteScreen.id : (context) => FavoriteScreen(),
        TrackingOrder.id : (context) => TrackingOrder(),
        Statistics.id : (context) => Statistics(),
                
      },
    );
  }
}
