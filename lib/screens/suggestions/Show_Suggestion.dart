// ignore_for_file: prefer_interpolation_to_compose_strings, avoid_print, non_constant_identifier_names, body_might_complete_normally_nullable

import 'dart:io';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:our_community/screens/suggestions/New_suggestion.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class show_suggestion extends StatelessWidget {
  // String getUserName(String UID) {
  //   String out;
  //   FirebaseFirestore firestore = FirebaseFirestore.instance;
  //   final docRef = firestore.collection("user").doc(UID);
  //     return docRef.get().then((DocumentSnapshot doc) {
  //       final data = doc.data() as Map<String, dynamic>;
  //       out = data['userName'].toString();
  //       print("SSS: " + out.toString());
  //       return out.toString();
  //     });
  //   // return show.toString();
  // }

  Future<String> getName(String documentId) async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection("user")
        .doc(documentId)
        .get();
    return snapshot.get("userName");
  }

//   Future<String> getUserName(String UID) async {
//   FirebaseFirestore firestore = FirebaseFirestore.instance;
//   final docRef = firestore.collection("user").doc(UID);
//   final DocumentSnapshot doc = await docRef.get();
//   final data = doc.data() as Map<String, dynamic>;
//   return data['userName'].toString();
// }

  @override
  Widget build(BuildContext context) {
    void main() async {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
    }

    final user = FirebaseAuth.instance.currentUser!;

    FirebaseFirestore firestore = FirebaseFirestore.instance;

    const title_text_style = TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: Colors.white,
        fontFamily: 'poppins');

    const desc_text_style = TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: Colors.white,
        fontFamily: 'poppins');
    return Theme(
        data: ThemeData(fontFamily: 'poppins'),
        child: Scaffold(
            backgroundColor: Colors.grey[800],
            floatingActionButton: FloatingActionButton(
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewSuggestion()),
                ),
              },
              backgroundColor: Colors.black38,
              child: const Icon(
                Icons.add,
                color: Colors.blue,
              ),
            ),
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
                                  fontSize: 30,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Divider(
                        thickness: 5,
                        indent: 12,
                        endIndent: 12,
                        color: Colors.black,
                      ),
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
                              return ListTile(
                                title: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 6, 0, 0),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'assets/Images/Services/Plumber/image 76.png',
                                        width: 40,
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
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.white,
                                                    fontFamily: 'poppins'),
                                              ),

                                              FutureBuilder<String>(
                                                future: getName(
                                                    show_suggestion["UID"]),
                                                builder: (BuildContext context,
                                                    AsyncSnapshot<String>
                                                        snapshot) {
                                                  if (snapshot.hasData) {
                                                    return Text(
                                                        snapshot.data
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w300,
                                                            color: Colors.white,
                                                            fontFamily:
                                                                'poppins'));
                                                  } else if (snapshot
                                                      .hasError) {
                                                    return Text("Loading.....");
                                                  } else {
                                                    return Text("Loading...",
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 0, 0, 0),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 6),
                                        child: Text(
                                          show_suggestion["descriptoin"],
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
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 0, 10, 0),
                                            child: CircleAvatar(
                                              backgroundColor: Colors.black38,
                                              child: IconButton(
                                                onPressed: () =>
                                                    print('clicked on list'),
                                                icon: const Icon(
                                                    Icons.check_circle_outline),
                                                color: Colors.blue,
                                                padding:
                                                    const EdgeInsets.all(5),
                                              ),
                                            ),
                                          ),
                                          CircleAvatar(
                                            backgroundColor: Colors.black38,
                                            child: IconButton(
                                              onPressed: () =>
                                                  print('clicked on list'),
                                              icon: const Icon(
                                                  Icons.cancel_outlined),
                                              color: Colors.blue,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      thickness: 2,
                                      indent: 1,
                                      endIndent: 1,
                                      color: Colors.black,
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
