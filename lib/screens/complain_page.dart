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
                  )
                ),
                ElevatedButton(
                    onPressed: () {}, child: Text("Street Light Issue")),
                ElevatedButton(onPressed: () {}, child: Text("Water Issue")),
                ElevatedButton(
                    onPressed: () {}, child: Text("Gas Pipline Issue")),
                ElevatedButton(onPressed: () {}, child: Text("Drainage Issue")),
                ElevatedButton(
                    onPressed: () {}, child: Text("Electrical Issue")),
                ElevatedButton(onPressed: () {}, child: Text("Road Issue")),
              ],
            ),
          ],
        )));
  }
}
