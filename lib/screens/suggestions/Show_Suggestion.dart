// ignore_for_file: prefer_interpolation_to_compose_strings, avoid_print, non_constant_identifier_names, body_might_complete_normally_nullable

import 'dart:io';
// ignore_for_file: prefer_interpolation_to_compose_strings, avoid_print, non_constant_identifier_names, body_might_complete_normally_nullable

import 'dart:io';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:our_community/nuemorphism/colors.dart';
import 'package:our_community/screens/suggestions/New_suggestion.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../nuemorphism/border_effect.dart';

class show_suggestion extends StatefulWidget {
  @override
  State<show_suggestion> createState() => _show_suggestionState();
}

class _show_suggestionState extends State<show_suggestion> {
  WhiteTheme theme = WhiteTheme();
  var icon_color = HexColor.WBlackButton;
  var page_title_style;
  var title_style;
  var name_style;
  var desc_text_style;
  var com_sugge_container;
  var delete_com_sugg_button;
  bool isDark = false;
  themeF(isDark) {
    print("Theme" + isDark.toString());
    if (isDark) {
      desc_text_style = TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: HexColor.text_color,
          fontFamily: 'poppins');

      page_title_style = TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w400,
        color: HexColor.text_color,
      );

      title_style = TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: HexColor.text_color,
          fontFamily: 'poppins');

      name_style = TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w300,
          color: HexColor.text_color,
          fontFamily: 'poppins');

      icon_color = HexColor.icon_color;
      com_sugge_container = NeumorphicStyle(
        color: HexColor.background_top,
        depth: -2,
        shape: NeumorphicShape.flat,
        shadowLightColorEmboss: HexColor.blue_shadow,
        shadowDarkColorEmboss: HexColor.black_shadow,
      );

      delete_com_sugg_button = NeumorphicStyle(
        color: HexColor.back_button_background,
        shadowLightColor: HexColor.blue_shadow,
        shadowDarkColor: HexColor.black_shadow,
        depth: 4,
      );
    } else {
      delete_com_sugg_button = NeumorphicStyle(
        color: HexColor.Wbackground_color,
        shadowLightColor: HexColor.WLightButton,
        shadowDarkColor: HexColor.WBlackButton,
        depth: 4,
      );

      com_sugge_container = NeumorphicStyle(
        color: HexColor.Wbackground_color,
        depth: 3,
        shape: NeumorphicShape.flat,
        // shadowDarkColor:HexColor.Wdark_container ,
        // shadowLightColor: HexColor.Wlight_container,
        shadowLightColorEmboss: HexColor.Wlight_container,
        shadowDarkColorEmboss: HexColor.Wdark_container,
      );

      desc_text_style = TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: HexColor.WblackText,
          fontFamily: 'poppins');

      theme = WhiteTheme();
      icon_color = HexColor.WiconColor;
      page_title_style = TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w400,
        color: HexColor.WblueText,
      );

      title_style = TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: HexColor.WblackText,
          fontFamily: 'poppins');

      name_style = TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w300,
          color: HexColor.WblackText,
          fontFamily: 'poppins');
    }
    setState(() {});
  }

  getPreference() async {
    var pref = await SharedPreferences.getInstance();
    isDark = pref.getBool("Theme")!;
    refferalcode = await getCurrentUserRefferalCode();
    themeF(isDark);
  }

  @override
  initState() {
    // TODO: implement initState
    super.initState();
    getPreference();
    getRole();
  }

  static String role = "";
  String refferalcode = "";
  Future<String> getCurrentUserRefferalCode() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection("user")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    return snapshot.get("refferalcode");
  }
  Future<String> getName(String documentId) async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection("user")
        .doc(documentId)
        .get();
    return snapshot.get("userName");
  }


  Future<String> getRole() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection("user")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    role = snapshot.get("role");
    print(refferalcode+"getrole");
    setrole();
    return "0";
  }

  bool isUser = true;
  setrole() {
    print(refferalcode+"setrol");
    print("obj" + role);
    if (role == "user") {
      isUser = true;
    } else if (role == "admin") {
      print("object");
      isUser = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    String? user_name = user.displayName;
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    

    return Theme(
        data: ThemeData(fontFamily: 'poppins'),
        child: Scaffold(
            backgroundColor: HexColor.Wbackground_color,
            floatingActionButton: SizedBox(
              height: 45,
              width: 45,
              child: FittedBox(
                child: NeumorphicFloatingActionButton(
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NewSuggestion()),
                    ),
                  },
                  child: Icon(Icons.add, color: icon_color),
                  style: theme.back_button,
                ),
              ),
            ),
            body: Container(
              decoration: theme.background_color,
              child: Column(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 70, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 40,
                              height: 40,
                              child: NeumorphicButton(
                                onPressed: () => {Navigator.pop(context)},
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  color: icon_color,
                                ),
                                style: theme.back_button,
                              ),
                            ),
                            Text(
                              "Suggestions",
                              style: page_title_style,
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 5,
                        indent: 12,
                        endIndent: 12,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  StreamBuilder<QuerySnapshot>(
                    stream: firestore
                        .collection('suggestion')
                        .orderBy('time', descending: true)
                        .where("refferalcode", isEqualTo: refferalcode)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.active) {
                        if (snapshot.hasData && snapshot.data != null) {
                          return Expanded(
                            child: ListView.builder(
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                Map<String, dynamic> show_suggestion =
                                    snapshot.data!.docs[index].data()
                                        as Map<String, dynamic>;
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Neumorphic(
                                    style: com_sugge_container,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: ListTile(
                                      title: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 30,
                                              child: Image.asset(
                                                'assets/Images/user.png',
                                                width: 40,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      10, 0, 0, 0),
                                              child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    // Text(
                                                    //   await getName(show_suggestion["UID"]),
                                                    //   style: title_text_style,
                                                    // ), //Darshan
                  
                                                    Text(
                                                        show_suggestion[
                                                            "title"],
                                                        style: title_style),
                  
                                                    FutureBuilder<String>(
                                                      future: getName(
                                                          show_suggestion[
                                                              "UID"]),
                                                      builder: (BuildContext
                                                              context,
                                                          AsyncSnapshot<String>
                                                              snapshot) {
                                                        if (snapshot.hasData) {
                                                          return Text(
                                                              snapshot.data
                                                                  .toString(),
                                                              style:
                                                                  name_style);
                                                        } else if (snapshot
                                                            .hasError) {
                                                          return Text(
                                                            "Loading...",
                                                            style: name_style,
                                                          );
                                                        } else {
                                                          return Text(
                                                              "Loading...",
                                                              style:
                                                                  name_style);
                                                        }
                                                      },
                                                    ),
                                                  ]),
                                            ),
                                          ],
                                        ),
                                      ),
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                10, 0, 0, 0),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 6),
                                              child: Text(
                                                show_suggestion["description"],
                                                style: desc_text_style,
                                              ),
                                            ),
                                          ),
                                          isUser
                                              ? Row()
                                              : Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 7.0),
                                                  child: Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                0, 0, 10, 0),
                                                        child: NeumorphicButton(
                                                          onPressed: () {
                                                            firestore
                                                                .collection(
                                                                    "suggestion")
                                                                .doc(snapshot
                                                                    .data!
                                                                    .docs[index]
                                                                    .reference
                                                                    .id
                                                                    .toString())
                                                                .delete();
                                                          },
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    vertical: 4,
                                                                    horizontal:
                                                                        20),
                                                            child: Text(
                                                              "Delete",
                                                              style: TextStyle(
                                                                  color: HexColor
                                                                      .text_color,
                                                                  fontSize: 19,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ),
                                                          ),
                                                          style: theme
                                                              .delete_com_sugg_button,
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(5),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                        ],
                                      ),
                                      // trailing: IconButton(
                                      //   onPressed: () {
                                      //     firestore
                                      //         .collection("suggestion")
                                      //         .doc(snapshot
                                      //             .data!.docs[index].reference.id
                                      //             .toString())
                                      //         .delete();
                                      //   },
                                      //   icon: Icon(Icons.delete),
                                      // ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        } else {
                          return Text("There is no any suggestion");
                        }
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ],
              ),
            )));
  }
}
