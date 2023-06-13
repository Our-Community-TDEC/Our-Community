import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';

import '../nuemorphism/border_effect.dart';
import '../nuemorphism/colors.dart';

class Vote extends StatelessWidget {
  Map<String, dynamic> doc = {};

  Vote(document) {
    doc = document;
  }

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

    return Scaffold(
      floatingActionButton: SizedBox(
        height: 45,
        width: 45,
        child: FittedBox(
          child: NeumorphicFloatingActionButton(
            onPressed: () => {
              Navigator.pop(context),
            },
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
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              doc["title"],
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 30,
              ),
            ),
            Divider(
              thickness: 2,
              color: Colors.black,
            ),
            StreamBuilder<QuerySnapshot>(
              stream: firestore.collection('voting').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  if (snapshot.hasData && snapshot.data != null) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          Map<String, dynamic> voting_list =
                              snapshot.data!.docs[index].data()
                                  as Map<String, dynamic>;
                          var voting_list_current_doc =
                              snapshot.data!.docs[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Neumorphic(
                                      style: theme.voting_neumorphism,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Text(doc["desc"]),
                                      )),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 25),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    ElevatedButton(
                                        onPressed: () {
                                          voteForOption(
                                            "option_1",
                                            doc,
                                            voting_list_current_doc
                                                .reference.id,
                                          );
                                        },
                                        child: Text(doc["option_1"])),
                                    ElevatedButton(
                                        onPressed: () {
                                          voteForOption(
                                            "option_2",
                                            doc,
                                            voting_list_current_doc
                                                .reference.id,
                                          );
                                        },
                                        child: Text(doc["option_2"])),
                                  ],
                                ),
                              ],
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
        ),
      ),
    );
  }

  voteForOption(String option, Map<String, dynamic> doc,
      String current_documentId) async {
    String voters_arr = doc[option],
        uid = FirebaseAuth.instance.currentUser!.uid;

    // -------------------------Print current document id---------------------------
    print("current_documentId :- " + current_documentId);

    //TODO: Append UID to array in firebase
    print("Voting for " + option);
    print("Printing");
    print("Option 111111111: ");
    for (int i = 0; i < doc["option_1_votes"].length; i++) {
      print(doc["option_1_votes"][i]);
    }
    print("printing");
    if (option == "option_1") {
      print("called 1");
      doc["option_1_votes"].add(uid);
      var collection = FirebaseFirestore.instance.collection('voting');
      collection
          .doc('doc_id')
          .update({'option_1_votes': doc["option_1_votes"]}) // <-- Updated data
          .then((_) => print('Success'))
          .catchError((error) => print('Failed: $error'));
      //TODO: Upload array back to firebase
    }
    if (option == "option_2") {
      doc["option_2"].add(uid);
      print("called 2");
      var collection = FirebaseFirestore.instance.collection('voting');
      collection
          .doc('doc_id')
          .update({'option_2_votes': doc["option_2_votes"]}) // <-- Updated data
          .then((_) => print('Success'))
          .catchError((error) => print('Failed: $error'));
      //TODO: Upload array back to firebase
    }

    print("option == " + option);

    for (int i = 0; i < doc["option_1_votes"].length; i++) {
      print("Out: " + doc["option_1_votes"][i]);
    }

    List<String> docId = await getDocumentIds();
  }
}

Future<List<String>> getDocumentIds() async {
  List<String> documentIds = [];

  QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('voting').get();

  querySnapshot.docs.forEach((document) {
    documentIds.add(document.id);
  });

  print("Printlng all docIDs");
  for (int i = 0; i < documentIds.length; i++) {
    print(documentIds[i]);
  }

  return documentIds;
}
