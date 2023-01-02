import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../login_page.dart';

TextEditingController emailController = TextEditingController();
TextEditingController userNameController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController cPasswordController = TextEditingController();

class Register extends StatelessWidget {
  Color gradient_top = const Color(0xFF2E2F36);
  Color gradient_bot = const Color(0xE02E2F36);

  @override
  Widget build(BuildContext context) {
    snackBar(show_msg) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(show_msg),
        backgroundColor: Colors.blue,
      ));
    }

    FirebaseFirestore firestore = FirebaseFirestore.instance;

    void createAccount() async {
      String email = emailController.text.toString().trim();
      String userName = userNameController.text.toString().trim();
      String password = passwordController.text.toString().trim();
      String confirmpassword = cPasswordController.text.toString().trim();

      if (email == "" || password == "" || confirmpassword == "") {
        snackBar("Fill all the field");
      } else if (password != confirmpassword) {
        snackBar("Password And Confirm Password not match!");
      } else {
        try {
          FirebaseAuth.instance
              .createUserWithEmailAndPassword(email: email, password: password)
              .then((user) {
            snackBar("registerd successfully");
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
            snackBar('Inavalid Email');
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

    const text_head = TextStyle(
        color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w600);
    const lable_style = TextStyle(
      color: Colors.white,
      fontSize: 18.0,
    );
    const align_start = CrossAxisAlignment.start;

    return Theme(
      data: ThemeData(fontFamily: 'poppins'),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [gradient_top, gradient_bot],
        )),
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
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
                                Column(
                                  crossAxisAlignment: align_start,
                                  children: [
                                    Text(
                                      "Name",
                                      style: text_head,
                                    ),
                                    TextField(
                                      controller: userNameController,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.grey,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(32),
                                        ),
                                        labelText: 'Your Name',
                                        hintText: 'Enter Your Name',
                                        labelStyle: lable_style,
                                        suffixIcon:
                                            Icon(Icons.account_circle_outlined),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: align_start,
                                  children: [
                                    Text(
                                      "Email",
                                      style: text_head,
                                    ),
                                    TextField(
                                      controller: emailController,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.grey,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(32),
                                        ),
                                        labelText: 'name@gmail.com',
                                        hintText: 'Enter Your Email',
                                        labelStyle: lable_style,
                                        suffixIcon:
                                            Icon(Icons.alternate_email_sharp),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: align_start,
                                  children: [
                                    Text("Password", style: text_head),
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
                                          hintText: 'Password',
                                          suffixIcon: Icon(Icons.key),
                                          labelStyle: lable_style),
                                      enableSuggestions: false,
                                      autocorrect: false,
                                      obscuringCharacter: "●",
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: align_start,
                                  children: [
                                    Text("Confirm Password", style: text_head),
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
                                          hintText: 'Confirm Password',
                                          suffixIcon: Icon(Icons.key),
                                          labelStyle: lable_style),
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
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: RichText(
                            text: TextSpan(
                              text:
                                  'By signing up, you are agree to our Terms & condition and privacy policy',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 18.0),
                              children: <TextSpan>[
                                TextSpan(
                                    style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                              ],
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            createAccount();
                          },
                          child: Text(
                            "Registration ",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: RichText(
                            text: TextSpan(
                              text: 'Join us before ',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 18.0),
                              children: <TextSpan>[
                                TextSpan(
                                    style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                              ],
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
      ),
    );
  }
}
