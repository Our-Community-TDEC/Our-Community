import 'package:flutter/material.dart';
import 'package:final_year_project/logic/suggestion_logic.dart';


class suggestion extends StatelessWidget with suggestion_logic {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[800],
        body: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.black38,
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                                  child: IconButton(
                                    onPressed: () => {Navigator.pop(context)},
                                    icon: Icon(
                                      Icons.arrow_back_ios,
                                      color: Color.fromARGB(255, 0, 141, 241),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 400,
                                child: Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Complaint",
                                      style: TextStyle(
                                          fontSize: 32,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    )),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 1.5,
                      color: Colors.black,
                      indent: 10,
                      endIndent: 10,
                    ),
                    Container(
                      width: 379,
                      height: 60,
                      child: ElevatedButton(
                          onPressed: () {
                            // parkingIssue();
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Row(
                                  children: [
                                    Icon(Icons.local_parking),
                                    Padding(
                                      padding:
                                      const EdgeInsets.fromLTRB(15, 0, 0, 0),
                                      child: Text(
                                        "Parking Issuee",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                    ),
                    Container(
                      width: 379,
                      height: 60,
                      child: ElevatedButton(
                          onPressed: () {
                            // StreetLightIssue();
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Row(
                                  children: [
                                    Icon(Icons.lightbulb),
                                    Padding(
                                      padding:
                                      const EdgeInsets.fromLTRB(15, 0, 0, 0),
                                      child: Text(
                                        "Street light Issuee",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                    ),
                    Container(
                      width: 379,
                      height: 60,
                      child: ElevatedButton(
                          onPressed: () {
                            // WaterIssue();
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Row(
                                  children: [
                                    Icon(Icons.water_drop),
                                    Padding(
                                      padding:
                                      const EdgeInsets.fromLTRB(15, 0, 0, 0),
                                      child: Text(
                                        "Water Issuee",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                    ),
                    Container(
                      width: 379,
                      height: 60,
                      child: ElevatedButton(
                          onPressed: () {
                            // GasLineIssue();
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Row(
                                  children: [
                                    Icon(Icons.gas_meter),
                                    Padding(
                                      padding:
                                      const EdgeInsets.fromLTRB(15, 0, 0, 0),
                                      child: Text(
                                        "Gas pipeline Issuee",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                    ),
                    Container(
                      width: 379,
                      height: 60,
                      child: ElevatedButton(
                          onPressed: () {
                            // DrainageIssue();
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Row(
                                  children: [
                                    Icon(Icons.drag_indicator),
                                    Padding(
                                      padding:
                                      const EdgeInsets.fromLTRB(15, 0, 0, 0),
                                      child: Text(
                                        "Drainage Issuee",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                    ),
                    Container(
                      width: 379,
                      height: 60,
                      child: ElevatedButton(
                          onPressed: () {
                            // ElecricalIssue();
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Row(
                                  children: [
                                    Icon(Icons.electric_bolt),
                                    Padding(
                                      padding:
                                      const EdgeInsets.fromLTRB(15, 0, 0, 0),
                                      child: Text(
                                        "Electricity Issuee",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                    ),
                    Container(
                      width: 379,
                      height: 60,
                      child: ElevatedButton(
                          onPressed: () {
                            // RoadIssue();
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Row(
                                  children: [
                                    Icon(Icons.add_road),
                                    Padding(
                                      padding:
                                      const EdgeInsets.fromLTRB(15, 0, 0, 0),
                                      child: Text(
                                        "Rcc Road Issuee",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                    ),
                    Container(
                      width: 379,
                      height: 60,
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Row(
                                  children: [
                                    Icon(Icons.emoji_emotions),
                                    Padding(
                                      padding:
                                      const EdgeInsets.fromLTRB(15, 0, 0, 0),
                                      child: Text(
                                        "Other Complaint",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              ],
            )));
  }
}



