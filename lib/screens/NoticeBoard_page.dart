import 'package:final_year_project/logic/noticeboard_logic.dart';
import 'package:flutter/material.dart';

class Notice_Board_Page extends StatelessWidget with noticeboaard_logic {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            Text("U write text like this"),
            ElevatedButton(
                onPressed: () {Button_Clicked_Function();},
                child: Text("And button like this")
            ),
          ],
        ),
      ),
    );
  }
}
