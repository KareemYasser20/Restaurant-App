import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurant/screens/accounts/login.dart';
import 'package:restaurant/shared/colors.dart';
import 'package:restaurant/shared/widgets/account_widgets/account_buttons.dart';
import 'package:restaurant/shared/widgets/account_widgets/account_question.dart';
import 'package:restaurant/shared/widgets/account_widgets/default_form_field.dart';
import 'package:image_picker/image_picker.dart';

class RegisterScreen extends StatefulWidget {
  static const String id = 'register_screen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController  = new TextEditingController();
  TextEditingController emailController  = new TextEditingController();
  TextEditingController addressController  = new TextEditingController();
  TextEditingController passwordController  = new TextEditingController();
  TextEditingController phoneController  = new TextEditingController();
  bool showPassword = true;
  PickedFile _imageFile; // this variable will store image will be select from camera or gallery
  final ImagePicker _picker = ImagePicker();
  final _globalKey = GlobalKey<FormState>(); 

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile;
    });
  }

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
                          'Create your account',
                          style: TextStyle(
                            color: primaryColor,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      imageProfile(),

                      SizedBox(
                        height: 15.0,
                      ),
                      
                      DefaultFormField(
                        controller: nameController,
                        hintText: 'User Name',
                        isPasswordTextField: false,
                        inputType: TextInputType.text,
                        validatorFunction: (String value) {
                          if (value.isEmpty) {
                            return 'Please enter the user name';
                          }
                          
                        },
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
                          return null;
                        },
                      ),
                     
                      DefaultFormField(
                        controller: addressController,
                        hintText: 'Address',
                        isPasswordTextField: false,
                        inputType: TextInputType.text,
                        validatorFunction: (String value) {
                          if (value.isEmpty) {
                            return 'Please enter valid Address';
                          }
                          return null;
                        },
                      ),
                      
                      DefaultFormField(
                        controller: passwordController,
                        hintText: 'Password',
                        isPasswordTextField: true,
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
                        isPasswordTextField: false,
                        showPassword: showPassword,
                        inputType: TextInputType.text,
                        validatorFunction: (String value) {
                          if (value.isEmpty || value != passwordController.text ) {
                            return "the password and Confirm Password doesn't match";
                          }
                          return null;
                        },
                      ),
                      
                      DefaultFormField(
                        controller: phoneController,
                        hintText: 'Phone',
                        isPasswordTextField: false,
                        inputType: TextInputType.number,
                        validatorFunction: (String value) {
                          if (value.isEmpty || value.length < 11) {
                            return 'Please enter valid number';
                          }
                          return null;
                        },
                      ),
                    

                    AccountsButton(
                      buttonText: 'Sign  Up',
                       onPressButton: () {
                          if(_globalKey.currentState.validate()){
                            print('User Data ------------->');
                            print('User image is: ${_imageFile.path.toString()}');
                            print('User Name is: ${nameController.text}');
                            print('User Email is: ${emailController.text}');
                            print('User Address is: ${addressController.text}');
                            print('User pass is: ${passwordController.text}');
                            print('User phone is: ${phoneController.text}');
                          }
                        },
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

            AccountQuestion(
              accountQuestion: "Already have an account?",
              buttonText: 'Login',
              onTapButton: () {
                      Navigator.pushNamed(context, LoginScreen.id);
                    },
                ),
     
          ],
        ),
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 20.0,
      ),
      child: Column(
        children: [
          Text(
            'Choose profile photo',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FlatButton.icon(
                icon: Icon(Icons.camera),
                onPressed: () {
                  takePhoto(ImageSource.camera);
                },
                label: Text('Camera'),
              ),
              FlatButton.icon(
                icon: Icon(Icons.image),
                onPressed: () {
                  takePhoto(ImageSource.gallery);
                },
                label: Text('Gallery'),
              ),
            ],
          ),
        ],
      ),
    );
    
  }

  Widget imageProfile(){
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 70.0,
            backgroundImage: _imageFile ==null ? AssetImage("images/product/burger.jpg"): FileImage(File(_imageFile.path)),
          ),
          Positioned(
            bottom: 0.0,
            right: 0.0,
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  builder: (context) => bottomSheet(),
                  context: context,
                );
              },
              child: Container(
                height: 45.0,
                width: 45.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: primaryColor,
                  border: Border.all(
                    width: 4.0,
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                ),
                child: Icon(
                  Icons.camera_alt,
                  size: 28.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
 
  }


}