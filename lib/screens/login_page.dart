// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../logic/login_logic.dart';

class LogIn extends StatelessWidget with Login_Logic {
  Color gradient_top = Color(0xFF2E2F36);
  Color gradient_bot = Color(0xE02E2F36);
  @override
  Widget build(BuildContext context) {

    TextEditingController emailController = new TextEditingController();
    TextEditingController passController = new TextEditingController();

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
            children: <Widget>[
              Text("Username"),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.blue,
                  border: OutlineInputBorder(),
                  labelText: 'name@example.com',
                  hintText: 'Enter E-Mail ID',
                ),
              ),
              Text("Username"),
              TextField(
                obscureText: true,
                controller: passController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.red,
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Enter Password',
                ),
                enableSuggestions: false,
                autocorrect: false,
                obscuringCharacter: "●",
              ),
              RaisedButton(
                onPressed: () {
                  signInButtonPressed(emailController.text, passController.text);
                },
                child: Text("Sign In",),
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(45),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
