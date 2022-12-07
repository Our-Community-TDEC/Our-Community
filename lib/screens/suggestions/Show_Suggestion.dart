import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class show_suggestion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void main() async {
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // //fetch data
      // QuerySnapshot snapshot = await firestore.collection("Complaint").get();
      // for (var doc in snapshot.docs) {
      //   Text(doc.data().toString());
      // }

      //Single user
      // DocumentSnapshot snapshot1 = await firestore
      //     .collection("complaint")
      //     .doc("8iAmDuN2gVlk4qwi5NJ8")
      //     .get();
      // log("message");
      // log(snapshot1.data().toString());

      // //Add data with Auto id
      // Map<String, dynamic> newComplaint = {
      //   "title": "Garden",
      //   "description": "clean Garden"
      // };
      // await firestore.collection('Complaint').add(newComplaint);

      // //Add data with manual id
      // await firestore.collection('Complaint').doc("1").set(newComplaint);
      // await firestore
      //     .collection('Complaint')
      //     .doc("2")
      //     .set({"title": "Garden2", "description": "clean Garden2"});

      // //Update data
      // await firestore
      //     .collection('Complaint')
      //     .doc("Aieho6zTq9qQw12u1KkT")
      //     .update(newComplaint);
      // await firestore
      //     .collection('Complaint')
      //     .doc("Aieho6zTq9qQw12u1KkT")
      //     .update({"description": "clean all Garden"});

      // //delete data

      // await firestore.collection("Complaint").doc("2").delete();
    }

    final user = FirebaseAuth.instance.currentUser!;

    FirebaseFirestore firestore = FirebaseFirestore.instance;

    return Scaffold(
        // floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        //   child: Icon(Icons.arrow_back),
        // ),
        backgroundColor: Colors.grey[800],
        floatingActionButton: FloatingActionButton(
          onPressed: () => {},
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
                            // title: Row(
                            //   children: [
                            //     Image.asset('2147.jpeg'),
                            //     // Text("Img"),
                            //     Column(
                            //       children: const [
                            //         Text(user.email!),
                            //         Text(show_suggestion["title"]),
                            //       Text(show_suggestion["descriptoin"]),
                            //       ],
                            //     )
                            //   ],
                            // ),
                            // title: Text(
                            //     show_complaint["title"] + show_complaint["time"]),
                            // subtitle: Text(show_complaint["descriptoin"]),
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
