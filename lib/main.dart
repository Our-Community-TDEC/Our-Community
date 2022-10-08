import 'package:flutter/material.dart';
import 'package:final_year_project/screens/login_page.dart';

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
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LogIn()),
                      );
                    },
                    child: Text("LogIn Page"),
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
