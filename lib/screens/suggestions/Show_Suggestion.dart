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

import '../../nuemorphism/border_effect.dart';

class show_suggestion extends StatelessWidget {
  WhiteTheme theme = WhiteTheme();
  Future<String> getName(String documentId) async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection("user")
        .doc(documentId)
        .get();
    return snapshot.get("userName");
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    String? user_name = user.displayName;

    FirebaseFirestore firestore = FirebaseFirestore.instance;

    var title_text_style = TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: HexColor.WblackText,
        fontFamily: 'poppins');

    var desc_text_style = TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: HexColor.WblackText,
        fontFamily: 'poppins');

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
                  child: Icon(
                    Icons.add,
                  ),
                  style: NeumorphicStyle(
                      boxShape: NeumorphicBoxShape.circle(),
                      color: HexColor.Wbackground_color),
                ),
              ),
            ),
            body: Column(
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
                              ),
                              style: NeumorphicStyle(
                                  color: HexColor.Wbackground_color,
                                  boxShape: NeumorphicBoxShape.circle(),
                                  shadowLightColor: HexColor.Wlight_vote,
                                  shadowDarkColor: HexColor.Wdark_vote,
                                  depth: 4),
                            ),
                          ),
                          Text(
                            "Suggestions",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w400,
                                color: HexColor.WblackText),
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
                                  style: theme.container,
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
                                            padding: const EdgeInsets.fromLTRB(
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
                                                    show_suggestion["title"],
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color:
                                                            HexColor.WblackText,
                                                        fontFamily: 'poppins'),
                                                  ),

                                                  FutureBuilder<String>(
                                                    future: getName(
                                                        show_suggestion["UID"]),
                                                    builder: (BuildContext
                                                            context,
                                                        AsyncSnapshot<String>
                                                            snapshot) {
                                                      if (snapshot.hasData) {
                                                        return Text(
                                                            snapshot.data
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
                                                                color: HexColor
                                                                    .WblackText,
                                                                fontFamily:
                                                                    'poppins'));
                                                      } else if (snapshot
                                                          .hasError) {
                                                        return Text(
                                                          "Loading...",
                                                          style:
                                                              title_text_style,
                                                        );
                                                      } else {
                                                        return Text(
                                                            "Loading...",
                                                            style:
                                                                title_text_style);
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
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 6),
                                            child: Text(
                                              show_suggestion["description"],
                                              style: desc_text_style,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 7.0),
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 0, 10, 0),
                                                child: SizedBox(
                                                  width: 40,
                                                  height: 40,
                                                  child: NeumorphicButton(
                                                    onPressed: () => print(
                                                        'clicked on list'),
                                                    child: Icon(Icons
                                                        .check_circle_outline),
                                                    style: NeumorphicStyle(
                                                        color: HexColor
                                                            .Wbackground_color,
                                                        boxShape:
                                                            NeumorphicBoxShape
                                                                .circle(),
                                                        shadowLightColor:
                                                            HexColor
                                                                .Wlight_vote,
                                                        shadowDarkColor:
                                                            HexColor.Wdark_vote,
                                                        depth: 4),
                                                    padding:
                                                        const EdgeInsets.all(5),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 0, 10, 0),
                                                child: SizedBox(
                                                  width: 40,
                                                  height: 40,
                                                  child: NeumorphicButton(
                                                    onPressed: () => print(
                                                        'clicked on list'),
                                                    child: Icon(
                                                        Icons.cancel_outlined),
                                                    style: NeumorphicStyle(
                                                        color: HexColor
                                                            .Wbackground_color,
                                                        boxShape:
                                                            NeumorphicBoxShape
                                                                .circle(),
                                                        shadowLightColor:
                                                            HexColor
                                                                .Wlight_vote,
                                                        shadowDarkColor:
                                                            HexColor.Wdark_vote,
                                                        depth: 4),
                                                    padding:
                                                        const EdgeInsets.all(5),
                                                  ),
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
                        return Text("Error");
                      }
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ],
            )));
  }
}
