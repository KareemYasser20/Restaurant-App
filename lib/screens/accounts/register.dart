import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurant/shared/colors.dart';
import 'package:restaurant/shared/widgets/default_form_field.dart';

import 'login.dart';

class RegisterScreen extends StatefulWidget {
  static const String id = 'register_screen';
  const RegisterScreen({Key key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController;
  TextEditingController emailController;
  TextEditingController passwordController;
  TextEditingController phoneController;
  bool showPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Form(
                child: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  child: ListView(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 5.0),
                        margin: EdgeInsets.only(bottom: 25.0),
                        child: Text(
                          'Create your account',
                          style: TextStyle(
                            color: primaryColor,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DefaultFormField(
                        controller: nameController,
                        hintText: 'User Name',
                        isPasswordTextFeild: false,
                        inputType: TextInputType.text,
                        validatorFunction: (String value) {
                          if (value.isEmpty) {
                            return 'Please enter the user name';
                          }
                          return null;
                        },
                      ),
                      DefaultFormField(
                        controller: emailController,
                        hintText: 'Email',
                        isPasswordTextFeild: false,
                        inputType: TextInputType.emailAddress,
                        validatorFunction: (String value) {
                          if (value.isEmpty ||
                              value.indexOf(".") == -1 ||
                              value.indexOf("@") == -1) {
                            return 'Please enter valid Email';
                          }
                          return null;
                        },
                      ),
                      DefaultFormField(
                        controller: passwordController,
                        hintText: 'Password',
                        isPasswordTextFeild: true,
                        showPassword: showPassword,
                        suffixIconFunction: () {
                          setState(() {
                            showPassword = !showPassword;
                          });
                        },
                        obscureValue: true,
                        inputType: TextInputType.text,
                        validatorFunction: (String value) {
                          if (value.isEmpty || value.length < 4) {
                            return 'Please enter valid password more than 4 character';
                          }
                          return null;
                        },
                      ),
                      DefaultFormField(
                        hintText: 'Confirm Password',
                        obscureValue: true,
                        isPasswordTextFeild: false,
                        showPassword: showPassword,
                        // showPassword: showPassword,
                        // suffixIconFunction: () {
                        //   setState(() {
                        //     showPassword = !showPassword;
                        //   });
                        // },
                        inputType: TextInputType.text,
                        validatorFunction: (String value) {
                          if (value.isEmpty ||
                              value == passwordController.text) {
                            return 'the password and Confirm Password doesnot match';
                          }
                          return null;
                        },
                      ),
                      DefaultFormField(
                        controller: phoneController,
                        hintText: 'Phone',
                        isPasswordTextFeild: false,
                        inputType: TextInputType.number,
                        validatorFunction: (String value) {
                          if (value.isEmpty || value.length < 10) {
                            return 'Please enter valid number';
                          }
                          return null;
                        },
                      ),
                      MaterialButton(
                        onPressed: () {},
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: Text(
                            'Sigin Up',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.0,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        margin: EdgeInsets.only(top: 20.0),
                        child: Text(
                          'By clicking Sign up you agree the our \n               Terms and Condition.',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, LoginScreen.id);
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
