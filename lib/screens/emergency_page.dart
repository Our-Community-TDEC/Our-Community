import 'dart:math';

import 'package:flutter/material.dart';
import 'package:final_year_project/logic/emergency_logic.dart';

class EmergencyPage extends StatelessWidget with Emergency_Logic {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(20),
        child: Table(
          defaultColumnWidth: FixedColumnWidth(120.0),
          border: TableBorder.all(
              color: Colors.black, style: BorderStyle.solid, width: 2),
          children: [
            TableRow(
              children: [
                Column(
                  children: [
                    Text("data"),
                  ],
                ),
                Column(
                  children: [
                    Text("data"),
                  ],
                ),
                Column(
                  children: [
                    Text("data"),
                  ],
                ),
              ],
            ),
            TableRow(
              children: [
                Column(
                  children: [
                    Text("data"),
                  ],
                ),
                Column(
                  children: [
                    Text("data"),
                  ],
                ),
                Column(
                  children: [
                    Text("data"),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
