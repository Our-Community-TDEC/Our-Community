// import 'package:final_year_project/screens/Services/Plumber.dart';
import 'package:final_year_project/screens/Services/Plumber.dart';
import 'package:flutter/material.dart';
import 'package:final_year_project/screens/complain_page.dart';

void main() => runApp(MaterialApp(
      home: Plumber(),
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonTheme(
                    minWidth: 300,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ComplainPage()));
                      },
                      child: Text("Complain Page"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
