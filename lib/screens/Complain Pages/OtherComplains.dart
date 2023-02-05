import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:our_community/logic/OtherComplaints_logic.dart';
import 'package:intl/intl.dart';

import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class OtherComplains extends StatelessWidget with OtherComplains_Logic {
  @override
  Widget build(BuildContext context) {
    TextEditingController complaint_title = TextEditingController();
    TextEditingController complaint_description = TextEditingController();
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
    }

    const text_style = TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w400,
    );

    return Scaffold(
        backgroundColor: NeumorphicTheme.baseColor(context),
        body: Column(
          children: [
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
                          child: NeumorphicButton(
                            onPressed: () => {Navigator.pop(context)},
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: _iconsColor(context),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(35, 0, 0, 0),
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
                    child: TextField(
                      controller: complaint_title,
                      decoration: InputDecoration(
                          labelText: "Complaint title",
                          filled: true,
                          fillColor: Colors.grey[200],
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none)),
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
                    child: TextField(
                      controller: complaint_description,
                      decoration: InputDecoration(
                          labelText: "Enter Your Concern Here!!!",
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)),
                          )),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 341,
              height: 78,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: ElevatedButton(
                  onPressed: () {
                    add_data();
                  },
                  style: ElevatedButton.styleFrom(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(44.0),
                    ),
                  ),
                  child: Text(
                    "Raise Complain",
                    style: TextStyle(fontSize: 26),
                  ),
                ),
              ),
            ),
          ],
        ));
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
