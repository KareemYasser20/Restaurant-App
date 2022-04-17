import 'package:flutter/material.dart';
import 'package:restaurant/screens/home/home_screen.dart';
import 'package:restaurant/screens/accounts/forgetpassword.dart';
import 'package:restaurant/screens/accounts/register.dart';
import 'package:restaurant/shared/colors.dart';
import 'package:restaurant/shared/widgets/default_form_field.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  const LoginScreen({Key key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController;
  TextEditingController passwordController;
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
                              Navigator.pushNamed(context, ForgetPasswordScreen.id);
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
                    MaterialButton(
                      onPressed: () {
                        Navigator.pushNamed(context, HomeScreen.id);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: Text(
                          'Log in',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
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
                      Navigator.pushNamed(context, RegisterScreen.id);
                    },
                    child: Text(
                      'Sigin Up',
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
