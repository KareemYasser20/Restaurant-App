import 'package:flutter/material.dart';
import 'package:restaurant/shared/colors.dart';
import 'package:restaurant/shared/widgets/account_widgets/default_form_field.dart';
import 'package:restaurant/shared/widgets/shopping_screen_header.dart';

class MyProfileScreen extends StatefulWidget {
  static const String id = 'MyProfile_screen';

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  TextEditingController nameController;
  TextEditingController emailController;
  TextEditingController passwordController;
  TextEditingController phoneController;
  bool showPassword = true;
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
                    "Edit Profile",
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          width: 130.0,
                          height: 130.0,
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 4.0,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  spreadRadius: 2.0,
                                  blurRadius: 10.0,
                                  color: Colors.black.withOpacity(0.1),
                                  offset: Offset(0, 10),
                                )
                              ],
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("images/product/burger.jpg"),
                              )),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: () {
                              print("edit test");
                            },
                            child: Container(
                              height: 40.0,
                              width: 40.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: primaryColor,
                                border: Border.all(
                                  width: 4.0,
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                ),
                              ),
                              child: Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 35.0,
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
