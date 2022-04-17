import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:restaurant/screens/tips_screen.dart';
import 'package:restaurant/shared/colors.dart';

class GetStartScreen extends StatefulWidget {
  static const String id = 'getStart_screen';
  const GetStartScreen({Key key}) : super(key: key);

  @override
  State<GetStartScreen> createState() => _GetStartScreenState();
}

class _GetStartScreenState extends State<GetStartScreen> {
  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height/4;
    return Scaffold(
        body: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: myHeight *3,
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                    image: AssetImage('images/tip0.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Container(
                height: myHeight,
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: primaryColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: ListView(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text('Happy Meals' , style: TextStyle(color: Colors.white , fontSize: 24.0 , fontWeight: FontWeight.bold),),
                        SizedBox(height: 10.0,),
                        Text('Discover the best foods from our resturants.'  , style: TextStyle(color: Colors.white , fontSize: 18.0 ),),
                        SizedBox(height: 30.0,),
                        GestureDetector(
                          onTap: (){
                            Navigator.pushNamed(context, Tips.id);
                          },
                          child: Container(
                            padding: EdgeInsets.only(left:30.0 , right: 30.0 , top: 8.0 , bottom: 8.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Text('Get Started' ,  style: TextStyle(fontSize: 20.0),)
                            ),
                        ),

                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }
}
