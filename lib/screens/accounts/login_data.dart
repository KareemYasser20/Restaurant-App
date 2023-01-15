import 'dart:convert';
import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../shared/api/config.dart';
import '../home/home_layout.dart';

Future<bool> loginUsers(
    String customerEmail, String customerPassword, BuildContext context) async {
  String url = apiPath + "/customers/login.php?customer_email=" +customerEmail + "&customer_password=" + customerPassword;

  http.Response response = await http.get(url);
  if (json.decode(response.body)["code"] == "200") {
    // Map array = json.decode(response.body)["message"];
    // SharedPreferences preferences = await SharedPreferences.getInstance();
    // preferences.setString(gCustomerId, array["customer_id"]);
    // preferences.setString(gCustomerName, array["customer_name"]);
    // preferences.setString(gCustomerImage, array["customer_image"]);
    // preferences.setString(gCustomerEmail, array["customer_email"]);
    // preferences.setString(gCustomerAddress, array["customer_address"]);
    // preferences.setString(gCustomerPhone, array["customer_phone"]);


    Navigator.pushReplacementNamed(context, HomeLayout.id);

    print("Success to login");
    return true;
  } else {
    print("Fail to login");
    return false;
  }
}