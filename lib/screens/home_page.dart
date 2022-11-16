<<<<<<< HEAD
import 'package:flutter/material.dart';
import '../logic/HomePage_logic.dart';

class HomePage extends StatelessWidget with HomePage_Logic {
  Color gradient_top = Color(0xFF2E2F36);
  Color gradient_bot = Color(0xE02E2F36);

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Color(0xFF2E2F36),
      body: Container(
        height: 1000,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          boxShadow: const [
            BoxShadow(
              color: Color(0xFF2C2D31),
              spreadRadius: 15,
              offset: Offset(0, 7),
              // changes position of shadow
            ),
          ],
        ),
      /*   child:const CircleAvatar(
                backgroundImage: NetworkImage('',
                child: Icon(Icons.add)),
                radius: 1.0
              
            ), */
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
            Text("Maintenance",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,)),
            Text("New Suggestion",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
            Text("Complaint",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
            Text("Notice",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
            Text("Voting",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
            Text("Services",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
            Text("Setting",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
            Text("Help",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
            Text("Feedback",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
            Text('logout',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
            Text('Theme',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
          ],),
          ),
      );
}
}

=======
import 'dart:math';
import 'package:final_year_project/screens/Services/Plumber.dart';
import 'package:flutter/material.dart';

import 'package:final_year_project/screens/complain_page.dart';
import 'package:final_year_project/screens/emergency_page.dart';
import 'package:final_year_project/screens/login_page.dart';
import 'package:final_year_project/screens/welcome_page.dart';

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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LogIn()),
                  );
                },
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
>>>>>>> main
