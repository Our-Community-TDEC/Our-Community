import 'dart:math';
import 'package:flutter/material.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:our_community/logic/emergency_logic.dart';
import 'package:our_community/logic/notification.dart';
import 'package:our_community/nuemorphism/border_effect.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../nuemorphism/colors.dart';

class EmergencyPage extends StatefulWidget {
  @override
  State<EmergencyPage> createState() => _EmergencyPageState();
}

class _EmergencyPageState extends State<EmergencyPage> with sendnotification {
  @override
  initState() {
    super.initState();
    getPreference();
  }

  bool isDark = false;

  getPreference() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.containsKey("Theme")) {
      setState(() {
        isDark = pref.getBool("Theme")!;
      });
    }
    print(isDark);
    // themeF(isDark);
  }

  late double Help_Button_Radius,
      Help_Buttons_Padding = 13.5,
      Divider_Thickness = 2;

  @override
  Widget build(BuildContext context) {
    final theme = isDark ? DarkTheme() : WhiteTheme();
    Help_Button_Radius = min((MediaQuery.of(context).size.width),
            (MediaQuery.of(context).size.height)) /
        2.8;
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 95),
        child: NeumorphicFloatingActionButton(
          onPressed: () => {Navigator.pop(context)},
          child: Icon(
            Icons.arrow_back,
            color: isDark ? HexColor.icon_color : HexColor.WiconColor,
          ),
          style: theme.back_button,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      body: Container(
        decoration: theme.background_color,
        //This contains the whole page
        constraints: BoxConstraints.expand(),
        // padding: EdgeInsets.all(Help_Buttons_Padding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //This is to arrange every page element in a column fashion
          children: [
            // Padding(padding: EdgeInsets.all(0)),
            Column(
              //This column is for the 2 texts (maybe unnessesery and might remove.)
              children: [
                Text(
                  "Emergency",
                  style: TextStyle(
                    fontFamily: 'Poppins-SemiBold',
                    color: isDark ? HexColor.text_color : HexColor.WblueText,
                    fontWeight: FontWeight.w600,
                    fontSize: 35,
                  ),
                ),
                Text(
                  "Contact Emergency Services\nAnd Run Automated Actions",
                  style: TextStyle(
                    fontFamily: 'Poppins-medium',
                    color: isDark ? HexColor.text_color : HexColor.WblueText,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            // Divider(
            //   thickness: Divider_Thickness,
            //   color: Colors.white,
            // ),
            Column(
              //This colums will contain 2 rows for the 4 boxes
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
                          onPressed: () async {
                            sendNotificationToAllUsers(
                                "Medical Saftey Emeregency");
                            // await FlutterPhoneDirectCaller.callNumber('102');
                            final Uri url = Uri(
                              scheme: 'tel',
                              path: '102',
                            );
                            if (await canLaunchUrl(url)) {
                              await launchUrl(url);
                            } else {
                              print("can't launch");
                            }
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
                              Text("Medical Emergency",
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
                          onPressed: () async {
                            sendNotificationToAllUsers(
                                "Fire Saftey Emeregency");
                            // await FlutterPhoneDirectCaller.callNumber('101');
                            final Uri url = Uri(
                              scheme: 'tel',
                              path: '101',
                            );
                            if (await canLaunchUrl(url)) {
                              await launchUrl(url);
                            } else {
                              print("can't launch");
                            }
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
                              Text("Fire Emeregency",
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
                          onPressed: () async {
                            sendNotificationToAllUsers(
                                "Police Saftey Emeregency");
                            // await FlutterPhoneDirectCaller.callNumber('100');
                            final Uri url = Uri(
                              scheme: 'tel',
                              path: '100',
                            );
                            if (await canLaunchUrl(url)) {
                              await launchUrl(url);
                            } else {
                              print("can't launch");
                            }
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
                              Text("Police",
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
                          onPressed: () async {
                            sendNotificationToAllUsers(
                                "Woman Saftey Emeregency");
                            // await FlutterPhoneDirectCaller.callNumber('181');
                            final Uri url = Uri(
                              scheme: 'tel',
                              path: '181',
                            );
                            if (await canLaunchUrl(url)) {
                              await launchUrl(url);
                            } else {
                              print("can't launch");
                            }
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
                              Text("Women Safety",
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
                // Divider(
                //   thickness: Divider_Thickness,
                //   color: Colors.white,
                // ),
                // Column(
                //   mainAxisAlignment: MainAxisAlignment.end,
                //   children: [
                //     Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //       children: [
                //         Column(
                //           children: [
                //             CircleAvatar(
                //               backgroundColor:
                //                   Color.fromARGB(255, 17, 165, 250),
                //               child: IconButton(
                //                 onPressed: () async {
                //                   await FlutterPhoneDirectCaller.callNumber(
                //                       '9316343387');
                //                 },
                //                 icon: Icon(Icons.local_police),
                //                 color: Color.fromARGB(66, 265, 265, 265),
                //               ),
                //             ),
                //             Text(
                //               "Police",
                //               style: TextStyle(
                //                 fontFamily: 'Poppins-medium',
                //                 color: Colors.white,
                //                 fontSize: 15,
                //               ),
                //             ),
                //           ],
                //         ),
                //         Column(
                //           children: [
                //             CircleAvatar(
                //               backgroundColor:
                //                   Color.fromARGB(255, 17, 165, 250),
                //               child: IconButton(
                //                 onPressed: () async {
                //                   await FlutterPhoneDirectCaller.callNumber(
                //                       '9316343387');
                //                 },
                //                 icon: Icon(Icons.medical_services_outlined),
                //                 color: Color.fromARGB(66, 265, 265, 265),
                //               ),
                //             ),
                //             Text(
                //               "Ambulance",
                //               style: TextStyle(
                //                 fontFamily: 'Poppins-medium',
                //                 color: Colors.white,
                //                 fontSize: 15,
                //               ),
                //             ),
                //           ],
                //         ),
                //         Column(
                //           children: [
                //             CircleAvatar(
                //               backgroundColor:
                //                   Color.fromARGB(255, 17, 165, 250),
                //               child: IconButton(
                //                 onPressed: () async {
                //                   await FlutterPhoneDirectCaller.callNumber(
                //                       '9316343387');
                //                 },
                //                 icon: Icon(Icons.security),
                //                 color: Color.fromARGB(66, 265, 265, 265),
                //               ),
                //             ),
                //             Text(
                //               "Security",
                //               style: TextStyle(
                //                 fontFamily: 'Poppins-medium',
                //                 color: Colors.white,
                //                 fontSize: 15,
                //               ),
                //             ),
                //           ],
                //         ),
                //         Column(
                //           children: [
                //             CircleAvatar(
                //               backgroundColor:
                //                   Color.fromARGB(255, 17, 165, 250),
                //               child: IconButton(
                //                 onPressed: () async {
                //                   await FlutterPhoneDirectCaller.callNumber(
                //                       '9316343387');
                //                 },
                //                 icon: Icon(Icons.door_back_door_outlined),
                //                 color: Color.fromARGB(66, 265, 265, 265),
                //               ),
                //             ),
                //             Text(
                //               "Main Gate",
                //               style: TextStyle(
                //                 fontFamily: 'Poppins-medium',
                //                 color: Colors.white,
                //                 fontSize: 15,
                //               ),
                //             ),
                //           ],
                //         ),
                //       ],
                //     ),
                //   ],
                // ),
                // Divider(
                //   color: Colors.white,
                //   thickness: Divider_Thickness,
                // ),
                ElevatedButton(
                  onPressed: () async {
                    await FlutterPhoneDirectCaller.callNumber('108');
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
