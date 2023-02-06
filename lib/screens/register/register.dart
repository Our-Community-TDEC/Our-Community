import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../../nuemorphism/border_effect.dart';
import '../login_page.dart';

TextEditingController emailController = TextEditingController();
TextEditingController userNameController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController cPasswordController = TextEditingController();

class Register extends StatelessWidget {
  final Color gradientTop = const Color(0xFF2E2F36);
  final Color gradientBot = const Color(0xE02E2F36);

  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    double minHW = min((MediaQuery.of(context).size.width),
        (MediaQuery.of(context).size.height));
    snackBar(showMsg) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(showMsg),
        backgroundColor: Colors.blue,
      ));
    }

    FirebaseFirestore firestore = FirebaseFirestore.instance;

    void createAccount() async {
      String email = emailController.text.toString().trim();
      String userName = userNameController.text.toString().trim();
      String password = passwordController.text.toString().trim();
      String confirmPassword = cPasswordController.text.toString().trim();

      if (email == "" || password == "" || confirmPassword == "") {
        snackBar("Fill all the field");
      } else if (password != confirmPassword) {
        snackBar("Password And Confirm Password not match!");
      } else if (password.length < 6) {
        snackBar("Please enter a password more than 6 characters long");
      } else {
        try {
          FirebaseAuth.instance
              .createUserWithEmailAndPassword(email: email, password: password)
              .then((user) {
            snackBar("Registration successful");
            // UserRecord userRecord = FirebaseAuth.getInstance().getUserByPhoneNumber(phoneNumber);
            firestore
                .collection("user")
                .doc(FirebaseAuth.instance.currentUser?.uid)
                .set({
              "userName": userName,
              "email": email,
              "password": password,
            }).then((value) => {
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) {
                          return LogIn();
                        },
                      )),
                      // emailController.text = "",
                      // passwordController.text = "",
                      // cPasswordController.text = "",
                      // userNameController.text = ""
                    });
          });
        } on FirebaseAuthException catch (e) {
          if (e.code == 'invalid-email') {
            snackBar('The password provided is too weak.');
          } else if (e.code == 'weak-password') {
            snackBar('Invalid Email');
          } else if (e.code == 'email-already-in-use') {
            snackBar('The account already exists for that email.');
          } else if (e.code == 'operation-not-allowed') {
            snackBar('Account is disabled');
          }
        }
        //  catch (e) {
        //   snackBar(e.toString());
        // }
      }
    }
    var text_style = TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w300,
        color: Colors.white,
        fontFamily: 'poppins');

    const labelStyle = TextStyle(
      color: Colors.white,
      fontSize: 18.0,
    );
    const alignStart = CrossAxisAlignment.start;

    return Theme(
      data: ThemeData(fontFamily: 'poppins'),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [gradientTop, gradientBot],
        )),
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(padding: EdgeInsets.symmetric(vertical: minHW * 0.2)),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 11.0),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.51,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text(
                                "Let's get you registered",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 35,
                                  color: Colors.grey,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: alignStart,
                                children: [
                                  Container(
                                    height: 74,
                                    decoration: outer_shadow,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 70,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(16),
                                            child: Neumorphic(
                                              style: inner_shadow,
                                              child: TextField(
                                                controller: userNameController,
                                                decoration: InputDecoration(
                                                  hintText: 'Name',
                                                  filled: true,
                                                  fillColor: Colors.grey[800],
                                                    border: OutlineInputBorder(
                                                        borderSide: BorderSide.none),
                                                  hintStyle: TextStyle(
                                                    color: Colors.white60,
                                                  ),
                                                  contentPadding: EdgeInsets.fromLTRB(10, 50, 0, 0),
                                                  suffixIcon: const Icon(
                                                      Icons.account_circle_outlined,
                                                      color: Colors.white60,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // SizedBox(
                                  //   height: 10,
                                  // )
                                ],
                              ),
                              Column(
                                crossAxisAlignment: alignStart,
                                children: [
                                  Container(
                                    height: 74,
                                    decoration: outer_shadow,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 70,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(16),
                                            child: Neumorphic(
                                              style: inner_shadow,
                                              child: TextField(
                                                controller: emailController,
                                                decoration: InputDecoration(
                                                  filled: true,
                                                  fillColor: Colors.grey[800],
                                                  hintText: 'Email ID',
                                                  hintStyle: TextStyle(
                                                    color: Colors.white60,
                                                  ),
                                                  contentPadding: EdgeInsets.fromLTRB(10, 50, 0, 0),
                                                  border: OutlineInputBorder(
                                                        borderSide: BorderSide.none),
                                                  suffixIcon: const Icon(
                                                      Icons.alternate_email_sharp,
                                                    color: Colors.white60,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // SizedBox(
                                  //   height: 10,
                                  // )
                                ],
                              ),
                              Column(
                                crossAxisAlignment: alignStart,
                                children: [
                                  // Text("Password", style: text_head),
                                  Container(
                                    height: 74,
                                    decoration: outer_shadow,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 70,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(16),
                                            child: Neumorphic(
                                              style: inner_shadow,
                                              child: TextField(
                                                obscureText: true,
                                                controller: passwordController,
                                                decoration: InputDecoration(
                                                    filled: true,
                                                    fillColor: Colors.grey[800],
                                                    border: OutlineInputBorder(
                                                        borderSide: BorderSide.none),
                                                    hintText: 'Password',
                                                    hintStyle: TextStyle(
                                                      color: Colors.white60,
                                                    ),
                                                    suffixIcon: const Icon(Icons.key,
                                                      color:Colors.white60,
                                                    ),
                                                ),
                                                enableSuggestions: false,
                                                autocorrect: false,
                                                obscuringCharacter: "●",
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // SizedBox(
                                  //   height: 10,
                                  // )
                                ],
                              ),
                              Column(
                                crossAxisAlignment: alignStart,
                                children: [
                                  Container(
                                    height: 74,
                                    decoration: outer_shadow,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 70,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(16),
                                            child: Neumorphic(
                                              style: inner_shadow,
                                              child: TextField(
                                                obscureText: true,
                                                controller: cPasswordController,
                                                decoration: InputDecoration(
                                                    filled: true,
                                                  fillColor: Colors.grey[800],
                                                  hintText: 'Confirm Password',
                                                    hintStyle: TextStyle(
                                                      color: Colors.white60,
                                                    ),
                                                    border: OutlineInputBorder(
                                                        borderSide: BorderSide.none),
                                                    suffixIcon: const Icon(Icons.key,
                                                      color:Colors.white60,
                                                    ),
                                                ),
                                                enableSuggestions: false,
                                                autocorrect: false,
                                                obscuringCharacter: "●",
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(15),
                        // child: RichText(
                        // text: TextSpan(
                        //   text:
                        //       'By signing up, you are agree to our Terms & condition and privacy policy',
                        //   style: TextStyle(
                        //       color: Colors.white, fontSize: 18.0),
                        //   children: <TextSpan>[
                        //     TextSpan(
                        //         style: TextStyle(
                        //       fontWeight: FontWeight.bold,
                        //     )),
                        //   ],
                        // ),
                        // ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: SizedBox(
                          width: 200,
                          height: 60,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shadowColor: Colors.grey[600],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            onPressed: () {
                              createAccount();
                            },
                            child: const Text(
                              "Register",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      // InkWell(
                      //   onTap: () {
                      //     Navigator.push(
                      //       context,
                      //       MaterialPageRoute(builder: (context) => LogIn()),
                      //     );
                      //   },
                      //   child: const Text(
                      //     "I'm already a member",
                      //     style: TextStyle(
                      //       color: Colors.white,
                      //     ),
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 9, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Joined us before?",
                              style: text_style,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LogIn()));
                              },
                              child: Text(
                                ' Login',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w300,
                                    color: Color(0xff11A5FA)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
