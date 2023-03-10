// ignore_for_file: prefer_const_constructors

import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:our_community/nuemorphism/colors.dart';
import 'package:our_community/razer_pay.dart';
import 'package:our_community/screens/Maintanance/Pay_maintanance.dart';
import 'package:our_community/screens/NoticeBoard_page.dart';
import 'package:our_community/screens/Services/Doctor.dart';
import 'package:our_community/screens/chat/chatpage.dart';
import 'package:our_community/screens/profile_page.dart';
import 'package:our_community/screens/suggestions/Show_Suggestion.dart';
import 'package:our_community/screens/testCal.dart';
import 'package:our_community/screens/theme/theme.dart';
import 'package:our_community/screens/theme/MyApp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:our_community/screens/login_page.dart';
import 'package:our_community/screens/voting_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../nuemorphism/border_effect.dart';
import '../screens/emergency_page.dart';
import 'Admin/show_complaint.dart';
import 'Complain Pages/complain_page.dart';
import 'Services/Plumber.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

import 'add_home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<String> getName() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection("user")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    return snapshot.get("userName");
  }

  bool isSwitched = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getTheme();
  }

  WhiteTheme theme = new WhiteTheme();

  var text_style = TextStyle(
      fontSize: 19,
      fontWeight: FontWeight.w600,
      color: HexColor.WblueText,
      fontFamily: 'poppins');
  @override
  Widget build(BuildContext context) {
    double minHW = min(
        MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);
    double boxL = minHW * 0.42;
    final user = FirebaseAuth.instance.currentUser!;
    String? name = user.displayName;
    String email = user.email!;
    double square_pad = 10;

    FirebaseAuth userauthdata = FirebaseAuth.instance;
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    var user_name_style = TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: HexColor.WblackText,
        fontFamily: 'poppins');

    // DocumentSnapshot snapshot = firestore
    //     .collection("users")
    //     .doc(userauthdata.currentUser?.uid)
    //     .snapshots() as DocumentSnapshot;

    // var userdata = snapshot.data as DocumentSnapshot;
    // String username = userdata["userName"];
    double offset_val = 2.5;

    return Scaffold(
      
      appBar: NeumorphicAppBar(
        title: Text("Home Page",
        style: TextStyle(color: Colors.blueAccent)
        ),
        padding: 10,
        centerTitle: true,
        color: HexColor.Wbackground_color,
        textStyle:
            TextStyle(color: HexColor.WblueText, fontWeight: FontWeight.w700),
        buttonStyle: NeumorphicStyle(
          color: HexColor.Wbackground_color,
          boxShape: NeumorphicBoxShape.circle(),
          shadowLightColor: HexColor.backButtonLight,
          shadowDarkColor: HexColor.backButtonDark,
          depth: 5,
        ),
        iconTheme: IconThemeData(color: HexColor.WblueText),
      ),
      drawer: Neumorphic( 
        style: NeumorphicStyle(
          shadowDarkColor: HexColor.Wdrawer,
        ),
        child: Drawer(
          shadowColor: Colors.transparent,
          backgroundColor: HexColor.Wbackground_color,
          child: ListView(
            children: [
              ListTile(
                title: Row(
                  children: [
                    Icon(Icons.home,
                    color: Colors.blueAccent,),
                    Text(" Home",
                      style: TextStyle(
                        color: Colors.blueAccent,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
              ),
              ExpansionTile(
                title: Text("Services",style: TextStyle(color: Colors.blueAccent,),),
                leading: Icon(Icons.assignment_late_outlined,color: Colors.blueAccent,), //add icon
                childrenPadding: EdgeInsets.only(left: 30), //children padding
                children: [
                  ListTile(
                    title: Row(
                      children: [
                        Icon(Icons.water_damage),
                        Text("Plumber"),
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
                        Icon(Icons.water_damage),
                        Text("Doctor"),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Doctor()),
                      );
                    },
                  ),
                ],
              ),

              // ListTile(
              //   title: Row(
              //     children: [
              //       Icon(Icons.bedtime_outlined),
              //       Text("Theme"),
              //     ],
              //   ),
              //   onTap: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(builder: (context) => Theme1()),
              //     );
              //   },
              // ),
              // ListTile(
              //   title: Row(
              //     children: [
              //       Icon(Icons.bedtime_outlined),
              //       Text("MyApp"),
              //     ],
              //   ),
              //   onTap: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(builder: (context) => MyApp()),
              //     );
              //   },
              // ),
              ListTile(
                title: Row(
                  children: [
                    Icon(Icons.bedtime_outlined),
                    Text("Add Home"),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddHome()),
                  );
                },
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
                    MaterialPageRoute(builder: (context) => razer_pay()),
                  );
                },
              ),
              ListTile(
                title: Row(
                  children: [
                    Icon(Icons.how_to_vote_outlined),
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
                    Icon(Icons.report_problem_outlined),
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
              ListTile(
                title: Row(
                  children: [
                    Icon(Icons.account_circle_outlined),
                    Text("Profile"),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Profile()),
                  );
                },
              ),
              ListTile(
                title: Row(
                  children: [
                    Icon(Icons.messenger_outline),
                    Text("Chat"),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => chatpage(email: email)),
                  );
                },
              ),
              ListTile(
                title: Row(
                  children: [
                    Icon(Icons.logout),
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
                    SizedBox(
                      height: 30,
                      child: LiteRollingSwitch(
                        value: isSwitched,
                        // width: 90,
                        textOn: 'Dark',
                        textOff: 'Light',
                        colorOn: Colors.grey,
                        colorOff: Colors.blue,
                        iconOn: Icons.lightbulb_outline,
                        iconOff: Icons.nightlight_outlined,
                        animationDuration: const Duration(milliseconds: 300),
                        onChanged: (isSwitched) async {
                          var pref = await SharedPreferences.getInstance();
                          pref.setBool("Theme", isSwitched);
                          print("$isSwitched");
                        },
                        onTap: () {},
                        onDoubleTap: () {},
                        onSwipe: () {},
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body:
       Container(
        padding: EdgeInsets.all(minHW * 0.05),
        decoration: BoxDecoration(color: HexColor.Wbackground_color),
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
                              style: user_name_style);
                        } else if (snapshot.hasError) {
                          return Text(
                            name!,
                            style: user_name_style,
                          );
                        } else {
                          return Text("Loading...");
                        }
                      },
                    ),
                  ],
                ),
                Text(
                  "Welcome to our community",
                  style: TextStyle(
                    fontSize: minHW * 0.07,
                    fontWeight: FontWeight.bold,
                    color: HexColor.WblackText,
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
                        Container(
                          height: boxL,
                          width: boxL,
                          decoration: theme.homepage_button_out,
                          child: SizedBox(
                            height: boxL - 4,
                            width: boxL - 4,
                            child: ClipRRect(
                              borderRadius:
                                  new BorderRadius.all(Radius.circular(44)),
                              child: NeumorphicButton(
                                  style: theme.homepage_button,
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            Notice_Board_Page(),
                                      ),
                                    );
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text("NoticeBoard", style: text_style),
                                    ],
                                  )),
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(square_pad)),
                        Container(
                          height: boxL,
                          width: boxL,
                          decoration: theme.homepage_button_out,
                          child: SizedBox(
                            height: boxL - 4,
                            width: boxL - 4,
                            child: ClipRRect(
                              borderRadius:
                                  new BorderRadius.all(Radius.circular(44)),
                              child: NeumorphicButton(
                                  style: theme.homepage_button,
                                  onPressed: () {
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (context) =>
                                    //         Notice_Board_Page(),
                                    //   ),
                                    // )
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text("Event", style: text_style),
                                    ],
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(padding: EdgeInsets.all(square_pad)),
                    Row(
                      children: [
                        Container(
                          height: boxL,
                          width: boxL,
                          decoration: theme.homepage_button_out,
                          child: SizedBox(
                            height: boxL - 4,
                            width: boxL - 4,
                            child: ClipRRect(
                              borderRadius:
                                  new BorderRadius.all(Radius.circular(44)),
                              child: NeumorphicButton(
                                  style: theme.homepage_button,
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => show_complaint(),
                                      ),
                                    );
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text("Complains", style: text_style),
                                    ],
                                  )),
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(square_pad)),
                        Container(
                          height: boxL,
                          width: boxL,
                          decoration: theme.homepage_button_out,
                          child: SizedBox(
                            height: boxL - 4,
                            width: boxL - 4,
                            child: ClipRRect(
                              borderRadius:
                                  new BorderRadius.all(Radius.circular(44)),
                              child: NeumorphicButton(
                                  style: theme.homepage_button,
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => show_suggestion(),
                                      ),
                                    );
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text("Suggestions", style: text_style),
                                    ],
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // SizedBox(
            //   width: MediaQuery.of(context).size.width * 0.8,
            //   height: minHW * 0.15,
            //   child: Container(
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(25),
            //       border: Border.all(),
            //     ),
            //     child: ElevatedButton(
            //       onPressed: () {
            //         Navigator.push(
            //           context,
            //           MaterialPageRoute(builder: (context) => EmergencyPage()),
            //         );
            //       },
            //       child: Text("EMERGENCY"),
            //       style: ButtonStyle(
            //         backgroundColor: MaterialStateProperty.all(Colors.red),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  // void getTheme() async {
  //   var pref = await SharedPreferences.getInstance();
  //   isSwitched = pref.getBool("Theme")!;
  // }
}

class Launch extends StatefulWidget {
  const Launch({super.key});

  @override
  State<Launch> createState() => _LaunchState();
}

class _LaunchState extends State<Launch> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 60.0,
        backgroundColor: HexColor.Wbackground_color,
        animationDuration: Duration(milliseconds: 500),
        color: HexColor.Wnavigation_bar_color,
        items: <Widget>[
          Icon(Icons.home_work_outlined, size: 30),
          Icon(Icons.chat_bubble_outline, size: 30),
          Icon(Icons.account_circle_outlined, size: 30),
        ],
        onTap: (selectedIndex) {
          setState(() {
            index = selectedIndex;
          });
        },
      ),
      body:getSelectedWidget(index: index) ,
    );
  }
    Widget getSelectedWidget({required int index}) {
    final user = FirebaseAuth.instance.currentUser!;
    String email = user.email!;
    Widget widget;
    switch (index) {
      case 0:
        widget = HomePage();
        break;
      case 1:
        widget = chatpage(email: email);
        break;
      case 2:
        widget = Profile();
        break;
      default:
        widget = HomePage();
        break;
    }
    return widget;
  }
}
