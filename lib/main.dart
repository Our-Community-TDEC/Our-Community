import 'package:flutter/material.dart';
import 'package:final_year_project/screens/emergency_page.dart';
import 'package:final_year_project/screens/SuggestionsList.dart';

void main() => runApp(MaterialApp(
      home: BasePage(),
    ));

class BasePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black38,
                  child: IconButton(
                    onPressed: () => print('clicked on list'),
                    icon: Icon(Icons.list),
                    color: Colors.blue,
                  ),
                ),
                Container(
                  child: Text(
                    "New Suggestions"
                  ),
                ),
              ],
            ),

        Row(
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
                        MaterialPageRoute(
                            builder: (context) => EmergencyPage()),
                      );
                    },
                    child: Text("New Suggestions"),
                  ),
                ),
                ButtonTheme(
                  minWidth: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SuggestionsList()),
                      );
                    },
                    child: Text("Suggestions List"),
                  ),
                ),
              ],
            ),
          ],
        ),
  ],
      ),

    ),
    );
  }
}
