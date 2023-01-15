import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/provider/load_data.dart';
import 'package:restaurant/shared/colors.dart';


class Statistics extends StatefulWidget {
  const Statistics({Key key}) : super(key: key);
  static const String id = 'Stat_screen';

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LoadData>(
      builder: (context, data, child) {
        return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(80.0),
        child: Center(
          child: Container(
            child: Column(
              children: [
                Text("Total Orders : ${data.getTotalOrder()} " , 
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 20.0
                ),
                ),

                
                Text("Total Prices : ${data.getTotalPrice()} " , 
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 20.0
                ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
      }
    );

    
  }
}