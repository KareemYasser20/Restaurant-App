import 'package:flutter/material.dart';
import 'package:restaurant/screens/accounts/forget_password.dart';
import 'package:restaurant/screens/accounts/register.dart';
import 'package:restaurant/shared/colors.dart';
import 'package:restaurant/shared/widgets/account_widgets/account_buttons.dart';
import 'package:restaurant/shared/widgets/account_widgets/account_question.dart';
import 'package:restaurant/shared/widgets/account_widgets/default_form_field.dart';
import 'package:toast/toast.dart';
import '../../shared/api/config.dart';
import '../../shared/components/progress.dart';
import 'login_data.dart';



class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  bool showPassword = true;
  bool isLoading = false;
  final _globalKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // loadedData.getCategoryData();
  }

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
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
                        isPasswordTextField: false,
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
                        isPasswordTextField: true,
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
                      isLoading ? circularProgress()
                      : AccountsButton(
                        buttonText: 'Log in',
                        onPressButton: () async {
                                  // login and go to home screen
                                  if (!await checkConnection()) {
                                    Toast.show(
                                        "Please check your internet connection.",
                                        duration: Toast.lengthLong,
                                        gravity: Toast.bottom);
                                  } else if (_globalKey.currentState.validate()) {
                                    setState(() {
                                      
                            isLoading = true;
                                    });
                                    
                                    bool res = await loginUsers(
                                        emailController.text,
                                        passwordController.text,
                                        context);
                                    if (res == false) {
                                      Toast.show(
                                        "Please enter valid Email or password",
                                          duration: Toast.lengthLong,
                                          gravity: Toast.bottom);
                                    }
                                    setState(() {
                                      
                                    isLoading = res;
                                    });

                            print('login Data ------------->');
                            print('User Email is: ${emailController.text}');
                            print('User pass is: ${passwordController.text}');
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
              buttonText: 'Sign  Up',
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