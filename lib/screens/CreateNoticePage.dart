import 'package:our_community/screens/NoticeBoard_page.dart';
import 'package:flutter/material.dart';

class CreateNoticePage extends StatelessWidget {
  const CreateNoticePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[800],
        padding: EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.black38,
                      child: IconButton(
                        onPressed: () {
                          print('Clicked on list');
                          Navigator.pop(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Notice_Board_Page()));
                        },
                        icon: Icon(Icons.arrow_back),
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(
                        width: 400,
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            "New Notice",
                            style: TextStyle(
                              fontFamily: 'Poppins-SemiBold',
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 35,
                            ),
                          ),
                        ))
                  ],
                )
              ],
            ),
            Divider(
              thickness: 2,
              color: Colors.black,
            ),
            Text(
              'Notice Title',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.black38,
                border: OutlineInputBorder(),
                labelText: 'Notice Title',
                hintText: 'Enter Notice Title here',
                hintStyle: TextStyle(color: Colors.white),
                labelStyle: TextStyle(color: Colors.white),
              ),
            ),
            Text(
              'Notice Description',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.black38,
                border: OutlineInputBorder(),
                labelText: 'Notice Description',
                hintText: 'Enter Notice Description here',
                hintStyle: TextStyle(color: Colors.white),
                labelStyle: TextStyle(color: Colors.white),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      'Time',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.black38,
                        border: OutlineInputBorder(),
                        labelText: 'Notice Description',
                        hintText: 'Enter Notice Description here',
                        hintStyle: TextStyle(color: Colors.white),
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Date',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.black38,
                        border: OutlineInputBorder(),
                        labelText: 'Notice Description',
                        hintText: 'Enter Notice Description here',
                        hintStyle: TextStyle(color: Colors.white),
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue, //background color of button
                        shadowColor: Colors.blue,
                        side: BorderSide(
                            width: 3,
                            color: Colors.blue), //border width and color
                        elevation: 3, //elevation of button
                        shape: RoundedRectangleBorder(
                            //to set border radius to button
                            borderRadius: BorderRadius.circular(30)),
                        // minimumSize: Size(100, 40),
                        padding:
                            EdgeInsets.all(20) //  content padding inside button
                        ),
                    onPressed: () {
                      //code to execute when this button is pressed.
                      print('Clicked on button');
                    },
                    child: Text(
                      "Submit",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
