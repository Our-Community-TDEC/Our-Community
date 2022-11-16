import 'dart:math';
import 'package:final_year_project/screens/Services/Plumber.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:final_year_project/screens/complain_page.dart';
import 'package:final_year_project/screens/emergency_page.dart';
import 'package:final_year_project/screens/login_page.dart';
import 'package:final_year_project/screens/welcome_page.dart';

import 'Maintanance/Pay_maintanance.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double minHW = min(
        MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);
    double boxL = minHW * 0.45;
    String email = "aksh.d.4002@gmail.com";
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.home),
                  Text("Home"),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.medical_services),
                  Text("Services: Doctor"),
                ],
              ),
              onTap: () {},
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.water_damage),
                  Text("Services: Plumber"),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Plumber()),
                );
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.electric_bolt),
                  Text("Services: Electrician"),
                ],
              ),
              onTap: () {},
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.paid),
                  Text("Maintenance"),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Pay_maintenance()),
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Hey, " + email,
                style: TextStyle(
                  fontSize: minHW * 0.05,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ElevatedButton(
                onPressed: () => FirebaseAuth.instance.signOut(),
                child: Text(
                  "Logout",
                  style: TextStyle(
                    fontSize: minHW * 0.035,
                  ),
                ),
              )
            ],
          ),
          Text(
            "Welcome to your community",
            style: TextStyle(
              fontSize: minHW * 0.07,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: boxL,
                        width: boxL,
                        child: ElevatedButton(
                            onPressed: () {}, child: Text("Notice Board")),
                      ),
                      SizedBox(
                          height: boxL,
                          width: boxL,
                          child: ElevatedButton(
                              onPressed: () {}, child: Text("Events"))),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                          height: boxL,
                          width: boxL,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ComplainPage()),
                                );
                              },
                              child: Text("Complains"))),
                      SizedBox(
                        height: boxL,
                        width: boxL,
                        child: ElevatedButton(
                            onPressed: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => SuggestionsPage()),
                              // );
                              // TODO: Add suggestions page
                            },
                            child: Text("Suggestions")),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            height: minHW * 0.075,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EmergencyPage()),
                );
              },
              child: Text("EMERGENCY"),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
