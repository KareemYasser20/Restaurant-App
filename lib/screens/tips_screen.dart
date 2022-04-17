import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:restaurant/screens/accounts/login.dart';
import 'package:restaurant/screens/accounts/register.dart';
import 'package:restaurant/shared/colors.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:restaurant/shared/constant.dart';
import 'package:restaurant/shared/widgets/single_tip.dart';


class Tips extends StatefulWidget {
  static const String id = 'tips_screen';
  const Tips({Key key}) : super(key: key);

  @override
  State<Tips> createState() => _TipsState();
}

class _TipsState extends State<Tips> {
  
  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height / 6;
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.only(top: 55.0, right: 30.0),
              child: GestureDetector(
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 22.0,
                  ),
                ),
                onTap: (){
                  Navigator.pushNamed(context, LoginScreen.id);
                },
              ),
            ),
            Container(
              height: myHeight * 4,
              child: PageIndicatorContainer(
                  shape: IndicatorShape.circle(),
                  align: IndicatorAlign.bottom,
                  indicatorColor: Colors.grey,
                  indicatorSelectorColor: primaryColor,
                  child: PageView.builder(
                    physics: AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: tipsarr.length,
                    itemBuilder: (context, index) {
                      return SingleTip(
                        title: tipsarr[index]["title"],
                        info: tipsarr[index]["info"],
                        image: tipsarr[index]["image"],
                      );
                    },
                  ),
                  length: tipsarr.length),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: ListView(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        MaterialButton(
                          child: Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Text(
                              'Create Account',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25.0,
                              ),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, RegisterScreen.id);
                          },
                        ),
                        SizedBox(height: 10.0,),
                        MaterialButton(
                          child: Container(
                            alignment: Alignment.center,
                            height: 50.0,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.facebookF,
                                  size: 20.0,
                                ),
                                SizedBox(
                                  width: 8.0,
                                ),
                                Text(
                                  'Continue With Facebook',
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 25.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
