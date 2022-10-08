import 'package:final_year_project/screens/Services/Plumber.dart';
import 'package:flutter/material.dart';
import 'package:final_year_project/screens/complain_page.dart';
import 'package:final_year_project/screens/emergency_page.dart';
import 'package:flutter/material.dart';
import 'package:final_year_project/screens/welcome_page.dart';

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
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    width: 200,
                    height: 30,
                    child: ElevatedButton(
                      // onPressed: () {  },
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WelcomePage()),
                        );
                      },
                      child: Text("Welcome Page"),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    width: 200,
                    height: 30,
                    child: ElevatedButton(
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
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    width: 200,
                    height: 30,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ComplainPage()),
                        );
                      },
                      child: Text("Complains Page"),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    width: 200,
                    height: 30,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Plumber()),
                        );
                      },
                      child: Text("Services(Plumber) Page"),
                    ),
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
