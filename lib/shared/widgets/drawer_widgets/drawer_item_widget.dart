import 'package:flutter/material.dart';
import '../../colors.dart';

class DrawerItem extends StatelessWidget {
  final String titleText;
  final IconData drawerIcon;
  final Function onTapFunction;
  final Color dividerColor;

  DrawerItem(
      {this.titleText, this.drawerIcon, this.onTapFunction, this.dividerColor});

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
            color: dividerColor ?? Colors.grey.shade500,
          ),
        ],
      ),
    );
  }
}
