import 'dart:io';

const String apiPath = "http://192.168.1.57:80/restaurant_app/api/"; // 192.168.95.42 - localhost
final String imagesPath = "http://192.168.1.57:80/restaurant_app/images/"; // 192.168.95.42 - localhost
String imageProduct = imagesPath + "products/";

// gUserIdValue => global user id value
String  gCustomerIdValue ;

const String gCustomerId = "customer_id";
const String gCustomerName = "customer_name";
const String gCustomerImage = "customer_image";
const String gCustomerEmail = "customer_email";
const String gCustomerAddress = "customer_address";
const String gCustomerPhone = "customer_phone";

Future<bool> checkConnection()async{
  try{
    final result = await InternetAddress.lookup("google.com");
    if(result.isNotEmpty && result[0].rawAddress.isNotEmpty)
    {
      print("connected");
      return true;
    }else{
      print("No internet connection");
      return false;
    }
  } on SocketException catch(_){
      print("No internet connection");
      return false;
  }
}