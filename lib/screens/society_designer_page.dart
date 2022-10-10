import 'dart:math';

import 'package:flutter/material.dart';
import 'package:final_year_project/logic/society_designer_logic.dart';

class SocietyDesignerPage extends StatelessWidget
    with SocietyDesignerPage_Logic {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        
        child: Icon(Icons.arrow_back),
      ),
      body: Column(
        children: [
          Text(
            "Manage Address",
            style: TextStyle(
              fontSize: width * 0.075,
              fontWeight: FontWeight.w700,
            ),
          ),
          Padding(padding: EdgeInsets.all(height * 0.025)),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Address',
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: width / 2,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Pin Code',
                  ),
                ),
              ),
              SizedBox(
                width: width / 2,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'City/Town',
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: width / 2,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'State',
                  ),
                ),
              ),
              SizedBox(
                width: width / 2,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Landmark',
                  ),
                ),
              ),
            ],
          ),
          Text("Address Type"),
          Row(
            children: [
              Radio(
                  value: "Row House",
                  groupValue: "HouseType",
                  onChanged: (value) {
                    print(value);
                  }),
              Text("Row House")
            ],
          ),
          Row(
            children: [
              Radio(
                  value: "Row House",
                  groupValue: "HouseType",
                  onChanged: (value) {
                    print(value);
                  }),
              Text("Flats")
            ],
          ),
          Text("Row House Details"),
          Row(
            children: [
              SizedBox(
                width: width / 2,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Sector Number',
                  ),
                ),
              ),
              SizedBox(
                width: width / 2,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'House Number',
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                  width: width * 0.25,
                  child:
                      ElevatedButton(onPressed: () {}, child: Text("Cancle"))),
              SizedBox(
                  width: width * 0.25,
                  child:
                      ElevatedButton(onPressed: () {}, child: Text("Submit"))),
            ],
          ),
        ],
      ),
    );
  }
}
