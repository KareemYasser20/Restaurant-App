import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';


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
