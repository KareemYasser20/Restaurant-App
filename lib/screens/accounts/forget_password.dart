import 'package:flutter/material.dart';
import 'package:restaurant/screens/accounts/login.dart';
import 'package:restaurant/shared/colors.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:restaurant/shared/widgets/account_widgets/account_buttons.dart';
import 'package:restaurant/shared/widgets/account_widgets/default_form_field.dart';
import 'package:restaurant/shared/widgets/toast_widget/toast_widget.dart';

class ForgetPasswordScreen extends StatefulWidget {
  static const String id = 'ForgetPassword_screen';

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController emailController = new TextEditingController();
  final _globalKey = GlobalKey<FormState>();
  FToast fToast = FToast();

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
                child: ListView(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 5.0),
                      margin: EdgeInsets.only(bottom: 25.0),
                      child: Text(
                        'Forgot Password',
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 5.0),
                      margin: EdgeInsets.only(bottom: 25.0),
                      child: Text(
                        'Please enter your email to receive a link to create a new password via email.',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    DefaultFormField(
                      controller: emailController,
                      hintText: 'Email',
                      isPasswordTextField: false,
                      inputType: TextInputType.emailAddress,
                      validatorFunction: (String value) {
                        if (value.isEmpty ||
                            value.indexOf(".") == -1 ||
                            value.indexOf("@") == -1) {
                          return 'Please enter valid Email';
                        }
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    AccountsButton(
                      buttonText: 'Send',
                      onPressButton: () {
                        fToast.init(context);
                        if (_globalKey.currentState.validate()) {
                          print('user email to reset --->');
                          print('user email : ${emailController.text}');
                          fToast.showToast(
                            child: toastWidget(message :"check your email to change the password" , toastIcon: Icons.info_outline_rounded ,),
                            gravity: ToastGravity.BOTTOM,
                            toastDuration: Duration(seconds: 4),
                          );
                          Navigator.pushNamed(context, LoginScreen.id);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
