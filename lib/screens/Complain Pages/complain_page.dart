import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:intl/intl.dart';
import 'package:our_community/screens/Complain%20Pages/OtherComplains.dart';
import 'package:our_community/logic/complain_logic.dart';
import '../../nuemorphism/colors.dart';
import '../../nuemorphism/border_effect.dart';
// import 'package:our_community/screens/Complain Pages/OtherComplains.dart';

class ComplainPage extends StatelessWidget with Complain_Logic {
  WhiteTheme theme = WhiteTheme();
  @override
  Widget build(BuildContext context) {
    double fullheight = MediaQuery.of(context).size.height;
    double fullwidth = MediaQuery.of(context).size.width;
    String datetime = (DateFormat.Md('en_US').add_jm().format(DateTime.now()));
    var text_style = TextStyle(
        fontSize: 26, color: HexColor.WblackText, fontWeight: FontWeight.w500);

    void add_data(compaint_title, complaint_desc) async {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      firestore.collection('complaint').doc().set({
        "title": compaint_title,
        "description": complaint_desc,
        "time": datetime,
        "UID": FirebaseAuth.instance.currentUser?.uid
      }).then((result) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Complaint Added Successfully"),
          backgroundColor: Colors.blue,
        ));
      }).catchError((onError) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(onError),
          backgroundColor: Colors.blue,
        ));
      });
      // }
    }

    return Theme(
      data: ThemeData(
        fontFamily: 'poppins',
      ),
      child: Scaffold(
        floatingActionButton: SizedBox(
          height: 45,
          width: 45,
          child: FittedBox(
            child: NeumorphicFloatingActionButton(
              onPressed: () => {Navigator.pop(context)},
              child: Icon(
                Icons.arrow_back,
              ),
              style: NeumorphicStyle(
                  boxShape: NeumorphicBoxShape.circle(),
                  color: HexColor.Wbackground_color),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        backgroundColor: HexColor.Wbackground_color,
        body: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 25, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(fullwidth / 4, 0, 0, 0),
                        child: Text(
                          "Complaint",
                          style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w500,
                              color: HexColor.WblackText),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Divider(
                    thickness: 5,
                    indent: 12,
                    endIndent: 12,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 370,
              height: fullheight - 112,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 72,
                    decoration: theme.com_sugge_out_shadow,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 68,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: NeumorphicButton(
                              style: theme.com_sugge_in_shadow,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => OtherComplains(
                                          "Parking Issue",
                                          "I'm having a parking issue at <enter location>.\nPlease try and have it fixed.")),
                                );
                              },
                              child: Row(
                                children: [
                                  Icon(Icons.local_parking,
                                      size: 40, color: HexColor.WblackText),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 12),
                                    child: Text(
                                      "Parking Issue",
                                      style: text_style,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 72,
                    decoration: theme.com_sugge_out_shadow,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 68,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: NeumorphicButton(
                                style: theme.com_sugge_in_shadow,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => OtherComplains(
                                            "Street Light Issue",
                                            "The street light on <enter location> is not working as intended.\nPlease try and have it fixed.")),
                                  );
                                },
                                child: Row(
                                  children: [
                                     Icon(Icons.lightbulb,
                                        size: 40, color: HexColor.WblackText),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 12),
                                      child: Text(
                                        "Street light Issue",
                                        style: text_style,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ]),
                  ),
                  Container(
                    height: 72,
                    decoration: theme.com_sugge_out_shadow,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 68,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: NeumorphicButton(
                              style: theme.com_sugge_in_shadow,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => OtherComplains(
                                          "Water Issue",
                                          "I live in <enter house number> and am having an water related issue.\nPlease send a plumber.")),
                                );
                              },
                              child: Row(
                                children: [
                                   Icon(Icons.water_drop,
                                      size: 40, color: HexColor.WblackText),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 12),
                                    child: Text(
                                      "Water Issue",
                                      style: text_style,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 72,
                    decoration: theme.com_sugge_out_shadow,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 68,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: NeumorphicButton(
                              style: theme.com_sugge_in_shadow,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => OtherComplains(
                                          "Gaspipline issue",
                                          "I live at <enter house number> and am having an issue with the gas pipeline.\nPlease send someone to fix it.")),
                                );
                              },
                              child: Row(
                                children: [
                                   Icon(Icons.gas_meter,
                                      size: 40, color: HexColor.WblackText),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 12),
                                    child: Text(
                                      "Gaspipeline Issue",
                                      style: text_style,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 72,
                    decoration: theme.com_sugge_out_shadow,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 68,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: NeumorphicButton(
                              style: theme.com_sugge_in_shadow,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => OtherComplains(
                                          "Drainage Issue",
                                          "I noticed a drainage issue at <enter location>.\n<Describe the issue>\nPlease try and have it fixed.")),
                                );
                              },
                              child: Row(
                                children: [
                                   Icon(Icons.drag_indicator,
                                      size: 40, color: HexColor.WblackText),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 12),
                                    child: Text(
                                      "Drainage Issue",
                                      style: text_style,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 72,
                    decoration: theme.com_sugge_out_shadow,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 68,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: NeumorphicButton(
                              style: theme.com_sugge_in_shadow,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => OtherComplains(
                                          "Electricity Issue",
                                          "I'm having an electricity relaed issue at my home,  <enter house number>.\nPlease try and have it fixed.")),
                                );
                              },
                              child: Row(
                                children: [
                                   Icon(Icons.electric_bolt,
                                      size: 40, color: HexColor.WblackText),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 12),
                                    child: Text(
                                      "Electricity Issue",
                                      style: text_style,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 72,
                    decoration: theme.com_sugge_out_shadow,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 68,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: NeumorphicButton(
                              style: theme.com_sugge_in_shadow,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => OtherComplains(
                                          "Road Issue",
                                          "I've noticed an road related issue at <enter location>.\nPlease try and have it fixed.")),
                                );
                              },
                              child: Row(
                                children: [
                                  Icon(Icons.add_road,
                                      size: 40, color: HexColor.WblackText),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 12),
                                    child: Text(
                                      "Road Issue",
                                      style: text_style,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 72,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(44.0),
                        topLeft: Radius.circular(44.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          // color: HexColor.complaint_black.withOpacity(0.40),
                          color: HexColor.black_shadow.withOpacity(0.40),
                          offset: Offset(3, 3),
                          blurRadius: 2,
                          spreadRadius: 1,
                        ),
                        BoxShadow(
                          color: HexColor.blue_shadow.withOpacity(0.25),
                          offset: Offset(-3, -2),
                          blurRadius: 4,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 68,
                          child: ClipRRect(
                            borderRadius: new BorderRadius.only(
                                topLeft: Radius.circular(44),
                                bottomRight: Radius.circular(44)),
                            child: NeumorphicButton(
                              style: NeumorphicStyle(
                                color: HexColor.blue_button,
                                depth: -12,
                                intensity: 12,
                                shape: NeumorphicShape.flat,
                                shadowLightColorEmboss: HexColor
                                    .blue_button_shadow_blue
                                    .withOpacity(0.25),
                                shadowDarkColorEmboss: HexColor
                                    .blue_button_shadow_black
                                    .withOpacity(0.50),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        OtherComplains("", ""),
                                  ),
                                );
                              },
                              child: Row(
                                children: [
                                  Icon(Icons.emoji_emotions,
                                      size: 40, color: HexColor.WblackText),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 12),
                                    child: Text(
                                      "Other Complaint",
                                      style: text_style,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(
                  //   height: 68,
                  //   child: ElevatedButton(
                  //     onPressed: () {
                  //       Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //               builder: (context) => OtherComplains()));
                  //     },
                  //     style: ElevatedButton.styleFrom(
                  //       shape: new RoundedRectangleBorder(
                  //         borderRadius: new BorderRadius.only(
                  //             topLeft: Radius.circular(44),
                  //             bottomRight: Radius.circular(44)),
                  //       ),
                  //     ),
                  //     child: Row(
                  //       children: [
                  //         Icon(
                  //           Icons.emoji_emotions,
                  //           size: 40,
                  //         ),
                  //         Text(
                  //           "Other Complaint",
                  //           style: text_style,
                  //         )
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Color? _iconsColor(BuildContext context) {
    final theme = NeumorphicTheme.of(context);
    if (theme!.isUsingDark) {
      return theme.current!.accentColor;
    } else {
      return null;
    }
  }

  Color _textColor(BuildContext context) {
    if (NeumorphicTheme.isUsingDark(context)) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }
}
