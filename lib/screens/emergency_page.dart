import 'package:flutter/material.dart';
import 'package:final_year_project/logic/emergency_logic.dart';

class EmergencyPage extends StatelessWidget with Emergency_Logic{
  double Help_Button_Radius = 60,
         Help_Buttons_Padding = 12.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Container( //This contains the whole page
        constraints: BoxConstraints.expand(),
        padding: EdgeInsets.all(Help_Buttons_Padding),
        child: Column( //This is to arrange every page element in a column fashion
          children: [
            Row(
              children: [
                Column( //This column is for the 2 texts (maybe unnessesery and might remove.)
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
              ],
            ),
            Column( //This colums will contain 2 rows for the 4 boxes
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(Help_Buttons_Padding),
                      child: CircleAvatar(
                        radius: Help_Button_Radius,
                        backgroundColor: Color.fromARGB(255, 17, 165, 250),
                        child: IconButton(
                          onPressed: () {
                            Medical_Emergency_Help();
                          },
                          icon: Icon(Icons.medical_services),
                          color: Color.fromARGB(66, 265, 265, 265),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(Help_Buttons_Padding),
                      child: CircleAvatar(
                        radius: Help_Button_Radius,
                        backgroundColor: Color.fromARGB(255, 17, 165, 250),
                        child: IconButton(
                          onPressed: () {
                            Electrical_Emergency_Help();
                          },
                          icon: Icon(Icons.electric_bolt),
                          color: Color.fromARGB(66, 265, 265, 265),
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
                      child: CircleAvatar(
                        radius: Help_Button_Radius,
                        backgroundColor: Color.fromARGB(255, 17, 165, 250),
                        child: IconButton(
                          onPressed: () {
                            Car_Emergency_Help();
                          },
                          icon: Icon(Icons.car_crash),
                          color: Color.fromARGB(66, 265, 265, 265),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(Help_Buttons_Padding),
                      child: CircleAvatar(
                        radius: Help_Button_Radius,
                        backgroundColor: Color.fromARGB(255, 17, 165, 250),
                        child: IconButton(
                          onPressed: () {
                            Fire_Emergency_Help();
                          },
                          icon: Icon(Icons.local_fire_department),
                          color: Color.fromARGB(66, 265, 265, 265),
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(
                  thickness: 5,
                  color: Colors.white,
                ),
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
                Divider(
                  color: Colors.white,
                  thickness: 5,
                ),
                RaisedButton(
                  onPressed: () {
                    Emergency_SOS();
                  },
                  child: Text("Emergency SOS"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}