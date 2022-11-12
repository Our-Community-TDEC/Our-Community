import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class show_complaint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // void main() async {
    //   FirebaseFirestore firestore = FirebaseFirestore.instance;

    //   //fetch data
    //   QuerySnapshot snapshot = await firestore.collection("Complaint").get();
    //   for (var doc in snapshot.docs) {
    //     Text(doc.data().toString());
    //   }

    //   //Single user
    //   DocumentSnapshot snapshot1 = await firestore
    //       .collection("Complaint")
    //       .doc("Aieho6zTq9qQw12u1KkT")
    //       .get();
    //   snapshot1.data().toString();

    //   //Add data with Auto id
    //   Map<String, dynamic> newComplaint = {
    //     "title": "Garden",
    //     "description": "clean Garden"
    //   };
    //   await firestore.collection('Complaint').add(newComplaint);

    //   //Add data with manual id
    //   await firestore.collection('Complaint').doc("1").set(newComplaint);
    //   await firestore
    //       .collection('Complaint')
    //       .doc("2")
    //       .set({"title": "Garden2", "description": "clean Garden2"});

    //   //Update data
    //   await firestore
    //       .collection('Complaint')
    //       .doc("Aieho6zTq9qQw12u1KkT")
    //       .update(newComplaint);
    //   await firestore
    //       .collection('Complaint')
    //       .doc("Aieho6zTq9qQw12u1KkT")
    //       .update({"description": "clean all Garden"});

    //   //delete data

    //   await firestore.collection("Complaint").doc("2").delete();
    // }
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    return Scaffold(
        body: Column(
      children: [
        SizedBox(),
        StreamBuilder<QuerySnapshot>(
          stream: firestore.collection('Complaint').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData && snapshot.data != null) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      Map<String, dynamic> complaint =
                          snapshot.data!.docs[index].data()
                              as Map<String, dynamic>;
                      return ListTile(
                        title: Text(complaint["title"]),
                        subtitle: Text(complaint["description"]),
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
        )
      ],
    ));
  }
}
