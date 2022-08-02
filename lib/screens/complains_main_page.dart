import 'package:flutter/material.dart';

class Complaints_Main_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.keyboard_option_key,
                  color: Colors.blue,
                ),
                Text(
                  "Complaints",
                ),
              ],
            ),
            Divider(
              color: Colors.green,
            ),
            Container(
              color: Colors.blue,
              child: Row(
                children: [
                  Icon(Icons.local_parking),
                  Text(
                    "Parking Issue",
                  )
                ],
              ),
            ),
            Container(
              color: Colors.blue,
              child: Row(
                children: [
                  Icon(Icons.streetview),
                  Text(
                    "Street Issues",
                  )
                ],
              ),
            ),
            Container(
              color: Colors.blue,
              child: Row(
                children: [
                  Icon(Icons.water_drop),
                  Text(
                    "Water Issue",
                  )
                ],
              ),
            ),
            Container(
              color: Colors.blue,
              child: Row(
                children: [
                  Icon(Icons.local_gas_station),
                  Text(
                    "Gas Pipeline Issue",
                  )
                ],
              ),
            ),
            Container(
              color: Colors.blue,
              child: Row(
                children: [
                  Icon(Icons.remove_circle),
                  Text(
                    "Drainage Issue",
                  )
                ],
              ),
            ),
            Container(
              color: Colors.blue,
              child: Row(
                children: [
                  Icon(Icons.electrical_services),
                  Text(
                    "Electrical Issue",
                  )
                ],
              ),
            ),
            Container(
              color: Colors.blue,
              child: Row(
                children: [
                  Icon(Icons.add_road),
                  Text(
                    "Road Issue",
                  )
                ],
              ),
            ),

            RaisedButton(
              onPressed: () {  },
              color: Colors.blueAccent,
              child: Row(
                children: [
                  Icon(Icons.person),
                  Text(
                    "Other Complaints",
                  )
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}