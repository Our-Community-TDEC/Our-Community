import 'dart:math';

import 'package:flutter/material.dart';
import 'package:final_year_project/logic/OtherComplaints_logic.dart';

class OtherComplains extends StatelessWidget with OtherComplains_Logic {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[800],
        body: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.black38,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                          child: IconButton(
                            onPressed: () => {
                             
                            },
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
                              "Other Complaint",
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
              thickness: 2.5,
              color: Colors.black,
              indent: 10,
              endIndent: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(11, 0, 0, 0),
                  child: Text(
                    "Title",
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: SizedBox(
                width: 450,
                // height: 300,
                child: TextField(
                  decoration: InputDecoration(
                      labelText: "Complain title",
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(borderSide: BorderSide.none)),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(11, 20, 0, 0),
                  child: Text(
                    "Write short discription",
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
            SizedBox(
              // height: 200,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                child: TextField(
                  decoration: InputDecoration(
                      labelText: "Enter Your Concern Here!!!",
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                      )),
                ),
              ),
              width: 450,
            ),
            SizedBox(
              width: 341,
              height: 78,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: ElevatedButton(
                  onPressed: () {
                    RaiseComplain();
                  },
                  style: ElevatedButton.styleFrom(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(44.0),
                    ),
                  ),
                  child: Text(
                    "Raise Complain",
                    style: TextStyle(fontSize: 26),
                  ),
                ),
              ),
            ),
          ],
        )));
  }
}
