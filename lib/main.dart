import 'package:flutter/material.dart';
import 'package:final_year_project/screens/login_page.dart';
import 'package:final_year_project/screens/emergency_page.dart';
import 'package:final_year_project/screens/welcome_page.dart';
import 'package:final_year_project/screens/noticeboard_page.dart';
import 'package:final_year_project/screens/complaints_main_page.dart';
import 'package:final_year_project/screens/other_complaints_page.dart';
import 'package:final_year_project/screens/BetaTestSection/PiCharts.dart';

void main() => runApp (
    MaterialApp (
      home: BasePage(),
    )
);

class BasePage extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    return Scaffold (
      body: Container (
        padding: EdgeInsets.all(25),
        child: Row (
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column (
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonTheme(
                  minWidth: 200,
                  child:RaisedButton (
                    // onPressed: () {  },
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => WelcomePage()),
                      );
                    },
                    child: Text("Welcome Page"),
                  ),
                ),
                ButtonTheme(
                  minWidth: 200,
                  child:RaisedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LogIn()),
                      );
                    },
                    child: Text("LogIn Page"),
                  ),
                ),
                ButtonTheme(
                  minWidth: 200,
                  child:RaisedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EmergencyPage()),
                      );
                    },
                    child: Text("Emergency Page"),
                  ),
                ),
                ButtonTheme(
                  minWidth: 200,
                  child:RaisedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Complaints_Main_Page()),
                      );
                    },
                    child: Text("Complaints Main Page"),
                  ),
                ),
                ButtonTheme(
                  minWidth: 200,
                  child:RaisedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Other_Complaints_Page()),
                      );
                    },
                    child: Text("Other Complaints Page"),
                  ),
                ),
                ButtonTheme(
                  minWidth: 200,
                  child:RaisedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Pie_Chart_Widget()),
                      );
                    },
                    child: Text("Pie Chart (Beta)"),
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