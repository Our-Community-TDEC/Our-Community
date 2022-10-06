import 'package:flutter/material.dart';
import 'package:final_year_project/screens/Complain%20Pages/complain_page.dart';

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
                  minWidth: 300,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ComplainPage()),
                      );
                    },
                    child: Text("Complain Page"),
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
