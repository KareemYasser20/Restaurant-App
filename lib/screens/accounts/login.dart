import 'package:flutter/material.dart';
import 'package:restaurant/screens/home/home_screen.dart';
import 'package:restaurant/screens/accounts/forgetpassword.dart';
import 'package:restaurant/screens/accounts/register.dart';
import 'package:restaurant/shared/colors.dart';
import 'package:restaurant/shared/widgets/account_widgets/account_buttons.dart';
import 'package:restaurant/shared/widgets/account_widgets/account_question.dart';
import 'package:restaurant/shared/widgets/default_form_field.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  bool showPassword = true;
  final _globalKey = GlobalKey<FormState>();

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
                key: _globalKey,
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
                          'Log in to your account',
                          style: TextStyle(
                            color: primaryColor,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      DefaultFormField(
                        controller: emailController,
                        hintText: 'Email',
                        inputType: TextInputType.emailAddress,
                        isPasswordTextFeild: false,
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
                        obscureValue: true,
                        isPasswordTextFeild: true,
                        showPassword: showPassword,
                        suffixIconFunction: () {
                          setState(() {
                            showPassword = !showPassword;
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
                      Container(
                        alignment: Alignment.bottomRight,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, ForgetPasswordScreen.id);
                          },
                          child: Text(
                            'Forget Password?',
                            style: TextStyle(
                              color: primaryColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      AccountsButton(
                        buttonText: 'Log in',
                        onPressButton: () {
                          // login and go to home screen
                          if (_globalKey.currentState.validate()) {
                            print('login Data ------------->');
                            print('User Email is: ${emailController.text}');
                            print('User pass is: ${passwordController.text}');
                            Navigator.pushNamed(context, HomeScreen.id);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            AccountQuestion(
              accountQuestion: "Don't have an account?",
              buttonText: 'Sigin Up',
              onTapButton: () {
              Navigator.pushNamed(context, RegisterScreen.id);
            },
            ),
          ],
        ),
      ),
    );
  }
}