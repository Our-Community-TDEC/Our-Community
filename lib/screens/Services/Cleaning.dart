import 'package:flutter/material.dart';

import '../../logic/services/plumber/PLumber_logic.dart';
import '../../nuemorphism/colors.dart';

class Cleaning extends StatelessWidget with Plumber_logic {
  const Cleaning({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor.Wbackground_color,
      body: Container(
        child: Column(children: [
          Row(children: [
            Image.asset('assets/Images/Services/Clean/clean.png'),
          ]),
          Row(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
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
                            primary: const Color((0xffb4D4E54))),
                        child: SizedBox(
                          width: 60,
                          height: 106,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.asset(
                                'assets/Images/Services/Clean/vacume.png',
                                width: 60,
                                height: 40,
                              ),
                              Column(
                                children: const [
                                  Text(" Domestic"),
                                  Text("Clean"),
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
                            primary: const Color((0xffb4D4E54))),
                        child: SizedBox(
                          width: 60,
                          height: 106,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.asset(
                                'assets/Images/Services/Clean/vacume_1.png',
                                width: 60,
                                height: 40,
                              ),
                              Column(
                                children: const [
                                  Text("General"),
                                  Text("Clean"),
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
                            primary: const Color((0xffb4D4E54))),
                        child: SizedBox(
                          width: 60,
                          height: 106,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.asset(
                                'assets/Images/Services/Clean/bright.png',
                                width: 60,
                                height: 40,
                              ),
                              Column(
                                children: const [
                                  Text("Decor"),
                                  Text("Clean"),
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
                  children: const [
                    Padding(
                      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
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
