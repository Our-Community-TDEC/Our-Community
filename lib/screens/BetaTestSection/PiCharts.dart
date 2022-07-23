import 'package:final_year_project/logic/voting_logic.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class Pie_Chart_Widget extends StatelessWidget with voting_logic {

  late int person_1_votes = 5, person_2_votes = 5;
  late String person_1_name = "Aksh", person_2_name = "College";

  Map<String, double> datamap = {
    "person_1_name": 1,
    "person_2_name": 2,
  };

  // late Map<String, double> dataMap = {};
  // dataMap[person_1_name] = person_1_votes;

  // Map datamap = new Map<String, double>.fromIterable(letters, numbers);
  // Map datamap = new Map();
  // datamap.putIfAbsent("Aksh", () => 1);


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
                  dataMap: datamap,
                  colorList: colorList,
                  chartRadius: MediaQuery.of(context).size.width / 2,
                  centerText: "Budget",
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () {votted("1");}, child: Text("1")),
                ElevatedButton(onPressed: () {votted("2");}, child: Text("2")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
