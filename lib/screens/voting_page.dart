import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';
import 'package:our_community/screens/Vote.dart';

import '../nuemorphism/border_effect.dart';
import '../nuemorphism/colors.dart';

class Voting_Page extends StatelessWidget {
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
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("aksh"),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Let's Vote!",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 50,
                  ),
                ),
                Divider(
                  thickness: 5,
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
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Neumorphic(
                                  // style: theme.voting_neumorphism,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: ListTile(
                                    title: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                10, 0, 0, 0),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    voting_list["title"],
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color:
                                                            HexColor.WblackText,
                                                        fontFamily: 'poppins'),
                                                  ),
                                                  Text(
                                                    voting_list["option_1"],
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        color:
                                                            HexColor.WblackText,
                                                        fontFamily: 'poppins'),
                                                  ),
                                                  Text(
                                                    voting_list["option_2"],
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        color:
                                                            HexColor.WblackText,
                                                        fontFamily: 'poppins'),
                                                  ),
                                                  ElevatedButton(
                                                    child: Text("Vote"),
                                                    onPressed: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                Vote(
                                                                    voting_list)),
                                                      );
                                                    },
                                                  ),
                                                ]),
                                          ),
                                        ],
                                      ),
                                    ),
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
            ),
          ),
        ],
      ),
    );
  }
}
