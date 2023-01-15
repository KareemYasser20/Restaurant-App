import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/models/cartItem_model.dart';
import 'package:restaurant/models/product_model.dart';
import 'package:restaurant/provider/cart.dart';
import 'package:restaurant/shared/api/config.dart';
import '../../colors.dart';

class DetailsImageWidget extends StatefulWidget {
  final ProductModel prod;
  final Cart myProvide;
  DetailsImageWidget({@required this.prod , this.myProvide});

  @override
  _DetailsImageWidgetState createState() => _DetailsImageWidgetState();
}

class _DetailsImageWidgetState extends State<DetailsImageWidget> {
  int _qty = 0;
  Item item;

  

  _minusQTY(Cart myProv){
    if(_qty != 0 ){
    _qty = _qty -1;
    myProv.removeCart(item);
    }
  }

  _plusQTY(Cart myProv){
    _qty = _qty + 1;
    myProv.addCart(item);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    item = Item(
      itemId: widget.prod.productId,
      itemName: widget.prod.productName,
      itemImage: widget.prod.productImage,
      itemPrice: widget.prod.productPrice,
    );
  }


  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<Cart>(context);
    _qty = myProvider.getCountByItem(item);
    return Container(
      padding: EdgeInsets.only(bottom: 10.0, top: 0.0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade100,
            spreadRadius: 1.0,
            offset: Offset(0, 1),
          )
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50.0),
          bottomRight: Radius.circular(50.0),
        ),
      ),
      child: Column(
        children: [
          CachedNetworkImage(
                imageUrl: imageProduct + widget.prod.productImage,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
                fit: BoxFit.fill,
                height: 350.0,
                width: MediaQuery.of(context).size.width,
              ),

          Padding(
            padding: EdgeInsets.only(top: 25.0),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: primaryColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade100,
                      spreadRadius: 1.0,
                      blurRadius: 1.0,
                      offset: Offset(0, 1),
                    )
                  ],
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: IconButton(
                  icon: FaIcon(
                    FontAwesomeIcons.minus,
                    color: Colors.white,
                  ),
                  onPressed: () {
                  _minusQTY(myProvider);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  _qty.toString(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.0,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: primaryColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade100,
                      spreadRadius: 1.0,
                      blurRadius: 1.0,
                      offset: Offset(0, 1),
                    )
                  ],
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: IconButton(
                  icon: FaIcon(
                    FontAwesomeIcons.plus,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    _plusQTY(myProvider);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

