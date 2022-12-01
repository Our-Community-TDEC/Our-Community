import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:final_year_project/logic/OtherComplaints_logic.dart';

class OtherComplains extends StatelessWidget with OtherComplains_Logic {
  @override
  Widget build(BuildContext context) {
    TextEditingController complaint_title = TextEditingController();
    TextEditingController complaint_description = TextEditingController();
    String datetime = (DateFormat.Md('en_US').add_jm().format(DateTime.now()));
    void add_data() async {
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      String title = complaint_title.text.trim();
      String description = complaint_description.text.trim();

      complaint_description.clear();
      complaint_title.clear();

      if (title != '' && description != '') {
        firestore.collection('complaint').doc().set({
          "title": title,
          "descriptoin": description,
          "time": datetime
        }).then((result) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Data Added Successfully"),
            backgroundColor: Colors.blue,
          ));
        });
      }
    }

    return Scaffold(
        backgroundColor: Colors.grey[800],
        body: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 25, 0, 0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.black38,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                          child: IconButton(
                            onPressed: () => {Navigator.pop(context)},
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: Color.fromARGB(255, 0, 141, 241),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(35, 0, 0, 0),
                        child: Text(
                          "Other Complaint",
                          style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Divider(
                    thickness: 5,
                    indent: 12,
                    endIndent: 12,
                    color: Colors.black,
                  ),
                ),
                Column(
                  children: [
                    Container(
                      child: SizedBox(
                        width: 380,
                        child: Text(
                          textAlign: TextAlign.start,
                          "Title",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 380,
                      // height: 300,
                      child: TextField(
                        controller: complaint_title,
                        decoration: InputDecoration(
                          labelText: "Complain title",
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: SizedBox(
                        width: 380,
                        child: Text(
                          textAlign: TextAlign.start,
                          "Write Short Description",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 380,
                      // height: 300,
                      child: TextField(
                        controller: complaint_description,
                        decoration: InputDecoration(
                            labelText: "Enter Your concern Here!!!",
                            filled: true,
                            fillColor: Colors.grey[200],
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none)),
                      ),
                    ),
                    SizedBox(
                      width: 341,
                      height: 78,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: ElevatedButton(  
                          onPressed: () {
                            add_data();
                          },
                          style: ElevatedButton.styleFrom(
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(44.0),
                            ),
                          ),
                          child: Text(
                            "Raise Complain",
                            style: TextStyle(fontSize: 26),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ));
  }
}
