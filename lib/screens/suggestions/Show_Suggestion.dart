import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:our_community/screens/suggestions/New_suggestion.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class show_suggestion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void main() async {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
    }

    final user = FirebaseAuth.instance.currentUser!;

    FirebaseFirestore firestore = FirebaseFirestore.instance;

    return Scaffold(
        backgroundColor: Colors.grey[800],
        floatingActionButton: FloatingActionButton(
          onPressed: () => {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NewSuggestion()),
            )
          },
          child: NeumorphicIcon(
            Icons.add_circle,
            size: 80,
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
                        padding: const EdgeInsets.fromLTRB(35, 0, 0, 0),
                        child: Text(
                          "Other Suggestions",
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
                            title: Row(
                              children: [
                                Image.asset(
                                  'assets/Images/Services/Plumber/image 76.png',
                                  width: 40,
                                ),
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(user.email!),
                                      Text(show_suggestion["title"]),
                                    ]),
                              ],
                            ),
                            subtitle: Column(
                              children: [
                                Card(
                                  child: Text(show_suggestion["descriptoin"]),
                                ),
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.black38,
                                      child: IconButton(
                                        onPressed: () =>
                                            print('clicked on list'),
                                        icon: const Icon(
                                            Icons.check_circle_outline),
                                        color: Colors.blue,
                                        padding: const EdgeInsets.all(5),
                                      ),
                                    ),
                                    CircleAvatar(
                                      backgroundColor: Colors.black38,
                                      child: IconButton(
                                        onPressed: () =>
                                            print('clicked on list'),
                                        icon: const Icon(Icons.cancel_outlined),
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            trailing: IconButton(
                              onPressed: () {
                                firestore
                                    .collection("suggestion")
                                    .doc(snapshot.data!.docs[index].reference.id
                                        .toString())
                                    .delete();
                              },
                              icon: Icon(Icons.delete),
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
        ));
  }
}
