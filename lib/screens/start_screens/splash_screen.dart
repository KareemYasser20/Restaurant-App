import 'package:flutter/material.dart';
import 'package:restaurant/screens/start_screens/getStart_screen.dart';
import 'package:restaurant/shared/colors.dart';
import 'package:splashscreen/splashscreen.dart';

class Splash extends StatelessWidget {
  static const String id = 'splash_screen';

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      navigateAfterSeconds: GetStartScreen(),
      title: Text(
        'Welcome In Our Restaurant',
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.white),
      ),
      backgroundColor: primaryColor,
      loaderColor: Colors.white,
    );
  }
}
