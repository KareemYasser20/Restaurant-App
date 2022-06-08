import 'package:flutter/material.dart';
import 'package:restaurant/shared/widgets/track_order_widgets/timeline_widget.dart';

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
