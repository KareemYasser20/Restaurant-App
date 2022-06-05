import 'package:flutter/material.dart';
import 'package:restaurant/screens/accounts/change_password.dart';
import 'package:restaurant/screens/accounts/forgetpassword.dart';
import 'package:restaurant/screens/accounts/login.dart';
import 'package:restaurant/screens/accounts/my_profile.dart';
import 'package:restaurant/screens/accounts/register.dart';
import 'package:restaurant/screens/drawer/drawer_screen.dart';
import 'package:restaurant/screens/favorite/favorite_screen.dart';
import 'package:restaurant/screens/start_screens/getStart_screen.dart';
import 'package:restaurant/screens/home/home_screen.dart';
import 'package:restaurant/screens/orders/tracking_order.dart';
import 'package:restaurant/screens/product/product_deatils.dart';
import 'package:restaurant/screens/product/sub_category.dart';
import 'package:restaurant/screens/shopping/shopping.dart';
import 'package:restaurant/screens/start_screens/splash_screen.dart';
import 'package:restaurant/screens/start_screens/tips_screen.dart';

void main() {
  runApp(MyApp());
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
        HomeScreen.id : (context) => HomeScreen(),
        DrawerScreen.id : (context) => DrawerScreen(),
        ProductDeatils.id : (context) => ProductDeatils(),
        ShoppingScreen.id : (context) => ShoppingScreen(),
        MyProfileScreen.id : (context) => MyProfileScreen(),
        ChangePasswordScreen.id : (context) => ChangePasswordScreen(),
        SubCategory.id : (context) => SubCategory(),
        FavoriteScreen.id : (context) => FavoriteScreen(),
        TrackingOrder.id : (context) => TrackingOrder(),
                
      },
    );
  }
}
