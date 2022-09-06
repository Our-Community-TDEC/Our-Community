// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../logic/login_logic.dart';

class SearchPage extends StatelessWidget with Login_Logic {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 1000,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Search Someone"),
            TextField(
              maxLines: 1,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("mic"),
            )
          ],
        ),
      ),
    );
  }
}
