import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:our_community/razer_pay.dart';
import 'package:our_community/screens/Complain%20Pages/OtherComplains.dart';
import 'package:our_community/screens/NoticeBoard_page.dart';
import 'package:our_community/screens/Services/Doctor.dart';
import 'package:our_community/screens/register/register.dart';
import 'package:our_community/screens/suggestions/Show_Suggestion.dart';
import 'package:our_community/screens/theme/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:our_community/screens/login_page.dart';
import 'package:our_community/screens/voting_page.dart';

import '../screens/emergency_page.dart';
import 'Admin/show_complaint.dart';
import 'Complain Pages/complain_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  Future<String> getName() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection("user")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    return snapshot.get("userName");
  }

  @override
  Widget build(BuildContext context) {
    double minHW = min(
        MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);
    double boxL = minHW * 0.42;
    final user = FirebaseAuth.instance.currentUser!;
    String email = user.email!;
    double square_pad = 10;

    FirebaseAuth userauthdata = FirebaseAuth.instance;
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // DocumentSnapshot snapshot = firestore
    //     .collection("users")
    //     .doc(userauthdata.currentUser?.uid)
    //     .snapshots() as DocumentSnapshot;

    // var userdata = snapshot.data as DocumentSnapshot;
    // String username = userdata["userName"];

    double offset_val = 2.5;

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
                  Icon(Icons.paid),
                  Text("Theme"),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Theme1()),
                );
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.paid),
                  Text("Razer"),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => razer_pay()),
                );
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.paid),
                  Text("LogOut"),
                ],
              ),
              onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LogIn()),
                );
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.paid),
                  Text("Voting"),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Voting_Page()),
                );
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.paid),
                  Text("Complaint"),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => show_complaint()),
                );
              },
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            // color: Colors.black87,
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color.fromARGB(217, 46, 47, 54),
              Color.fromARGB(255, 13, 14, 16),
            ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FutureBuilder<String>(
                      future: getName(),
                      builder: (BuildContext context,
                          AsyncSnapshot<String> snapshot) {
                        if (snapshot.hasData) {
                          return Text("Hello, " + snapshot.data.toString(),
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  fontFamily: 'poppins'));
                        } else if (snapshot.hasError) {
                          return Text("Loading.....");
                        } else {
                          return Text("Loading...");
                        }
                      },
                    ),
                  ],
                ),
                Text(
                  "Welcome to your community",
                  style: TextStyle(
                    fontSize: minHW * 0.07,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
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
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(),
                            ),
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Notice_Board_Page()),
                                  );
                                },
                                child: Text("NoticeBoard")),
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(square_pad)),
                        SizedBox(
                            height: boxL,
                            width: boxL,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(),
                              ),
                              child: ElevatedButton(
                                  onPressed: () {}, child: Text("Events")),
                            )),
                      ],
                    ),
                    Padding(padding: EdgeInsets.all(square_pad)),
                    Row(
                      children: [
                        SizedBox(
                            height: boxL,
                            width: boxL,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(),
                              ),
                              child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ComplainPage()),
                                    );
                                  },
                                  child: Text("Complains")),
                            )),
                        Padding(padding: EdgeInsets.all(square_pad)),
                        SizedBox(
                          height: boxL,
                          width: boxL,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(),
                            ),
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            show_suggestion()),
                                  );
                                },
                                child: Text("Suggestions")),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: minHW * 0.15,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(),
                ),
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
            ),
          ],
        ),
      ),
    );
  }
}