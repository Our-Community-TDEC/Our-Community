import 'package:flutter/material.dart';
import 'package:our_community/logic/buildings_designer_logic.dart';
import 'package:our_community/nuemorphism/border_effect.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BuildingsDesignerPage extends StatefulWidget
    with BuildingsDesignerPage_Logic {
  @override
  State<BuildingsDesignerPage> createState() => _BuildingsDesignerPageState();
}

class _BuildingsDesignerPageState extends State<BuildingsDesignerPage> {
  var theme;
  bool isDark = false;
  themeF(isDark) {
    print("Theme" + isDark.toString());
    if (isDark) {
      theme = DarkTheme();
    } else {}
    setState(() {});
  }

  getPreference() async {
    var pref = await SharedPreferences.getInstance();
    isDark = pref.getBool("Theme")!;
    print("object" + isDark.toString());
    themeF(isDark);
  }

  @override
  initState() {
    // TODO: implement initState
    super.initState();
    getPreference();
    // getTheme();
  }

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
        // padding: const EdgeInsets.all(0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
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
