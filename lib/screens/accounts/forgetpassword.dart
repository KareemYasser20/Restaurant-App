import 'package:flutter/material.dart';
import 'package:restaurant/shared/colors.dart';
import 'package:restaurant/shared/widgets/default_form_field.dart';

class ForgetPasswordScreen extends StatefulWidget {
  static const String id = 'ForgetPassword_screen';
  const ForgetPasswordScreen({ Key key }) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController emailController;
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
                    SizedBox(height: 25.0,),

                    DefaultFormField(
                      controller: emailController,
                      hintText: 'Email',
                      inputType: TextInputType.emailAddress,
                      validatorFunction: (String value) {
                        if (value.isEmpty || value.indexOf(".") == -1 || value.indexOf("@") == -1 ) {
                          return 'Please enter valid Email';
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 20.0,),

                    MaterialButton(
                      onPressed: () {
                        
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
                              'Send',
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
           ],
        ),
      ),
    );
  }
}