// ignore_for_file: prefer_const_constructors

import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:our_community/logic/notification.dart';
import 'package:our_community/nuemorphism/colors.dart';
import 'package:our_community/razer_pay.dart';
import 'package:our_community/screens/NoticeBoard_page.dart';
import 'package:our_community/screens/Services/Doctor.dart';
import 'package:our_community/screens/chat/chatpage.dart';
import 'package:our_community/screens/emergency_page.dart';
import 'package:our_community/screens/event.dart';
import 'package:our_community/screens/onboard.dart';
import 'package:our_community/screens/profile_page.dart';
import 'package:our_community/screens/search_page.dart';
import 'package:our_community/screens/suggestions/Show_Suggestion.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:our_community/screens/login_page.dart';
import 'package:our_community/screens/voting_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../nuemorphism/border_effect.dart';
import 'Admin/show_complaint.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'Services/Cleaning.dart';
import 'Services/Electric.dart';
import 'Services/Plumber.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'Services/admins/A_Cleaning.dart';
import 'Services/admins/A_Doctor.dart';
import 'Services/admins/A_Electric.dart';
import 'Services/admins/A_Plumber.dart';
import 'add_home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with sendnotification {
  static String role = "";
  Future<String> getName() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection("user")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    return snapshot.get("userName");
  }

  Future<String> getRole() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection("user")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    role = snapshot.get("role");
    print(role);
    return snapshot.get("role");
  }

  // ignore: prefer_typing_uninitialized_variables
  // late ThemeInterface theme;
  bool isDark = false;
  WhiteTheme theme = WhiteTheme();
  // var theme;
  var text_style;
  var user_name_style;
  var welcome_color = HexColor.WBlackButton;
  themeF(isDark) {
    print("Themef" + isDark.toString());
    if (false) {
      // DarkTheme theme = DarkTheme();
      // theme = null;
      // theme = DarkTheme();

      setState(() {
        welcome_color = HexColor.text_color;
        text_style = TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w500,
            color: Colors.white,
            fontFamily: 'poppins');

        user_name_style = TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.white,
            fontFamily: 'poppins');
      });
    } else {}
    setState(() {
      theme = WhiteTheme();
      welcome_color = HexColor.WblueText;
      text_style = TextStyle(
        fontSize: 19,
        fontWeight: FontWeight.w500,
        color: HexColor.WblueText,
        fontFamily: 'poppins',
      );
      user_name_style = TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: HexColor.WblackText,
        fontFamily: 'poppins',
      );
    });
  }

  // promptForPrivacyConsent() async {
  //   await OneSignal.shared
  //       .promptUserForPushNotificationPermission(fallbackToSettings: true);

  //   bool userConsent = await OneSignal.shared.userProvidedPrivacyConsent();
  //   if (userConsent) {
  //     print("User granted privacy consent");
  //   } else {
  //     print("User did not grant privacy consent");
  //   }
  //   // Check if the user has already provided privacy consent
  //   bool userProvidedPrivacyConsent =
  //       await OneSignal.shared.userProvidedPrivacyConsent();
  //   if (userProvidedPrivacyConsent) {
  //     print("User has already provided privacy consent");
  //   }

  //   // Prompt the user for privacy consent
  // }

  Future<void> getPreference() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.containsKey("Theme")) {
      isDark = pref.getBool("Theme")!;
    }
    // await promptForPrivacyConsent();
    themeF(isDark);
  }

  @override
  initState() {
    // TODO: implement initState
    super.initState();
    getPreference();
    getName();
    getRole();
    subscribeUserForNotifications();
  }

  Future<void> subscribeUserForNotifications() async {
    // Check if the user has provided privacy consent
    bool userProvidedPrivacyConsent =
        await OneSignal.shared.userProvidedPrivacyConsent();
    if (!userProvidedPrivacyConsent) {
      print(
          "User has not provided privacy consent yet. Cannot subscribe for notifications.");
      return;
    }

    // Prompt the user to enable notifications
    await OneSignal.shared.promptUserForPushNotificationPermission();

    // Retrieve the user's device token
    String deviceToken = await OneSignal.shared
        .getDeviceState()
        .then((deviceState) => deviceState!.userId!);

    // Subscribe the user to notifications
    await FirebaseFirestore.instance
        .collection('user')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .set({'notification_tokens': deviceToken}, SetOptions(merge: true));
  }

  bool isUser = true;
  setrole() {
    if (role == "user") {
      isUser = true;
    } else if (role == "admin") {
      isUser = false;
    }
  }

  // WhiteTheme theme = new WhiteTheme();

  @override
  Widget build(BuildContext context) {
    setrole();
    double minHW = min(
        MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);
    double boxL = minHW * 0.42;
    final user = FirebaseAuth.instance.currentUser!;
    String? name = user.displayName;
    String email = user.email!;
    double square_pad = 10;

    FirebaseAuth userauthdata = FirebaseAuth.instance;
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    double offset_val = 2.5;
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(0,0,0,95),
        child:  NeumorphicFloatingActionButton(
              onPressed: () => {Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchPage()),
                  )},
              child: Icon(
                Icons.search,
              ),
              style: NeumorphicStyle(
                  boxShape: NeumorphicBoxShape.circle(),
                  color: HexColor.Wbackground_color),
            ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      appBar: theme.appbar,
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
              ExpansionTile(
                title: Text("Services"),
                leading: Icon(Icons.assignment_late_outlined), //add icon
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
                      role == "plumber"
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => A_Plumber()),
                            )
                          : Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Plumber()),
                            );
                    },
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        Icon(Icons.water_damage),
                        Text("Electrician"),
                      ],
                    ),
                    onTap: () {
                      role == "electrician"
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => A_Electric()),
                            )
                          : Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Electritian()),
                            );
                    },
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        Icon(Icons.water_damage),
                        Text("Cleaner"),
                      ],
                    ),
                    onTap: () {
                      role == "cleaner"
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => A_Cleaning()),
                            )
                          : Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Cleaning()),
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
                      role == "doctor"
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => A_Doctor()),
                            )
                          : Navigator.push(
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
                    Icon(Icons.account_circle_outlined),
                    Text("OnBorad"),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OnBoard()),
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
                        value: isDark,
                        // width: 90,
                        textOn: 'Light',
                        textOff: 'Dark',
                        colorOn: Colors.grey,
                        colorOff: Colors.blue,
                        iconOn: Icons.lightbulb_outline,
                        iconOff: Icons.nightlight_outlined,
                        animationDuration: const Duration(milliseconds: 300),
                        onChanged: (isDark) async {
                          var pref = await SharedPreferences.getInstance();
                          pref.setBool("Theme", isDark);
                          print("$isDark");
                          themeF(isDark);
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
      body: Container(
        padding: EdgeInsets.all(minHW * 0.05),
        decoration: theme.background_color,
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
                  "Welcome to your community",
                  style: TextStyle(
                    fontSize: minHW * 0.07,
                    fontWeight: FontWeight.bold,
                    color: welcome_color,
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
                                            AttendanceCalendarPage(
                                          studentId: 'w',
                                          sub: 'w',
                                        ),
                                      ),
                                    );
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/Images/home/noticeboard.svg',
                                        semanticsLabel: 'My SVG Image',
                                      ),
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
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Event(),
                                      ),
                                    );
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/Images/home/event.svg',
                                        semanticsLabel: 'My SVG Image',
                                      ),
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
                                      SvgPicture.asset(
                                        'assets/Images/home/complaints.svg',
                                        semanticsLabel: 'My SVG Image',
                                      ),
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
                                      SvgPicture.asset(
                                        'assets/Images/home/suggestion.svg',
                                        semanticsLabel: 'My SVG Image',
                                      ),
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
                    //   Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => EmergencyPage()),
                    // );
                    sendNotificationToAllUsers("It is an emeregency");
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

  // Future<void> sendNotificationToAllUsers(String message) async {
  //   // Check if the user has provided privacy consent
  //   bool userProvidedPrivacyConsent =
  //       await OneSignal.shared.userProvidedPrivacyConsent();
  //   if (!userProvidedPrivacyConsent) {
  //     print(
  //         "User has not provided privacy consent yet. Cannot send notification.");
  //     return;
  //   }

  //   // Retrieve all users from the 'users' collection in Firestore
  //   QuerySnapshot userSnapshot =
  //       await FirebaseFirestore.instance.collection('user').get();

  //   // Extract the user IDs from the snapshot
  //   // List<String> userIds = [];
  //   // userSnapshot.docs.forEach((doc) {
  //   //   userIds.add(doc.data()["notification_tokens"].toString());
  //   //   print(doc.id);
  //   // });

  //   List<String> playerIds = [];
  //   userSnapshot.docs.forEach((doc) {
  //     Map<String, dynamic> userData = doc.data() as Map<String, dynamic>;
  //     String? playerId = userData['notification_tokens'] as String?;
  //     if (playerId != null) {
  //       playerIds.add(playerId);
  //     }
  //   });

  //   // Send the notification to all users using OneSignal
  //   var response = await OneSignal.shared.postNotification(
  //     OSCreateNotification(
  //       playerIds: playerIds,
  //       content: message,
  //     ),
  //   );
  // }
}

