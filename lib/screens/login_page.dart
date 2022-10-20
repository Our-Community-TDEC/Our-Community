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
        backgroundColor: Colors.transparent,
        body: Container(
          padding: EdgeInsets.all(50),
          margin: EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                  width: 200,
                  // child: Image(
                  //   image: AssetImage('assets/Images/Welcome/WelcomeImage.png'),
                  // )
                  ),
              Text("Username"),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey,
                  border: OutlineInputBorder(),
                  labelText: 'example@gmail.com',
                  hintText: 'Enter E-Mail ID',
                ),
              ),
              Text("password"),
              TextField(
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.key),
                  filled: true,
                  fillColor: Colors.grey,
                  border: OutlineInputBorder(),
                  labelText: '..........',
                  hintText: 'Enter Password',
                ),
                enableSuggestions: false,
                autocorrect: false,
                obscuringCharacter: "●",
              ),
              ElevatedButton(
                onPressed: () {
                  final prov = Provider.of<GoogleSignInProviderss>(context,
                      listen: false);
                  prov.googleLogIn();

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => base1()),
                  );
                },
                child: Text(
                  "Sign in",
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  final prov = Provider.of<GoogleSignInProviderss>(context,
                      listen: false);
                  prov.googleSignOut();
                },
                child: Text(
                  "Sign out",
                ),
                // shape: RoundedRectangleBorder(
                //   borderRadius: new BorderRadius.circular(45),
                // ),
              ),
              ElevatedButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                  );
                },
                child: Text(
                  "Log in",
                ),
              ),
              Text(
                "-----------< Or continue with >-----------",
                style: TextStyle(color: Colors.white),
              ),
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
              //   child: SizedBox(
              //     width: 600,
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         // Image.asset(
              //         //   'assets/images/image 3.png',
              //         //   width: 30,
              //         // ),
              //         Icon(
              //           Icons.apple,
              //           color: Colors.black,
              //           size: 35,
              //         ),
              //         Icon(
              //           Icons.facebook,
              //           color: Colors.blue,
              //           size: 30,
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );

  Future SignIn() async {
    
  }

  }
}
