import 'package:flutter/material.dart';
import 'package:restaurant/screens/accounts/change_password.dart';
import 'package:restaurant/screens/accounts/my_profile.dart';
import 'package:restaurant/shared/colors.dart';

class DrawerScreen extends StatefulWidget {
  static const String id = 'drawer_screen';
  const DrawerScreen({Key key}) : super(key: key);

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
                'Kareem Yasser',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                ),
              ),
              accountEmail: Text(
                'Kareem@gmail.com',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.grey,
                ),
              ),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: primaryColor,
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
              tilePadding: EdgeInsets.only(left:20.0 , right: 22.0),

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
                    Navigator.pushNamed(context, MyProfileScreen.id);
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
              titleText: "Order History",
              drawerIcon: Icons.history,
            ),
            DrawerItem(
              titleText: "Delivery Address",
              drawerIcon: Icons.home,
            ),
            DrawerItem(
              titleText: "Favorite",
              drawerIcon: Icons.favorite,
            ),
            DrawerItem(
              titleText: "About Us",
              drawerIcon: Icons.message,
            ),
            DrawerItem(
              titleText: "Support Center",
              drawerIcon: Icons.call,
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final String titleText;
  final IconData drawerIcon;
  final Function onTapFunction;
  Color dividerColor = Colors.grey.shade500;

  DrawerItem({this.titleText, this.drawerIcon, this.onTapFunction , this.dividerColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 10.0),
      child: Column(
        children: [
          InkWell(
            onTap: onTapFunction,
            child: ListTile(
              title: Text(
                titleText,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                ),
              ),
              leading: Icon(
                drawerIcon,
                color: primaryColor,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black54,
                size: 15.0,
              ),
            ),
          ),
          Divider(
            color: dividerColor,
          ),

        ],
      ),
    );
  }
}
