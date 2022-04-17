import 'package:flutter/material.dart';
import 'package:restaurant/screens/getStart_screen.dart';
import 'package:restaurant/shared/colors.dart';
import 'package:splashscreen/splashscreen.dart';

class Splash extends StatefulWidget {
  static const String id = 'splash_screen';
  const Splash({Key key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      navigateAfterSeconds: new GetStartScreen(),
      title: new Text(
        'Welcome In Our Resturant',
        style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.white),
      ),
      // image: new Image.network(
      //     'https://flutter.io/images/catalog-widget-placeholder.png'),
      backgroundColor: primaryColor,
      loaderColor: Colors.white,
    );
  }
}
