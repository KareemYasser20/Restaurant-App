import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'package:path/path.dart' as path;
import 'package:restaurant/shared/api/config.dart';


Future<bool> uploadFileWithData(
   { dynamic imageFile,
    Map arrInsert,
    String urlPage,
    BuildContext context,
    Widget Function() movePage,
    String type}) async {
  if (imageFile == null) {
    await saveData( arrInsert:  arrInsert, urlPage:  urlPage, context:  context, movePage: movePage, type:  type);
    return false;
  }
  var stream = http.ByteStream(DelegatingStream.typed(imageFile.openRead()));

  var length = await imageFile.length();
  String url = apiPath + "$urlPage?";
  var uri = Uri.parse(url);
  print(uri.path);
  var request = new http.MultipartRequest("POST", uri);
  var multipartFile = new http.MultipartFile("file", stream, length,
      filename: path.basename(imageFile.path));
  for (var entry in arrInsert.entries) {
    request.fields[entry.key] = entry.value;
  }

  request.files.add(multipartFile);
  var response = await request.send();

  if (response.statusCode == 200) {
    print("Send succefull");
    if (type == "update") {
      Navigator.pop(context);
    } else if (type == "insert") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => movePage()));
    }
    return true;
  } else {
    print("not send");
    return false;
    
  }
}

Future<bool> saveData({Map arrInsert, String urlPage, BuildContext context,
    Widget Function() movePage, String type}) async {
  String url = apiPath + "$urlPage?" ;

  http.Response respone = await http.post(url, body: arrInsert);
  if (json.decode(respone.body)["code"] == "200") {
    if (type == "insert") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => movePage()));
    } else {
      Navigator.pop(context);
    }
    print("success");
    return true;
  } else {
    print("Failer");
    return false;
  }
}

Future<List> getData({  int start, int end, String urlPage, String strSearch, String param}) async {
  String url = apiPath + "$urlPage?$param&txtsearch=$strSearch&start=$start&end=$end";
  print(url);
  http.Response respone = await http.get(url);

  if (json.decode(respone.body)["code"] == "200") 
  {
    
      List arr = (json.decode(respone.body)["message"]);
      print(arr);
      return arr;
    
  }else{
    print("Fail to load Category data");
    return null;
  }
}