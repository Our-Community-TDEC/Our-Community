import 'dart:math';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:our_community/screens/Complain%20Pages/OtherComplains.dart';
import 'package:flutter/material.dart';
import 'package:our_community/logic/complain_logic.dart';

class ComplainPage extends StatelessWidget with Complain_Logic {
  @override
  Widget build(BuildContext context) {
    double fullheight = MediaQuery.of(context).size.height;
    double fullwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Column(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 25, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                    Padding(
                      padding: EdgeInsets.fromLTRB(fullwidth / 5, 0, 0, 0),
                      child: Text(
                        "Complaint",
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Divider(
                  thickness: 5,
                  indent: 12,
                  endIndent: 12,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 370,
            height: fullheight - 112,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 68,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.local_parking,
                          size: 40,
                        ),
                        Text(
                          "Parking Issuee",
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  child: SizedBox(
                    height: 68,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(
                            Icons.lightbulb,
                            size: 40,
                          ),
                          Text(
                            "Street light Issuee",
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 68,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.water_drop,
                          size: 40,
                        ),
                        Text(
                          "Water Issuee",
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 68,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.gas_meter,
                          size: 40,
                        ),
                        Text(
                          "Gas pipeline Issuee",
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 68,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.drag_indicator,
                          size: 40,
                        ),
                        Text(
                          "Drainage Issuee",
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 68,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.electric_bolt,
                          size: 40,
                        ),
                        Text(
                          "Electricity Issuee",
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 68,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.add_road,
                          size: 40,
                        ),
                        Text(
                          "Road Issuee",
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 68,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OtherComplains()));
                    },
                    style: ElevatedButton.styleFrom(
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.only(
                            topLeft: Radius.circular(44),
                            bottomRight: Radius.circular(44)),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.emoji_emotions,
                          size: 40,
                        ),
                        Text(
                          "Other Complaint",
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
