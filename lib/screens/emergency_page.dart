import 'dart:math';

import 'package:flutter/material.dart';
import 'package:final_year_project/logic/emergency_logic.dart';

class EmergencyPage extends StatelessWidget with Emergency_Logic{
  late double Help_Button_Radius,
         Help_Buttons_Padding = 12.5,
         Divider_Thickness = 2.5;

  @override
  Widget build(BuildContext context) {
    Help_Button_Radius = min((MediaQuery.of(context).size.width), (MediaQuery.of(context).size.height)) / 3;
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Container( //This contains the whole page
        constraints: BoxConstraints.expand(),
        padding: EdgeInsets.all(Help_Buttons_Padding),
        child: Column( //This is to arrange every page element in a column fashion
          children: [
            Expanded(
              flex: 2,
              child: Column( //This column is for the 2 texts (maybe unnessesery and might remove.)
                children: [
                  Text(
                    "Emergency",
                    style: TextStyle(
                      fontFamily: 'Poppins-SemiBold',
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 35,
                    ),
                  ),
                  Text(
                    "Contact Emergency Services\nAnd Run Automated Actions",
                    style: TextStyle(
                      fontFamily: 'Poppins-medium',
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: Divider_Thickness,
              color: Colors.white,
            ),
            Expanded(
              flex: 15,
              child: Column( //This colums will contain 2 rows for the 4 boxes
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                            },
                            // child: Icon(Icons.medical_services),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Icon(
                                  Icons.medical_services,
                                  color: Color.fromARGB(63, 255, 255, 255),
                                  size: Help_Button_Radius*0.75,
                                ),
                                Text(
                                  "Medical Help",
                                  textScaleFactor: 1.5,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500
                                  )
                                ),
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
                              Medical_Emergency_Help();
                            },
                            // child: Icon(Icons.medical_services),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Icon(
                                  Icons.electric_bolt,
                                  color: Color.fromARGB(63, 255, 255, 255),
                                  size: Help_Button_Radius*0.75,
                                ),
                                Text(
                                    "Electrical Help",
                                    textScaleFactor: 1.5,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500
                                    )
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                            },
                            // child: Icon(Icons.medical_services),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Icon(
                                  Icons.car_crash,
                                  color: Color.fromARGB(63, 255, 255, 255),
                                  size: Help_Button_Radius*0.75,
                                ),
                                Text(
                                    "Car Help",
                                    textScaleFactor: 1.5,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500
                                    )
                                ),
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
                              Medical_Emergency_Help();
                            },
                            // child: Icon(Icons.medical_services),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Icon(
                                  Icons.local_fire_department_rounded,
                                  color: Color.fromARGB(63, 255, 255, 255),
                                  size: Help_Button_Radius*0.75,
                                ),
                                Text(
                                    "Fire Help",
                                    textScaleFactor: 1.5,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500
                                    )
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: Divider_Thickness,
                    color: Colors.white,
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Color.fromARGB(255, 17, 165, 250),
                                  child: IconButton(
                                    onPressed: () {
                                      Police_Contact();
                                    },
                                    icon: Icon(Icons.local_police),
                                    color: Color.fromARGB(66, 265, 265, 265),
                                  ),
                                ),
                                Text(
                                  "Police",
                                  style: TextStyle(
                                    fontFamily: 'Poppins-medium',
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Color.fromARGB(255, 17, 165, 250),
                                  child: IconButton(
                                    onPressed: () {
                                      Ambulance_Contact();
                                    },
                                    icon: Icon(Icons.medical_services_outlined),
                                    color: Color.fromARGB(66, 265, 265, 265),
                                  ),
                                ),
                                Text(
                                  "Ambulance",
                                  style: TextStyle(
                                    fontFamily: 'Poppins-medium',
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Color.fromARGB(255, 17, 165, 250),
                                  child: IconButton(
                                    onPressed: () {
                                      Security_Contact();
                                    },
                                    icon: Icon(Icons.security),
                                    color: Color.fromARGB(66, 265, 265, 265),
                                  ),
                                ),
                                Text(
                                  "Security",
                                  style: TextStyle(
                                    fontFamily: 'Poppins-medium',
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Color.fromARGB(255, 17, 165, 250),
                                  child: IconButton(
                                    onPressed: () {
                                      MainGate_Contact();
                                    },
                                    icon: Icon(Icons.door_back_door_outlined),
                                    color: Color.fromARGB(66, 265, 265, 265),
                                  ),
                                ),
                                Text(
                                  "Main Gate",
                                  style: TextStyle(
                                    fontFamily: 'Poppins-medium',
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),

                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.white,
                    thickness: Divider_Thickness,
                  ),
                  Expanded(
                    flex: 1,
                    child: ElevatedButton(
                      onPressed: () {
                        Emergency_SOS();
                      },
                      child: Text("Emergency SOS"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}