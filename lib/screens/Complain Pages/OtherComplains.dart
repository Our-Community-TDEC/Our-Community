import 'package:flutter/material.dart';

class OtherComplains extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[800],
        body: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Other Complains"),
            Divider(
              thickness: 2.5,
              color: Colors.black,
            ),
            Text("Placeholder for text field"),
            Text("Issue Discription"),
            Text("Placeholder for text area"),
            ElevatedButton(onPressed: () {}, child: Text("Raise Complain")),
          ],
        )));
  }
}
