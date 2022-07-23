import 'package:flutter/material.dart';

class NoticeBoardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Container(
        padding: EdgeInsets.all(25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image.asset()
                Text("Welcome to My Gate"),
                Text("Let's get started"),
                RaisedButton(
                  onPressed: () {  },
                  child: Text("Get Started"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}