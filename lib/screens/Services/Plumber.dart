import 'package:flutter/material.dart';

import '../../logic/services/plumber/PLumber_logic.dart';

class Plumber extends StatelessWidget with Plumber_logic {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back),
      ),
      backgroundColor: Colors.grey[800],
      body: Container(
        child: Column(children: [
          Row(children: [
            Image.asset('assets/Images/Services/Plumber/background.png'),
          ]),
          Row(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Select Services",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 428,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: (() {
                          Drainage();
                        }),
                        style: ElevatedButton.styleFrom(
                            primary: Color((0xffb4D4E54))),
                        child: SizedBox(
                          width: 60,
                          height: 106,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.asset(
                                'assets/Images/Services/Plumber/image 71.png',
                                width: 60,
                                height: 40,
                              ),
                              Column(
                                children: [
                                  Text("Drainage"),
                                  Text("System"),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: (() {
                          Repair();
                        }),
                        style: ElevatedButton.styleFrom(
                            primary: Color((0xffb4D4E54))),
                        child: SizedBox(
                          width: 60,
                          height: 106,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.asset(
                                'assets/Images/Services/Plumber/image 73.png',
                                width: 60,
                                height: 40,
                              ),
                              Column(
                                children: [
                                  Text("Repair"),
                                  Text("Pipe"),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: (() {
                          Fitting();
                        }),
                        style: ElevatedButton.styleFrom(
                            primary: Color((0xffb4D4E54))),
                        child: SizedBox(
                          width: 60,
                          height: 106,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.asset(
                                'assets/Images/Services/Plumber/image 76.png',
                                width: 60,
                                height: 40,
                              ),
                              Column(
                                children: [
                                  Text("Fitting"),
                                  Text("Pipe"),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                      child: Text(
                        "Data",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
              ],
            ),
            // Next part
          ]),
        ]),
      ),
    );
  }
}