class Launch extends StatefulWidget {
  const Launch({super.key});

  @override
  State<Launch> createState() => _LaunchState();
}

class _LaunchState extends State<Launch> {
  int index = 0;
  late ThemeInterface theme;
  var icon_color = HexColor.WBlackButton;
  var navigation_back_color = HexColor.WBlackButton;
  var navigation_color = HexColor.WBlackButton;
  bool isDark = false;
  getPreference() async {
    var pref = await SharedPreferences.getInstance();
    isDark = pref.getBool("Theme")!;
    themeF(isDark);
  }

  @override
  initState() {
    super.initState();
    getPreference();
  }

  themeF(isDark) {
    if (isDark) {
      icon_color = HexColor.icon_color;
      navigation_back_color = HexColor.background_end;
      navigation_color = HexColor.background_top;
      theme = DarkTheme();
    } else {
      icon_color = HexColor.WiconColor;
      navigation_back_color = HexColor.Wbackground_color;
      navigation_color = HexColor.Wnavigation_bar_color;
      theme = WhiteTheme();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 60.0,
        backgroundColor: navigation_back_color,
        animationDuration: Duration(milliseconds: 500),
        color: navigation_color,
        items: <Widget>[
          Icon(
            Icons.home_work_outlined,
            size: 30,
            color: icon_color,
          ),
          Icon(
            Icons.chat_bubble_outline,
            size: 30,
            color: icon_color,
          ),
          Icon(
            Icons.account_circle_outlined,
            size: 30,
            color: icon_color,
          ),
        ],
        onTap: (selectedIndex) {
          setState(() {
            index = selectedIndex;
          });
        },
      ),
      body: getSelectedWidget(index: index),
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
