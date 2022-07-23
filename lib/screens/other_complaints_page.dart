import 'package:flutter/material.dart';

class Other_Complaints_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.arrow_back),
                Text("Other Complaints"),
              ],
            ),
            Divider(
              color: Colors.blue,
            ),
            Text("Title"),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.blue,
                border: OutlineInputBorder(),
                labelText: 'Complaint Title',
                hintText: 'Give a title for your complaint',
              ),
            ),
            Text("Write Short Description"),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.blue,
                border: OutlineInputBorder(),
                labelText: 'Complaint Title',
                hintText: 'Give a title for your complaint',
              ),
              // maxLines: 8,
            ),
            RaisedButton(
              onPressed: () {},
              child: Text(
                "Raise a Complaint",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
