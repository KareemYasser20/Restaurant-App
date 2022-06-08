import 'package:flutter/material.dart';
import '../../colors.dart';

class GetInfoDelivery extends StatelessWidget {
  const GetInfoDelivery({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.0,
      height: 85.0,
      child: ListTile(
        title: Text("Your Rider"),
        subtitle: Text(
          "Delivery Name",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
            color: Colors.black,
          ),
        ),
        leading: Container(
          width: 55.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("images/product/pizza.jpg"),
            ),
          ),
        ),
        trailing: Container(
          width: 90.0,
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.star_outlined,
                    color: primaryColor,
                  ),
                  Text(
                    '4.0',
                    style: TextStyle(
                      color: primaryColor,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Text(
                  '(124 ratings)',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
