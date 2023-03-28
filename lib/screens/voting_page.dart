import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../nuemorphism/border_effect.dart';
import '../nuemorphism/colors.dart';

class Voting_Page extends StatelessWidget {

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

            // Column(
            //   children: [
            //     Container(
            //       child: Row(
            //         children: [
            //           Text("Topic"),
            //           Column(
            //             children: [
            //               Text("Yes"),
            //               Text("500"),
            //             ],
            //           ),
            //           Column(
            //             children: [
            //               Text("No"),
            //               Text("200"),
            //             ],
            //           ),
            //         ],
            //       ),
            //     )
            //   ],
            // ),

            StreamBuilder<QuerySnapshot>(
              stream: firestore
                  .collection('voting')
                  .snapshots(),
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
                              style: theme.voting_neumorphism,
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
                                                    fontSize: 20,
                                                    fontWeight:
                                                    FontWeight.w700,
                                                    color:
                                                    HexColor.WblackText,
                                                    fontFamily: 'poppins'),
                                              ),
                                              Text(
                                                voting_list["option_2"],
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                    FontWeight.w700,
                                                    color:
                                                    HexColor.WblackText,
                                                    fontFamily: 'poppins'),
                                              ),


                                              // FutureBuilder<String>(
                                              //   future: getName(
                                              //       voting_list["option_1"]),
                                              //   builder: (BuildContext
                                              //   context,
                                              //       AsyncSnapshot<String>
                                              //       snapshot) {
                                              //     if (snapshot.hasData) {
                                              //       return Text(
                                              //           snapshot.data
                                              //               .toString(),
                                              //           style: TextStyle(
                                              //               fontSize: 15,
                                              //               fontWeight:
                                              //               FontWeight
                                              //                   .w300,
                                              //               color: HexColor
                                              //                   .WblackText,
                                              //               fontFamily:
                                              //               'poppins'));
                                              //     } else if (snapshot
                                              //         .hasError) {
                                              //       return Text(
                                              //         "Loading...",
                                              //         style:
                                              //         title_text_style,
                                              //       );
                                              //     } else {
                                              //       return Text(
                                              //           "Loading...",
                                              //           style:
                                              //           title_text_style);
                                              //     }
                                              //   },
                                              // ),

                                              // FutureBuilder<String>(
                                              //   future: getName(
                                              //       voting_list["option_2"]),
                                              //   builder: (BuildContext
                                              //   context,
                                              //       AsyncSnapshot<String>
                                              //       snapshot) {
                                              //     if (snapshot.hasData) {
                                              //       return Text(
                                              //           snapshot.data
                                              //               .toString(),
                                              //           style: TextStyle(
                                              //               fontSize: 15,
                                              //               fontWeight:
                                              //               FontWeight
                                              //                   .w300,
                                              //               color: HexColor
                                              //                   .WblackText,
                                              //               fontFamily:
                                              //               'poppins'));
                                              //     } else if (snapshot
                                              //         .hasError) {
                                              //       return Text(
                                              //         "Loading...",
                                              //         style:
                                              //         title_text_style,
                                              //       );
                                              //     } else {
                                              //       return Text(
                                              //           "Loading...",
                                              //           style:
                                              //           title_text_style);
                                              //     }
                                              //   },
                                              // ),
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
    );
  }
}


// import 'package:our_community/logic/voting_logic.dart';
// import 'package:flutter/material.dart';
// import 'package:pie_chart/pie_chart.dart';
//
// class Voting_Page extends StatefulWidget with voting_logic {
//   @override
//   State<Voting_Page> createState() => _Voting_PageState();
// }
//
// class _Voting_PageState extends State<Voting_Page> with voting_logic {
//   late int person_1_votes = 0, person_2_votes = 0;
//
//   late String person_1_name = "Aksh", person_2_name = "College";
//
//   Map<String, double> datamap = {
//     "person_1_name": 1,
//     "person_2_name": 1,
//     "person_3_name": 1,
//     "person_4_name": 1,
//     "person_5_name": 1,
//   };
//
//   List<Color> colorList = [
//     Color(0xff531CB3),
//     Color(0xff944BBB),
//     Color(0xffAA7BC3),
//     Color(0xffCC92C2),
//     Color(0xffDBA8AC),
//   ];
//
//   Widget build(BuildContext context) {
//     datamap.clear();
//     datamap["Aksh"] = 100;
//     datamap["🐼"] = 135;
//     return Scaffold(
//       body: Container(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 PieChart(
//                   dataMap: datamap,
//                   colorList: colorList,
//                   chartRadius: MediaQuery.of(context).size.width / 2,
//                   centerText: "Budget",
//                 )
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                     onPressed: () {
//                       votted("1");
//                       setState(() {});
//                     },
//                     child: Text("1")),
//                 ElevatedButton(
//                     onPressed: () {
//                       votted("2");
//                     },
//                     child: Text("2")),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
