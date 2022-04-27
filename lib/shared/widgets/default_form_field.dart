import 'package:flutter/material.dart';

class DefaultFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType inputType;
  final Function validatorFunction;
  final bool obscureValue;
  final bool isPasswordTextFeild;
  final Function suffixIconFunction;
  bool showPassword = false;

  DefaultFormField(
      {this.controller,
      this.hintText,
      this.inputType,
      this.validatorFunction,
      this.obscureValue,
      this.isPasswordTextFeild,
      this.showPassword,
      this.suffixIconFunction});

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
        obscureText: obscureValue ?? false ? showPassword : false,
        controller: controller,
        keyboardType: inputType,
        decoration: InputDecoration(
          suffixIcon: isPasswordTextFeild
              ? IconButton(
                  onPressed: suffixIconFunction,
                  icon: Icon(
                    showPassword ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                )
              : null,
          hintText: hintText,
          border: InputBorder.none,
        ),
        validator: validatorFunction,
      ),
    );
  }
}
