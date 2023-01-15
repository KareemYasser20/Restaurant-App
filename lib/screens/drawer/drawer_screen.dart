import 'package:flutter/material.dart';
import 'package:restaurant/screens/accounts/change_password.dart';
import 'package:restaurant/screens/home/my_account.dart';
import 'package:restaurant/screens/favorite/favorite_screen.dart';
import 'package:restaurant/screens/orders/tracking_order.dart';
import 'package:restaurant/screens/shopping/shopping.dart';
import 'package:restaurant/screens/statistics/statistics.dart';
import 'package:restaurant/shared/colors.dart';
import 'package:restaurant/shared/widgets/drawer_widgets/drawer_item_widget.dart';

class DrawerScreen extends StatefulWidget {
  static const String id = 'drawer_screen';

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                // TODO: put login user Name here 
                'Kareem Yasser',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                ),
              ),
              accountEmail: Text(
                // TODO: put login user email here 
                'Kareem@gmail.com',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.grey,
                ),
              ),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: primaryColor,
                  // TODO: put login user photo here 
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
              ),
            ),
            ExpansionTile(
              tilePadding: EdgeInsets.only(left: 20.0, right: 22.0),
              leading: Icon(
                Icons.person,
                color: primaryColor,
              ),
              title: Text(
                "Profile",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                ),
              ),
              children: [
                DrawerItem(
                  titleText: "Edit Profile",
                  drawerIcon: Icons.settings,
                  onTapFunction: () {
                    Navigator.pushNamed(context, MyAccountScreen.id);
                  },
                ),
                DrawerItem(
                  titleText: "Edit Password",
                  dividerColor: Colors.white,
                  drawerIcon: Icons.lock_open,
                  onTapFunction: () {
                    Navigator.pushNamed(context, ChangePasswordScreen.id);
                  },
                ),
              ],
            ),
            Divider(
              color: Colors.grey.shade500,
            ),
            DrawerItem(
              titleText: "My Orders",
              drawerIcon: Icons.shopping_bag_outlined,
              onTapFunction: () {
                Navigator.pushNamed(context, ShoppingScreen.id);
              },
            ),

            DrawerItem(
              titleText: "statistics",
              drawerIcon: Icons.data_exploration,
              onTapFunction: () {
                Navigator.pushNamed(context, Statistics.id);
              },
            ),
            DrawerItem(
              titleText: "Delivery Address",
              drawerIcon: Icons.home,
              onTapFunction: (){
                // TODO: user Address
              },
            ),
            DrawerItem(
              titleText: "Favorite",
              drawerIcon: Icons.favorite,
              onTapFunction: () {
                Navigator.pushNamed(context, FavoriteScreen.id);
              },
            ),
            DrawerItem(
              titleText: "Track orders",
              drawerIcon: Icons.drive_eta,
              onTapFunction: () {
                Navigator.pushNamed(context, TrackingOrder.id);
              },
            ),
            DrawerItem(
              titleText: "About Us",
              drawerIcon: Icons.message,
              onTapFunction: (){},
            ),
            DrawerItem(
              titleText: "Support Center",
              drawerIcon: Icons.call,
              onTapFunction: (){},
            ),
          ],
        ),
      ),
    );
  }
}