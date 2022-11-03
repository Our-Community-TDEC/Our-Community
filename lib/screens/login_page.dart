// ignore_for_file: prefer_const_constructors

//import 'dart:ffi';

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
              Image(
                image: AssetImage('assets/images/Trees.png'),
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
                controller: passController,
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
                  signInButtonPressed(
                      emailController.text, passController.text);
                },
                child: Text(
                  "Sign in",
                ),
                // shape: RoundedRectangleBorder(
                //   borderRadius: new BorderRadius.circular(45),
                // ),
              ),
              Text(
                "-----------< Or continue with >-----------",
                style: TextStyle(color: Colors.white),
              ),
              Container(
                width: 400,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    width: 2.0,
                    color: Colors.blue,
                    style: BorderStyle.solid,
                  ),
                ),
                child: SizedBox(
                  width: 600,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/images/image 3.png',
                        width: 30,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
