import 'dart:math';

import 'package:flutter/material.dart';
import 'package:final_year_project/logic/emergency_logic.dart';

class SuggestionsList extends StatelessWidget with Emergency_Logic {
  late double Help_Button_Radius,
      Help_Buttons_Padding = 12.5,
      Divider_Thickness = 2.5;

  SuggestionsList({super.key});

  @override
  Widget build(BuildContext context) {
    Help_Button_Radius = min((MediaQuery.of(context).size.width),
            (MediaQuery.of(context).size.height)) /
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
            Row(
              children: [
                //TODO: Add an Image
                Image.asset('2147.jpeg'),
                // Text("Img"),
                Column(
                  children: const [
                    Text("Darshan Bhuva"),
                    Text("Garden"),
                  ],
                )
              ],
            ),
            const Card(
              child: Text(
                  "Hi,I am Prushti. I have one idea to improve our society facilities."),
            ),
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black38,

                  child: IconButton(
                    onPressed: () => print('clicked on list'),
                    icon: const Icon(Icons.check_circle_outline),
                    color: Colors.blue,
                    padding: const EdgeInsets.all(5),
                  ),
                ),

                CircleAvatar(
                  backgroundColor: Colors.black38,
                  child: IconButton(
                    onPressed: () => print('clicked on list'),
                    icon: const Icon(Icons.cancel_outlined),
                    color: Colors.blue,

                  ),
                ),
              ],
            ),


            const Divider(
              thickness: 2,
            ),
            Row(
              children: [
                //TODO: Add an Image
                Image.asset('2147.jpeg'),
                // Text("Img"),
                Column(
                  children: const [
                    Text("Darshan Bhuva"),
                    Text("Parking"),
                  ],
                )
              ],
            ),
            const Card(
              child: Text(
                  "Hi,I am Prushti. I have one idea to improve our society facilities."),
            ),
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black38,

                  child: IconButton(
                    onPressed: () => print('clicked on list'),
                    icon: const Icon(Icons.check_circle_outline),
                    color: Colors.blue,
                    padding: const EdgeInsets.all(5),
                  ),
                ),

                CircleAvatar(
                  backgroundColor: Colors.black38,
                  child: IconButton(
                    onPressed: () => print('clicked on list'),
                    icon: const Icon(Icons.cancel_outlined),
                    color: Colors.blue,

                  ),
                ),
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
