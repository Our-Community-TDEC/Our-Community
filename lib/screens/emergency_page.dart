import 'dart:math';

import 'package:flutter/material.dart';
import 'package:final_year_project/logic/emergency_logic.dart';

class EmergencyPage extends StatelessWidget with Emergency_Logic {
  late double Help_Button_Radius,
      Help_Buttons_Padding = 12.5,
      Divider_Thickness = 2.5;

  @override
  Widget build(BuildContext context) {
    Help_Button_Radius = min((MediaQuery.of(context).size.width),
            (MediaQuery.of(context).size.height)) /
        3;
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Container(
        //This contains the whole page
        constraints: BoxConstraints.expand(),
        padding: EdgeInsets.all(Help_Buttons_Padding),
        child: Column(
          children: [
            Text("New Suggestion",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 30,
                )),
            Divider(
              thickness: 1,
              color: Colors.white,
            ),
            Text("Title",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 20,
                )),
            TextField(),
            Text("Write a short description",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 20,
                )),
            TextField(),
            ElevatedButton(onPressed: () {}, child: Text("Submit"))
          ],
        ),
      ),
    );
  }
}
