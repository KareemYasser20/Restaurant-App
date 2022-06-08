import 'package:flutter/material.dart';
import 'package:restaurant/screens/home/my_account.dart';
import 'package:restaurant/screens/drawer/drawer_screen.dart';
import 'package:restaurant/screens/home/offers_screen.dart';
import 'package:restaurant/screens/home/restaurant_screen.dart';
import 'package:restaurant/shared/colors.dart';

class HomeLayout extends StatefulWidget {
  static const String id = 'home_layout';

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {

  int currentIndex = 0;
  GlobalKey<ScaffoldState> keyDrawer ;
  List<Widget> homeScreens ;

@override
  void initState() {
    super.initState();
    keyDrawer = GlobalKey<ScaffoldState>();
    homeScreens = [
    RestaurantScreen(drawer: keyDrawer,),
    OfferScreen(),
    MyAccountScreen(), ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: keyDrawer,
      resizeToAvoidBottomInset : false,
      endDrawer: DrawerScreen(),
      body: homeScreens[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 14.0,
        unselectedFontSize: 12.0,
        showSelectedLabels: true,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.restaurant_menu,
              size: 25.0,
            ),
            label: "Restaurant",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.local_fire_department,
              size: 25.0,
            ),
            label: "Offers",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 25.0,
            ),
            label: "Account",
          ),
        ],
      ),
    );
  }
}
