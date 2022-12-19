import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:our_community/logic/OtherComplaints_logic.dart';
import 'package:intl/intl.dart';

import '../../logic/suggestion_logic.dart';

class NewSuggestion extends StatelessWidget with AddNewSuggestion {
  @override
  Widget build(BuildContext context) {
    TextEditingController suggestion_title = TextEditingController();
    TextEditingController suggestion_description = TextEditingController();
    String datetime = (DateFormat.Md('en_US').add_jm().format(DateTime.now()));
    void add_data() async {
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      String title = suggestion_title.text.trim();
      String description = suggestion_description.text.trim();

      suggestion_description.clear();
      suggestion_title.clear();

      if (title != '' && description != '') {
        firestore.collection('suggestion').doc().set({
          "title": title,
          "descriptoin": description,
          "time": datetime,
          "UID": FirebaseAuth.instance.currentUser?.uid,
        }).then((result) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Suggstion Posted"),
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

    return Theme(
      data: ThemeData(fontFamily: 'poppins'),
      child: Scaffold(
          backgroundColor: Colors.grey[800],
          body: Column(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 25, 0, 0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.black38,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                            child: IconButton(
                              onPressed: () => {Navigator.pop(context)},
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: Color.fromARGB(255, 0, 141, 241),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                          child: Text(
                            "New Suggestions",
                            style: TextStyle(
                                fontSize: 29,
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
                      // height: 300,
                      child: TextField(
                        controller: suggestion_title,
                        decoration: InputDecoration(
                            labelText: "Suggestion title",
                            filled: true,
                            fillColor: Colors.grey[200],
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none)),
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
                          textAlign: TextAlign.start,
                          style: text_style,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.93,
                    // height: 200,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                      child: TextField(
                        controller: suggestion_description,
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
                      "Suggest",
                      style: TextStyle(fontSize: 26),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
