import 'dart:math';

import 'package:flutter/material.dart';
import 'package:final_year_project/logic/society_designer_logic.dart';

class SocietyDesignerPage extends StatelessWidget
    with SocietyDesignerPage_Logic {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Text("Manage Address"),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter a search term',
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: width / 2,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter a search term',
                  ),
                ),
              ),
              SizedBox(
                width: width / 2,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter a search term',
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
                    hintText: 'Enter a search term',
                  ),
                ),
              ),
              SizedBox(
                width: width / 2,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter a search term',
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
                    hintText: 'Enter a search term',
                  ),
                ),
              ),
              SizedBox(
                width: width / 2,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter a search term',
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
