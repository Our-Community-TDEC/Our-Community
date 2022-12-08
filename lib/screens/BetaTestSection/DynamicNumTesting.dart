import 'package:flutter/material.dart';

class DynamicNumTesting extends StatelessWidget {
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
                for(int i = 0;i < 5;i++)
                  Text("Hoi $i"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}