import 'package:flutter/material.dart';
import '../../colors.dart';

class AccountQuestion extends StatelessWidget {

  final String accountQuestion;
  final String buttonText;
  final Function onTapButton;

  AccountQuestion({@required this.accountQuestion , @required this.buttonText , @required this.onTapButton});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            accountQuestion,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5.0),
          ),
          GestureDetector(
            onTap: onTapButton,
            child: Text(
              buttonText,
              style: TextStyle(
                color: primaryColor,
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

