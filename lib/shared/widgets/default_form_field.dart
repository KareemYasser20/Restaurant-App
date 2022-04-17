import 'package:flutter/material.dart';

class DefaultFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType inputType;
  final Function validatorFunction;
  final bool obscureValue ;

  DefaultFormField(
      {this.controller, this.hintText, this.inputType, this.validatorFunction , this.obscureValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15.0),
      padding: EdgeInsets.only(left: 20.0, right: 20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: TextFormField(
        obscureText: obscureValue??false,
        controller: controller,
        keyboardType: inputType,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
        ),
        validator: validatorFunction,
      ),
    );
  }
}
