import 'package:flutter/material.dart';

import '../../logic/services/plumber/PLumber_logic.dart';

class Plumber extends StatelessWidget with Plumber_logic {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Container(
        child: Column(children: [
          Row(children: [
            Image.asset('assets/Images/Services/Doctor/Doc_ser.png'),
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
                                'assets/Images/Services/Doctor/ste.png',
                                width: 60,
                                height: 40,
                              ),
                              Column(
                                children: const [
                                  Text("Diagnosis"),
                                  Text("treatment"),
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
                                'assets/Images/Services/Doctor/injection.png',
                                width: 60,
                                height: 40,
                              ),
                              Column(
                                children: const [
                                  Text("Information"),
                                  Text("Advice"),
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
                                'assets/Images/Services/Doctor/1st_aid.png',
                                width: 60,
                                height: 40,
                              ),
                              Column(
                                children: const [
                                  Text("Coordinating"),
                                  Text("healthcare"),
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
