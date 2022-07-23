import 'dart:math' as math;
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
// import 'package:fl_chart/fl_chart.dart';

class Pie_Chart_Widget extends StatelessWidget {

  late int person_1_votes = 2, person_2_votes = 3;
  late String person_1_name = "Aksh", person_2_name = "College";

  Pie_Chart_Widget() {
    person_1_votes = 2;
    person_2_votes = 3;
    person_1_name = "Aksh";
    person_2_name = "College";
  }

  Map<String, double> dataMap = {
    // "person_1_name": person_1_votes,
    "person_1_name": 1,
    "person_2_name": 2,
  };

  List<Color> colorList = [
    Color(0xff000000),
    Color(0xff3BD580),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                PieChart(
                  dataMap: dataMap,
                  colorList: colorList,
                  chartRadius: MediaQuery.of(context).size.width / 2,
                  centerText: "Budget",
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () {}, child: Text("1")),
                ElevatedButton(onPressed: () {}, child: Text("2")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
