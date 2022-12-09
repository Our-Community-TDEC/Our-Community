import 'package:flutter/material.dart';
import 'package:our_community/logic/buildings_designer_logic.dart';

class BuildingsDesignerPage extends StatelessWidget
    with BuildingsDesignerPage_Logic {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double BuildingsSliderVal = 0, FloorsSliderVal = 0;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("City"),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'City',
              ),
            ),
            Text("Society Name"),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Society Name',
              ),
            ),
            Text("Number Of Buildings"),
            Slider(
                value: BuildingsSliderVal,
                min: 0,
                max: 1000,
                label: "BuildingsSliderVal",
                onChanged: (value) {
                  print("No of Buildings");
                  print(value);
                }),
            Text("Number Of Floors per building"),
            Slider(
                value: FloorsSliderVal,
                min: 0,
                max: 1000,
                label: "BuildingsSliderVal",
                onChanged: (value) {
                  print("No of Floors");
                  print(value);
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(onPressed: () {}, child: Text("Cancle")),
                ElevatedButton(onPressed: () {}, child: Text("Submit")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
