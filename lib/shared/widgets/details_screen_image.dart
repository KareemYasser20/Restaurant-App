import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../colors.dart';

class DetailsImageWidget extends StatefulWidget {
  final String image;
  DetailsImageWidget({@required this.image});

  @override
  _DetailsImageWidgetState createState() => _DetailsImageWidgetState();
}

class _DetailsImageWidgetState extends State<DetailsImageWidget> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
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
          Image.asset(
            widget.image,
            height: 350.0,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
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
                    setState(() {
                      counter--;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  counter.toString(),
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
                    setState(() {
                      counter++;
                    });
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

