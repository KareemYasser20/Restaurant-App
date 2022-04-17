import 'package:flutter/material.dart';
import 'package:restaurant/screens/accounts/forgetpassword.dart';
import 'package:restaurant/screens/accounts/login.dart';
import 'package:restaurant/screens/accounts/register.dart';
import 'package:restaurant/screens/getStart_screen.dart';
import 'package:restaurant/screens/home/home_screen.dart';
import 'package:restaurant/screens/product/product_deatils.dart';
import 'package:restaurant/screens/splash_screen.dart';
import 'package:restaurant/screens/tips_screen.dart';
import 'package:restaurant/screens/user_page/drawer_screen.dart';
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
                
      },
    );
  }
}
