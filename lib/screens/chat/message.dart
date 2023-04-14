import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:our_community/nuemorphism/border_effect.dart';
import 'package:our_community/nuemorphism/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class messages extends StatefulWidget {
  String email;
  messages({required this.email});
  @override
  _messagesState createState() => _messagesState(email: email);
}

class _messagesState extends State<messages> {
  WhiteTheme theme = WhiteTheme();
  bool isDark = false;
  var msg_text_style;
  themeF(isDark) {
    print("Theme" + isDark.toString());
    if (false) {
      // theme = DarkTheme();
      msg_text_style = TextStyle(fontSize: 15, color: HexColor.text_color);
    } else {
      theme = WhiteTheme();
      msg_text_style = TextStyle(fontSize: 15, color: HexColor.WblueText);
    }
    setState(() {});
  }

  getPreference() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.containsKey("Theme")) {
      isDark = pref.getBool("Theme")!;
    }
    refferalcode = await getCurrentUserRefferalCode();
    themeF(isDark);
  }

  @override
  initState() {
    // TODO: implement initState
    super.initState();
    getPreference();
    // getTheme();
  }

  String email;
  _messagesState({required this.email});

  String refferalcode = "";
  Future<String> getCurrentUserRefferalCode() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection("user")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    return snapshot.get("refferalcode");
  }

  late ScrollController _scrollController;
  void scroll() {
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });
  }

  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot> _messageStream = FirebaseFirestore.instance
        .collection('Messages')
        .orderBy('time')
        .where("refferalcode", isEqualTo: refferalcode)
        .snapshots();
    return StreamBuilder(
      stream: _messageStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("something is wrong");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        scroll();
        return ListView.builder(
          controller: _scrollController,
          itemCount: snapshot.data!.docs.length,
          physics: ScrollPhysics(),
          shrinkWrap: true,
          // primary: true,
          itemBuilder: (_, index) {
            QueryDocumentSnapshot qs = snapshot.data!.docs[index];
            Timestamp t = qs['time'];
            DateTime d = t.toDate();
            return Padding(
              padding: const EdgeInsets.only(top: 13, bottom: 13),
              child: Column(
                crossAxisAlignment: email == qs['email']
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 300,
                    child: Neumorphic(
                      style: email == qs['email']
                          ? theme.chat_user_neuorphic
                          : theme.chat_opposite_user,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4.0, horizontal: 8.0),
                        child: ListTile(
                          title: Text(
                            qs['userName'],
                            style: msg_text_style,
                          ),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 200,
                                child: Text(
                                  qs['message'],
                                  softWrap: true,
                                  style: msg_text_style,
                                ),
                              ),
                              Text(
                                d.hour.toString() + ":" + d.minute.toString(),
                                style: msg_text_style,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
