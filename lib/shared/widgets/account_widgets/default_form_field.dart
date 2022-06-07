import 'package:flutter/material.dart';

class DefaultFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType inputType;
  final Function validatorFunction;
  final bool obscureValue;
  final bool isPasswordTextField;
  final Function suffixIconFunction;
  final bool showPassword;

  DefaultFormField(
      {this.controller,
      this.hintText,
      this.inputType,
      this.validatorFunction,
      this.obscureValue,
      this.isPasswordTextField,
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
        obscureText: obscureValue ?? false ? showPassword?? false : false,
        controller: controller,
        keyboardType: inputType,
        decoration: InputDecoration(
          suffixIcon: isPasswordTextField
              ? IconButton(
                  onPressed: suffixIconFunction,
                  icon: Icon(
                    showPassword??false ? Icons.visibility : Icons.visibility_off,
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
