import 'dart:math';

import 'package:flutter/material.dart';
import 'package:final_year_project/logic/emergency_logic.dart';

class SuggestionsList extends StatelessWidget with Emergency_Logic {
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
            Text("Suggestions"),
            Divider(
              thickness: 1,
            ),
            Row(
              children: [
                //TODO: Add an Image
                Image.asset('2147.jpeg'),
                // Text("Img"),
                Column(
                  children: [
                    Text("Aksh Desai"),
                    Text("Garden"),
                  ],
                )
              ],
            ),
            Card(
              child: Text(
                  "Hey, this is Aksh and, I have an idea by which we can improve out Garden in our society."),
            ),
          ],
        ),
      ),
    );
  }
}
