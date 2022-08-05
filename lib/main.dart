import 'package:final_year_project/logic/voting_logic.dart';
import 'package:flutter/material.dart';
import 'package:final_year_project/screens/voting_page.dart';

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
                        MaterialPageRoute(builder: (context) => Voting_Page()),
                      );
                    },
                    child: Text("Voting Page"),
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
