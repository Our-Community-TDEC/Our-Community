// ignore_for_file: prefer_const_constructors

import 'dart:ffi';

import 'package:final_year_project/base1.dart';
import 'package:final_year_project/provider/googlesignin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../logic/login_logic.dart';

class LogIn extends StatelessWidget with Login_Logic {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  Color gradient_top = Color(0xFF2E2F36);
  Color gradient_bot = Color(0xE02E2F36);

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    dispose();
    // super.dispose();
  }

  Widget build(BuildContext context) {
    return Container(
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
                    children: [
                      Image(
                        image: AssetImage('assets/Images/Login/Trees.png'),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
                  child: SizedBox(
                    width: 352,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Username",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[700],
                          ),
                        ),
                        TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            filled: true,
                            fillColor: Colors.grey,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32),
                            ),
                            labelText: 'Enter E-Mail ID',
                            hintText: 'example@gmail.com',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Text(
                            "Password",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[700],
                            ),
                          ),
                        ),
                        TextField(
                          obscureText: true,
                          controller: passwordController,
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            suffixIcon: Icon(Icons.key),
                            filled: true,
                            fillColor: Colors.grey,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32),
                            ),
                            labelText: '..........',
                            hintText: 'Enter Password',
                          ),
                          enableSuggestions: false,
                          autocorrect: false,
                          obscuringCharacter: "●",
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                    ),
                    onPressed: () async {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) =>
                            Center(child: CircularProgressIndicator()),
                      );
                      try {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim(),
                        );
                      } on FirebaseAuthException catch (e) {
                        print(e);
                      }
                    },
                    child: Text(
                      "Log in",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                  child: Column(
                    children: [
                      Text(
                        "-----------< Or continue with >-----------",
                        style: TextStyle(color: Colors.white),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                              ),
                              onPressed: () {
                                final prov =
                                    Provider.of<GoogleSignInProviderss>(context,
                                        listen: false);
                                prov.googleLogIn();
                              },
                              child: Image(
                                image: AssetImage(
                                    'assets/Images/Login/image 3.png'),
                              ),
                            ),
                            Icon(
                              Icons.apple,
                              color: Colors.black,
                              size: 35,
                            ),
                            Icon(
                              Icons.facebook,
                              color: Colors.blue,
                              size: 30,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // ElevatedButton(
                //   onPressed: () {
                //     final prov = Provider.of<GoogleSignInProviderss>(context,
                //         listen: false);
                //     prov.googleLogIn();
                //   },
                //   child: Text(
                //     "Sign in",
                //   ),
                // ),
                // ElevatedButton(
                //   onPressed: () {
                //     final prov = Provider.of<GoogleSignInProviderss>(context,
                //         listen: false);
                //     prov.googleSignOut();
                //   },
                //   child: Text(
                //     "Sign out",
                //   ),
                //   // shape: RoundedRectangleBorder(
                //   //   borderRadius: new BorderRadius.circular(45),
                //   // ),
                // ),
                // ElevatedButton(
                //   onPressed: () async {
                //     showDialog(
                //       context: context,
                //       barrierDismissible: false,
                //       builder: (context) =>
                //           Center(child: CircularProgressIndicator()),
                //     );
                //     try {
                //       await FirebaseAuth.instance.signInWithEmailAndPassword(
                //         email: emailController.text.trim(),
                //         password: passwordController.text.trim(),
                //       );
                //     } on FirebaseAuthException catch (e) {
                //       print(e);
                //     }
                //   },
                //   child: Text(
                //     "Log in",
                //   ),
                // ),

                // Container(
                //   width: 400,
                //   height: 200,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(100),
                //     border: Border.all(
                //       width: 2.0,
                //       color: Colors.blue,
                //       style: BorderStyle.solid,
                //     ),
                //   ),

                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
