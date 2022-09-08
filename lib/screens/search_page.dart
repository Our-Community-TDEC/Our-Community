// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../logic/search_login.dart';

class SearchPage extends StatelessWidget with Search_Logic {
  TextEditingController queryString = new TextEditingController();

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
              controller: queryString,
            ),
            ElevatedButton(
              onPressed: () {
                search(queryString.text);
              },
              child: Text("Search"),
            )
          ],
        ),
      ),
    );
  }
}
