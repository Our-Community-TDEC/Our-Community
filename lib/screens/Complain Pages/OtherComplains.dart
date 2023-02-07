import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:our_community/logic/OtherComplaints_logic.dart';
import 'package:intl/intl.dart';
import '../../nuemorphism/colors.dart';
import 'package:our_community/nuemorphism/border_effect.dart';

import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class OtherComplains extends StatelessWidget with OtherComplains_Logic {
  static String ttle = "", desc = "";


  TextEditingController complaint_title = TextEditingController();
  TextEditingController complaint_description = TextEditingController();

  OtherComplains(String title, String description) {
    ttle = title;
    desc = description;
  }

  // OtherComplains() {}

  @override
  Widget build(BuildContext context) {
    complaint_title.text = ttle;
    complaint_description.text = desc;
    String datetime = (DateFormat.Md('en_US').add_jm().format(DateTime.now()));
    void add_data() async {
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      String title = complaint_title.text.trim();
      String description = complaint_description.text.trim();

      complaint_description.clear();
      complaint_title.clear();

      if (title != '' && description != '') {
        firestore.collection('complaint').doc().set({
          "title": title,
          "descriptoin": description,
          "time": datetime,
          "UID": FirebaseAuth.instance.currentUser?.uid
        }).then((result) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Comlaint Posted"),
            backgroundColor: Colors.blue,
          ));
        }).catchError((onError) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(onError),
            backgroundColor: Colors.blue,
          ));
        });
      }
      else {
        print("Aksh Exception Caught");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Please fill data in Title and Description."),
        backgroundColor: Colors.blue,
      ));
      }
    }

    const text_style = TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w400,
    );


    return Theme(
      data: ThemeData(
        fontFamily: 'poppins',
      ),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => {Navigator.pop(context)},
          child: Icon(
            Icons.arrow_back,
          ),
        ),
          floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
          backgroundColor: Colors.grey[800],
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 25, 0, 0),
                      child: Row(
                        children: [
                          NeumorphicRadio(
                            // backgroundColor: Colors.black38,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(75, 0, 0, 0),
                            child: Text(
                              "Other Complaint",
                              style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
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
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(11, 0, 0, 0),
                          child: Text(
                            "Title",
                            textAlign: TextAlign.start,
                            style: text_style,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.93,
                        child: Container(
                          height: 74,
                          decoration: outer_shadow,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 70,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Neumorphic(
                                    style: inner_shadow,
                                    child: TextField(
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                      controller: complaint_title,
                                      decoration: InputDecoration(
                                        // focusColor: Colors.white,
                                          labelText: "Complaint title",
                                          filled: true,
                                          fillColor: Colors.grey[800],
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide.none)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(11, 20, 0, 0),
                          child: Text(
                            "Write short discription",
                            style: text_style,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.93,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                        child: Container(
                          height: 204,
                          decoration: outer_shadow,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 200,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Neumorphic(
                                    style: inner_shadow,
                                    child: TextField(
                                      style: TextStyle(
                                        color: Colors.white
                                      ),
                                      maxLines: null,
                                      controller: complaint_description,
                                      decoration: InputDecoration(
                                          labelText: "Enter Your Concern Here!!!",
                                          filled: true,
                                          fillColor: Colors.grey[800],
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                bottomRight: Radius.circular(10)),
                                          )),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: Container(
                  width: 345,
                  height: 78,
                  decoration: BoxDecoration(
                    borderRadius: new BorderRadius.all(Radius.circular(44)),
                    boxShadow: [
                      BoxShadow(
                        // color: HexColor.complaint_black.withOpacity(0.40),
                        color: HexColor.black_shadow.withOpacity(0.40),
                        offset: Offset(8, 8),
                        blurRadius: 16,
                        spreadRadius: 1,
                      ),
                      BoxShadow(
                        color: HexColor.blue_button_shadow_blue.withOpacity(0.25),
                        offset: Offset(-8, -8),
                        blurRadius: 16,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 341,
                        height: 78,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: ClipRRect(
                            borderRadius:
                                new BorderRadius.all(Radius.circular(44)),
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
                                add_data();
                              },
                              child: Text(
                                "Raise Complain",
                                style: TextStyle(fontSize: 26),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ],
            ),
          )),
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