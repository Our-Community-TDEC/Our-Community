import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:our_community/nuemorphism/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../nuemorphism/border_effect.dart';
import '../Complain Pages/complain_page.dart';

class show_complaint extends StatefulWidget {
  @override
  State<show_complaint> createState() => _show_complaintState();
}

class _show_complaintState extends State<show_complaint> {
  var theme;
  var icon_color;
  var page_title_style;
  var title_style;
  var name_style;
  var desc_text_style;
  bool isDark = false;
  themeF(isDark) {
    print("Theme" + isDark.toString());
    if (isDark) {
      desc_text_style = TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: HexColor.text_color,
          fontFamily: 'poppins');

      page_title_style = TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w400,
        color: HexColor.text_color,
      );

      title_style = TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: HexColor.text_color,
          fontFamily: 'poppins');

      name_style = TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w300,
          color: HexColor.text_color,
          fontFamily: 'poppins');

      theme = DarkTheme();
      icon_color = HexColor.icon_color;
    } else {
      desc_text_style = TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: HexColor.WblackText,
          fontFamily: 'poppins');

      theme = WhiteTheme();
      icon_color = HexColor.WiconColor;
      page_title_style = TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w400,
        color: HexColor.WblueText,
      );

      title_style = TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: HexColor.WblackText,
          fontFamily: 'poppins');

      name_style = TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w300,
          color: HexColor.WblackText,
          fontFamily: 'poppins');
    }
    setState(() {});
  }

  getPreference() async {
    var pref = await SharedPreferences.getInstance();
    isDark = pref.getBool("Theme")!;
    print("object" + isDark.toString());
    themeF(isDark);
  }

  @override
  initState() {
    // TODO: implement initState
    super.initState();
    getPreference();
    // getTheme();
  }

  Future<String> getName(String documentId) async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection("user")
        .doc(documentId)
        .get();
    return snapshot.get("userName");
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    String? user_name = user.displayName;

    FirebaseFirestore firestore = FirebaseFirestore.instance;

    var title_text_style = TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: HexColor.WblackText,
        fontFamily: 'poppins');

    return Theme(
        data: ThemeData(fontFamily: 'poppins'),
        child: Scaffold(
            floatingActionButton: SizedBox(
              height: 45,
              width: 45,
              child: FittedBox(
                child: NeumorphicFloatingActionButton(
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ComplainPage()),
                    ),
                  },
                  child: Icon(
                    Icons.add,
                    color: icon_color,
                  ),
                  style: theme.back_button,
                ),
              ),
            ),
            body: Container(
              decoration: theme.background_color,
              child: Column(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 70, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 40,
                              height: 40,
                              child: NeumorphicButton(
                                onPressed: () => {Navigator.pop(context)},
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  color: icon_color,
                                ),
                                style: theme.back_button,
                              ),
                            ),
                            Text(
                              "Complaints",
                              style: page_title_style,
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 5,
                        indent: 12,
                        endIndent: 12,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  StreamBuilder<QuerySnapshot>(
                    stream: firestore
                        .collection('complaint')
                        .orderBy('time', descending: true)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.active) {
                        if (snapshot.hasData && snapshot.data != null) {
                          return Expanded(
                            child: ListView.builder(
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                Map<String, dynamic> show_complaint =
                                    snapshot.data!.docs[index].data()
                                        as Map<String, dynamic>;
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Neumorphic(
                                    style: theme.com_sugge_container,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: ListTile(
                                      title: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 30,
                                              child: Image.asset(
                                                'assets/Images/user.png',
                                                width: 40,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      10, 0, 0, 0),
                                              child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    // Text(
                                                    //   await getName(show_complaint["UID"]),
                                                    //   style: title_text_style,
                                                    // ), //Darshan

                                                    Text(
                                                        show_complaint["title"],
                                                        style: title_style),

                                                    FutureBuilder<String>(
                                                      future: getName(
                                                          show_complaint[
                                                              "UID"]),
                                                      builder: (BuildContext
                                                              context,
                                                          AsyncSnapshot<String>
                                                              snapshot) {
                                                        if (snapshot.hasData) {
                                                          return Text(
                                                              snapshot.data
                                                                  .toString(),
                                                              style:
                                                                  name_style);
                                                        } else if (snapshot
                                                            .hasError) {
                                                          return Text(
                                                            "Loading...",
                                                            style: name_style,
                                                          );
                                                        } else {
                                                          return Text(
                                                              "Loading...",
                                                              style:
                                                                  name_style);
                                                        }
                                                      },
                                                    ),
                                                  ]),
                                            ),
                                          ],
                                        ),
                                      ),
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                10, 0, 0, 0),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 6),
                                              child: Text(
                                                show_complaint["description"],
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
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          0, 0, 10, 0),
                                                  child: SizedBox(
                                                    width: 40,
                                                    height: 40,
                                                    child: NeumorphicButton(
                                                      onPressed: () => print(
                                                          'clicked on list'),
                                                      child: Icon(
                                                        Icons
                                                            .check_circle_outline,
                                                        color: icon_color,
                                                      ),
                                                      style: theme.back_button,
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          0, 0, 10, 0),
                                                  child: SizedBox(
                                                    width: 40,
                                                    height: 40,
                                                    child: NeumorphicButton(
                                                      onPressed: () => print(
                                                          'clicked on list'),
                                                      child: Icon(
                                                        Icons.cancel_outlined,
                                                        color: icon_color,
                                                      ),
                                                      style: theme.back_button,
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
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
            )));
  }
}
