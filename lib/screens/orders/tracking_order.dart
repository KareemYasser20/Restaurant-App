import 'package:flutter/material.dart';
import 'package:restaurant/shared/colors.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TrackingOrder extends StatefulWidget {
  static const String id = 'TrackingOrder_screen';

  @override
  State<TrackingOrder> createState() => _TrackingOrderState();
}

class _TrackingOrderState extends State<TrackingOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Track your order',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: <Widget>[
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Text(
                    'Chat',
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 20.0,
                    ),
                  ),
                  Icon(
                    Icons.chat,
                    color: primaryColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 30.0),
          ),
          Text(
            'Estimate Delivery Time',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '05:30 PM',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Divider(
              color: Colors.grey.shade200,
            ),
          ),
          GetInfoDelivery(),
          GetOrderTimeLine(),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(bottom: 20.0),
        child: MaterialButton(
          onPressed: () {},
          child: Container(
            padding: EdgeInsets.all(20.0),
            width: MediaQuery.of(context).size.width,
            child: Text(
              'Cancel your order',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(50.0),
            ),
          ),
        ),
      ),
    );
  }
}

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

class GetOrderTimeLine extends StatelessWidget {
  const GetOrderTimeLine({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double heightCon = 90.0;
    return Container(
      color: Colors.grey.shade50,
      margin: EdgeInsets.only(top: 10.0, bottom: 70.0),
      child: Column(
        children: [
          TimeLineWidget(
            heightCon: heightCon,
            text: 'Order confirmed',
          ),
          TimeLineWidget(
            heightCon: heightCon,
            text: 'preparing your order',
          ),
          TimeLineWidget(
            heightCon: heightCon,
            text: 'Order is ready at the restaurant',
          ),
          TimeLineWidget(
            heightCon: heightCon,
            text: 'Rider is picking up your order',
          ),
          TimeLineWidget(
            heightCon: heightCon,
            text: 'Rider is nearby your place',
          ),
        ],
      ),
    );
  }
}

class TimeLineWidget extends StatelessWidget {
  @required
  final double heightCon;
  @required
  final String text;

  TimeLineWidget({this.heightCon, this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightCon,
      child: TimelineTile(
        lineXY: 0.2,
        indicatorStyle: IndicatorStyle(
          height: 1.0,
        ),
        alignment: TimelineAlign.manual,
        endChild: Container(
          padding: EdgeInsets.all(10.0),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );
  }
}
