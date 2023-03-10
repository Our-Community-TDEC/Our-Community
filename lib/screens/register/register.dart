import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        snackBar("Please fill all details");
      } else if (password != confirmPassword) {
        snackBar("Password And Confirm Password not match!");
      } else if (password.length < 6) {
        snackBar("Please enter a password more than 6 characters long");
      } else {
        try {
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email,
            password: password,
          );

          // User registration successful, save user details to Firestore
          firestore
              .collection("user")
              .doc(FirebaseAuth.instance.currentUser?.uid)
              .set({
            "userName": userName,
            "email": email,
            "password": password,
          });

          snackBar("Registration successful");
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LogIn()),
          );
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            snackBar('The password provided is too weak.');
          } else if (e.code == 'email-already-in-use') {
            snackBar('The account already exists for that email.');
          } else if (e.code == 'invalid-email') {
            snackBar('Invalid email.');
          } else {
            snackBar('Error: ${e.message}');
          }
        } on PlatformException catch (e) {
          snackBar('Error: ${e.message}');
        } catch (e) {
          snackBar('Error: ${e.toString()}');
        }
      }
    }

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
                Padding(padding: EdgeInsets.symmetric(vertical: minHW * 0.25)),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
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
                                  // Text(
                                  //   "Name",
                                  //   style: text_head,
                                  // ),
                                  TextField(
                                    controller: userNameController,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.grey,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(32),
                                      ),
                                      labelText: 'Name',
                                      // hintText: 'Enter Your Name',
                                      labelStyle: labelStyle,
                                      suffixIcon: const Icon(
                                          Icons.account_circle_outlined),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: alignStart,
                                children: [
                                  // Text(
                                  //   "Email",
                                  //   style: text_head,
                                  // ),
                                  TextField(
                                    controller: emailController,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.grey,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(32),
                                      ),
                                      labelText: 'Email ID',
                                      // hintText: 'Enter Your Email',
                                      labelStyle: labelStyle,
                                      suffixIcon: const Icon(
                                          Icons.alternate_email_sharp),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: alignStart,
                                children: [
                                  // Text("Password", style: text_head),
                                  TextField(
                                    obscureText: true,
                                    controller: passwordController,
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.grey,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(32),
                                        ),
                                        labelText: 'Password',
                                        // hintText: 'Password',
                                        suffixIcon: const Icon(Icons.key),
                                        labelStyle: labelStyle),
                                    enableSuggestions: false,
                                    autocorrect: false,
                                    obscuringCharacter: "●",
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: alignStart,
                                children: [
                                  // Text("Confirm Password", style: text_head),
                                  TextField(
                                    obscureText: true,
                                    controller: cPasswordController,
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.grey,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(32),
                                        ),
                                        labelText: 'Confirm Password',
                                        // hintText: 'Confirm Password',
                                        suffixIcon: const Icon(Icons.key),
                                        labelStyle: labelStyle),
                                    enableSuggestions: false,
                                    autocorrect: false,
                                    obscuringCharacter: "●",
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(20.0),
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
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LogIn()),
                          );
                        },
                        child: RichText(
                          text: TextSpan(
                              text:"Joined un before? ",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'poppins'
                              ),
                              children: [
                                TextSpan(text: " Login now", style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.w500)),
                              ]
                          ),
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
