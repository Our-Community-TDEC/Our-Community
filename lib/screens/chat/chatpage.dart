import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:our_community/nuemorphism/colors.dart';
import 'package:our_community/screens/Maintanance/Pay_maintanance.dart';
import 'package:our_community/screens/login_page.dart';

import 'message.dart';

class chatpage extends StatefulWidget {
  String email;
  chatpage({required this.email});
  @override
  _chatpageState createState() => _chatpageState(email: email);
}

class _chatpageState extends State<chatpage> {
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
    print("User Name: $userName");
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
      backgroundColor: HexColor.Wbackground_color,
      appBar: AppBar(
        title: Text(
          'Chat',
        ),
        // actions: [
        //   MaterialButton(
        //     onPressed: () {
        //       _auth.signOut().whenComplete(() {
        //         Navigator.pushReplacement(
        //           context,
        //           MaterialPageRoute(
        //             builder: (context) => HomePage(),
        //           ),
        //         );
        //       });
        //     },
        //     child: Text(
        //       "signOut",
        //     ),
        //   ),
        // ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.82,
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
                        style: NeumorphicStyle(
                          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(40)),
                          shadowDarkColorEmboss: HexColor.WtextfieldDarkShadow,
                          shadowLightColorEmboss: HexColor.WtextfieldLightShadow,
                          depth: -2,
                          color: HexColor.Wbackground_color
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                          child: TextFormField(
                            
                            decoration: InputDecoration(
                              hintText: "Messege",
                              hintStyle: TextStyle(color: HexColor.WblackText,fontWeight: FontWeight.w500)
                            ),
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
                          print("object");
                        }
                      },
                      icon: Icon(Icons.send_sharp),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
