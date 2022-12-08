import 'dart:math';
import 'package:flutter/material.dart';
import 'package:final_year_project/logic/emergency_logic.dart';

class EmergencyPage extends StatelessWidget with Emergency_Logic {
  late double Help_Button_Radius,
      Help_Buttons_Padding = 12.5,
      Divider_Thickness = 2;

  
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
<<<<<<< HEAD
        margin: EdgeInsets.all(20),
        child: Table(
          defaultColumnWidth: FixedColumnWidth(120.0),
          border: TableBorder.all(
              color: Colors.black, style: BorderStyle.solid, width: 2),
          children: [
            TableRow(
              children: [
                Column(
                  children: [
                    Text("data"),
                  ],
                ),
                Column(
                  children: [
                    Text("data"),
                  ],
                ),
                Column(
                  children: [
                    Text("data"),
                  ],
                ),
              ],
            ),
            TableRow(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(Help_Buttons_Padding),
                      child: SizedBox(
                        height: Help_Button_Radius,
                        width: Help_Button_Radius,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(32.0),
                            ),
                          ),
                          onPressed: () {
                            Medical_Emergency_Help();
                            shownotification();
                          },
                          // child: Icon(Icons.medical_services),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Icon(
                                Icons.medical_services,
                                color: Color.fromARGB(63, 255, 255, 255),
                                size: Help_Button_Radius * 0.75,
                              ),
                              Text("Medical Help",
                                  textScaleFactor: 1.5,
                                  textAlign: TextAlign.center,
                                  style:
                                      TextStyle(fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(Help_Buttons_Padding),
                      child: SizedBox(
                        height: Help_Button_Radius,
                        width: Help_Button_Radius,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(32.0),
                            ),
                          ),
                          onPressed: () {
                            Electrical_Emergency_Help();
                          },
                          // child: Icon(Icons.medical_services),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Icon(
                                Icons.electric_bolt,
                                color: Color.fromARGB(63, 255, 255, 255),
                                size: Help_Button_Radius * 0.75,
                              ),
                              Text("Electrical Help",
                                  textScaleFactor: 1.5,
                                  textAlign: TextAlign.center,
                                  style:
                                      TextStyle(fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(Help_Buttons_Padding),
                      child: SizedBox(
                        height: Help_Button_Radius,
                        width: Help_Button_Radius,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(32.0),
                            ),
                          ),
                          onPressed: () {
                            Car_Emergency_Help();
                          },
                          // child: Icon(Icons.medical_services),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Icon(
                                Icons.car_crash,
                                color: Color.fromARGB(63, 255, 255, 255),
                                size: Help_Button_Radius * 0.75,
                              ),
                              Text("Car Help",
                                  textScaleFactor: 1.5,
                                  textAlign: TextAlign.center,
                                  style:
                                      TextStyle(fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(Help_Buttons_Padding),
                      child: SizedBox(
                        height: Help_Button_Radius,
                        width: Help_Button_Radius,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(32.0),
                            ),
                          ),
                          onPressed: () {
                            Fire_Emergency_Help();
                          },
                          // child: Icon(Icons.medical_services),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Icon(
                                Icons.local_fire_department_rounded,
                                color: Color.fromARGB(63, 255, 255, 255),
                                size: Help_Button_Radius * 0.75,
                              ),
                              Text("Fire Help",
                                  textScaleFactor: 1.5,
                                  textAlign: TextAlign.center,
                                  style:
                                      TextStyle(fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text("data"),
                  ],
                ),
              ],
            ),
=======
        //This contains the whole page
        constraints: BoxConstraints.expand(),
        padding: EdgeInsets.all(Help_Buttons_Padding),
        child: Column(
          children: [
            Text("New Suggestion",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 30,
                )),
            Divider(
              thickness: 1,
              color: Colors.white,
            ),
            Text("Title",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 20,
                )),
            TextField(),
            Text("Write a short description",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 20,
                )),
            TextField(),
            ElevatedButton(onPressed: () {}, child: Text("Submit"))
>>>>>>> 2663f534a7ecd2ecb2a008f9e4d6defcda1f21f3
          ],
        ),
      ),
    );
  }
}
