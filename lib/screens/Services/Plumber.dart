import 'package:flutter/material.dart';

class Plumber extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Container(
        child: Column(children: [
          Row(children: [
            Image.asset('assets/Images/Services/Plumber/background.png'),
          ]),
          Row(children: [
            Column(
              children: [
                Row(
                  children: [Text("Select Services")],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(children: [
                        Row(
                          children: [
                            //image
                          ],
                        ),
                        Row(
                          children: [Text("Drainage system")],
                        ),
                      ]),
                    ),
                    Row(children: [
                      Row(
                        children: [
                          //image
                        ],
                      ),
                      Row(
                        children: [Text("Repair pipe")],
                      ),
                    ]),
                    Container(
                      child: Row(children: [
                        Row(
                          children: [
                            //image
                          ],
                        ),
                        Row(
                          children: [Text("Fitting Pipe")],
                        ),
                      ]),
                    ),
                  ],
                )
              ],
            ),
            // Next part
          ]),
        ]),
      ),
    );
  }
}
