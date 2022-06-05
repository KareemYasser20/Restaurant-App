import 'package:flutter/material.dart';
import '../../colors.dart';

class AccountsButton extends StatelessWidget {
  final String buttonText;
  final Function onPressButton;

  AccountsButton({@required this.buttonText, @required this.onPressButton});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressButton,
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: 50.0,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            color: Colors.white,
            fontSize: 22.0,
          ),
        ),
      ),
    );
  }
}
