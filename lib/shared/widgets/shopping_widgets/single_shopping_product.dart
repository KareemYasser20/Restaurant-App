import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/models/cartItem_model.dart';
import 'package:restaurant/provider/cart.dart';
import 'package:restaurant/shared/api/config.dart';
import '../../colors.dart';

class SingleShoppingProduct extends StatelessWidget {
  final Item item;

  SingleShoppingProduct(
      {this.item});
  @override
  Widget build(BuildContext context) {
    var provid = Provider.of<Cart>(context);
    final String imageShoppingProduct = imagesPath + "products/";
    return Card(
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: Icon(
              Icons.cancel,
              color: primaryColor,
            ),
          ),
          Container(
            child: ListTile(
              title: Text(
                item.itemName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              subtitle: Text(
                item.itemPrice.toString(),
                style: TextStyle(),
              ),
              leading: Container(
                width: 50.0,
                child: CachedNetworkImage(
                  imageUrl: imageShoppingProduct + item.itemImage,
                  fit: BoxFit.cover,
                  imageBuilder: (context , imageProvider)=>Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: imageProvider , fit: BoxFit.cover
                      )
                    ),
                  ),
                  // BoxShape: BoxShape.circle,
                ),
                decoration: BoxDecoration(
                  
                  shape: BoxShape.circle,
                ),
              ),
              trailing: Container(
                width: 90.0,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        provid.addCart(item);
                      },
                      child: Container(
                        padding: EdgeInsets.all(5.0),
                        child: FaIcon(
                          FontAwesomeIcons.plus,
                          color: Colors.white,
                          size: 18.0,
                        ),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        provid.getCountByItem(item).toString(),
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        provid.removeCart(item);
                      },
                      child: Container(
                        padding: EdgeInsets.all(5.0),
                        child: FaIcon(
                          FontAwesomeIcons.minus,
                          color: Colors.white,
                          size: 18.0,
                        ),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
