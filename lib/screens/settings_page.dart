import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                //image(),
                Column(
                  children: [
                    Text("Twisha Patel"),
                    Text("twishapatel23@gmail.com"),
                    ElevatedButton(onPressed: () {}, child: Text("Edit Profile")),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}