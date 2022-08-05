import 'package:flutter/material.dart';
import 'package:final_year_project/screens/emergency_page.dart';
<<<<<<< HEAD
import 'package:final_year_project/screens/welcome_page.dart';
import 'package:final_year_project/screens/noticeboard_page.dart';
import 'package:final_year_project/screens/complaints_main_page.dart';
import 'package:final_year_project/screens/other_complaints_page.dart';
import 'package:final_year_project/screens/voting_page.dart';
=======
>>>>>>> main

void main() => runApp(MaterialApp(
      home: BasePage(),
    ));

class BasePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonTheme(
                  minWidth: 200,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EmergencyPage()),
                      );
                    },
                    child: Text("Emergency Page"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
