import 'dart:math';

import 'package:flutter/material.dart';
import 'package:final_year_project/logic/complain_logic.dart';

class ComplainPage extends StatelessWidget with Complain_Logic {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[800],
        body: Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(Icons.local_parking),
                        Text("Parking Issue")
                      ],
                    )),
                ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(Icons.lightbulb),
                      Text("Street Light Issue"),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(Icons.water_drop),
                      Text("Water Issue"),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(Icons.gas_meter),
                      Text("Gas Pipline Issue"),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(Icons.drag_indicator), //TODO: find better icon
                      Text("Drainage Issue"),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(Icons.electric_bolt),
                      Text("Electricity Issue"),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(Icons.remove_road),
                      Text("Road Issue"),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(Icons.emoji_emotions),
                      Text("Other Complains"),
                    ],
                  ),
                ),
              ],
            ),
          ],
        )));
  }
}
