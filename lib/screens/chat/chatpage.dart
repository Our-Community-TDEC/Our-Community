import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:our_community/nuemorphism/border_effect.dart';
import 'package:our_community/nuemorphism/colors.dart';
import 'package:our_community/screens/Maintanance/Pay_maintanance.dart';
import 'package:our_community/screens/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'message.dart';

class chatpage extends StatefulWidget {
  String email;
  chatpage({required this.email});
  @override
  _chatpageState createState() => _chatpageState(email: email);
}

class _chatpageState extends State<chatpage> {
  var theme;
  var msg_textbox;
  var icon_color = HexColor.Wbackground_color;
  bool isDark = false;
  themeF(isDark) {
    print("Theme" + isDark.toString());
    if (isDark) {
      icon_color = HexColor.icon_color;
      msg_textbox =
          TextStyle(color: HexColor.text_color, fontWeight: FontWeight.w400);
      theme = DarkTheme();
    } else {
      theme = WhiteTheme();
      msg_textbox =
          TextStyle(color: HexColor.WblackText, fontWeight: FontWeight.w500);
          icon_color = HexColor.WiconColor;
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

  Future<String> getName() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection("user")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    return snapshot.get("userName");
  }

  String userName = "";

  Future<String> getUserInfo() async {
    userName = await getName();
    return userName;
  }

  String email;
  _chatpageState({required this.email});

  final fs = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  final TextEditingController message = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: theme.chatAppBar,
      body: Container(
        decoration: theme.background_color,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: SingleChildScrollView(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.72,
                    child: messages(
                      email: email,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                child: Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: Neumorphic(
                          style: theme.chat_textbox,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  hintText: "Messege", hintStyle: msg_textbox),
                              controller: message,
                              validator: (value) {},
                              onSaved: (value) {
                                message.text = value!;
                              },
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          if (message.text.isNotEmpty) {
                            await getUserInfo();
                            fs.collection('Messages').doc().set({
                              'message': message.text.trim(),
                              'time': DateTime.now(),
                              'email': email,
                              'userName': userName,
                              'uid': FirebaseAuth.instance.currentUser?.uid,
                            });
                            message.clear();
                          } else {
                            getUserInfo();
                          }
                        },
                        icon: Icon(Icons.send_sharp,
                          color: icon_color,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
