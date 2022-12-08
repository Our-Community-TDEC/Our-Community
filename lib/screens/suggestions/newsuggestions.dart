import 'dart:math';

import 'package:flutter/material.dart';
import 'package:final_year_project/logic/emergency_logic.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

abstract class newsuggestions extends StatelessWidget with Emergency_Logic {
  late double Help_Button_Radius,
      Help_Buttons_Padding = 12.5,
      Divider_Thickness = 2.5;

  newsuggestions({super.key});

  @override
  Widget build(BuildContext context) {
    Help_Button_Radius = min((MediaQuery
        .of(context)
        .size
        .width),
        (MediaQuery
            .of(context)
            .size
            .height)) /
        3;
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Container(
        //This contains the whole page
        constraints: const BoxConstraints.expand(),
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black38,
                  child: IconButton(
                    onPressed: () => print('clicked on list'),
                    icon: const Icon(Icons.list),
                    color: Colors.blue,
                  ),
                ),
                Container(
                  width: 200,
                  alignment: Alignment.center,

                  child: const Text(
                    "New Suggestions",
                    style: TextStyle(
                      color: Colors.white38,
                      fontFamily: 'Poppins-SemiBold',

                    ),

                  ),

                ),
              ],
            ),
            Column(
              children: [

                const Divider(
                  thickness: 2,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

