import 'package:flutter/material.dart';
import 'package:restaurant/shared/colors.dart';
import 'package:restaurant/shared/widgets/default_form_field.dart';
import 'package:restaurant/shared/widgets/shopping_screen_header.dart';

class ChangePasswordScreen extends StatefulWidget {
  static const String id = 'Change_Password_screen';

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  TextEditingController oldPasswordController;
  TextEditingController newPasswordController;
  TextEditingController confirmNewPasswordController;
  bool showOldPassword = true;
  bool showNewPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 60.0),
            padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 25.0),
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: ListView(
                children: [
                  Text(
                    "Change The Password",
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 35.0,
                  ),
                  DefaultFormField(
                    controller: oldPasswordController,
                    hintText: 'The Current Password',
                    obscureValue: true,
                    isPasswordTextFeild: true,
                    showPassword: showOldPassword,
                    suffixIconFunction: () {
                      setState(() {
                        showOldPassword = !showOldPassword;
                      });
                    },
                    inputType: TextInputType.text,
                    validatorFunction: (String value) {
                      if (value.isEmpty || value.length < 4) {
                        return 'Please enter valid password more than 4 character';
                      }
                      return null;
                    },
                  ),
                  DefaultFormField(
                    controller: newPasswordController,
                    hintText: 'The New Password',
                    obscureValue: true,
                    isPasswordTextFeild: true,
                    showPassword: showNewPassword,
                    suffixIconFunction: () {
                      setState(() {
                        showNewPassword = !showNewPassword;
                      });
                    },
                    inputType: TextInputType.text,
                    validatorFunction: (String value) {
                      if (value.isEmpty || value.length < 4) {
                        return 'Please enter valid password more than 4 character';
                      }
                      return null;
                    },
                  ),
                  DefaultFormField(
                    controller: confirmNewPasswordController,
                    hintText: 'Confirm New Password',
                    obscureValue: true,
                    isPasswordTextFeild: false,
                    showPassword: false,
                    inputType: TextInputType.text,
                    validatorFunction: (String value) {
                      if (value.isEmpty || value.length < 4) {
                        return 'Please enter valid password more than 4 character';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 35.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MaterialButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 50.0),
                          alignment: Alignment.center,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 19.0,
                            ),
                          ),
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {},
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 50.0),
                          alignment: Alignment.center,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: Text(
                            'Save',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 19.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0.0,
            right: 0.0,
            left: 0.0,
            height: 135.0,
            child: ShoppingHeader(),
          ),
        ],
      ),
    );
  }
}
