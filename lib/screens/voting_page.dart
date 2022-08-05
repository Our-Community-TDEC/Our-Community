import 'package:final_year_project/logic/voting_logic.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class Voting_Page extends StatelessWidget with voting_logic {
  late int person_1_votes = 0, person_2_votes = 0;
  late String person_1_name = "Aksh", person_2_name = "College";

  Map<String, double> datamap = {
    "person_1_name": 1,
    "person_2_name": 1,
    "person_3_name": 1,
    "person_4_name": 1,
    "person_5_name": 1,
  };

  List<Color> colorList = [
    Color(0xff531CB3),
    Color(0xff944BBB),
    Color(0xffAA7BC3),
    Color(0xffCC92C2),
    Color(0xffDBA8AC),
  ];

  Widget build(BuildContext context) {
    int mapSize = datamap.length;
    print("Map Length = $mapSize");
    datamap.clear();
    datamap["Aksh"] = 100;
    datamap["🐼"] = 135;
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
                ElevatedButton(
                    onPressed: () {
                      votted("1");
                    },
                    child: Text("1")),
                ElevatedButton(
                    onPressed: () {
                      votted("2");
                    },
                    child: Text("2")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
