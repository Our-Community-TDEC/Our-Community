import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:intl/intl.dart';

import '../../logic/suggestion_logic.dart';
import '../../nuemorphism/border_effect.dart';
import '../../nuemorphism/colors.dart';

TextEditingController suggestion_title = TextEditingController();
TextEditingController suggestion_description = TextEditingController();

class NewSuggestion extends StatelessWidget with AddNewSuggestion {
  WhiteTheme theme = WhiteTheme();
  @override
  Widget build(BuildContext context) {
    String datetime = (DateFormat.Md('en_US').add_jm().format(DateTime.now()));
    void add_data() async {
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      String title = suggestion_title.text.trim();
      String description = suggestion_description.text.trim();

      suggestion_description.clear();
      suggestion_title.clear();

      if (title != '' && description != '') {
        firestore.collection('suggestion').doc().set({
          "title": title,
          "description": description,
          "time": datetime,
          "UID": FirebaseAuth.instance.currentUser?.uid,
        }).then((result) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Suggstion Posted"),
            backgroundColor: Colors.blue,
          ));
        });
      }
    }

    var text_style = TextStyle(
      color: HexColor.WblackText,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    );

    return Theme(
      data: ThemeData(fontFamily: 'poppins'),
      child: Scaffold(
          floatingActionButton: SizedBox(
            height: 45,
            width: 45,
            child: FittedBox(
              child: NeumorphicFloatingActionButton(
                onPressed: () => {Navigator.pop(context)},
                child: Icon(
                  Icons.arrow_back,
                ),
                style: NeumorphicStyle(
                    boxShape: NeumorphicBoxShape.circle(),
                    color: HexColor.Wbackground_color),
              ),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
          backgroundColor: HexColor.Wbackground_color,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 32, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                            child: Text(
                              "New Suggestions",
                              style: TextStyle(
                                fontSize: 29,
                                fontWeight: FontWeight.w500,
                                color: HexColor.WblackText,
                              ),
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
                  ],
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(11, 0, 0, 0),
                          child: Text(
                            "Title",
                            textAlign: TextAlign.start,
                            style: text_style,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.93,
                        // height: 300,
                        child: Container(
                          height: 74,
                          decoration: theme.com_sugge_out_shadow,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 70,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Neumorphic(
                                    style: theme.complaint_neumorphism,
                                    child: TextField(
                                      controller: suggestion_title,
                                      decoration: InputDecoration(
                                          hintText: "Enter Title Here",
                                          hintStyle: TextStyle(
                                            color: HexColor.WblackText,
                                          ),
                                          contentPadding:
                                              EdgeInsets.fromLTRB(10, 50, 0, 0),
                                          filled: true,
                                          fillColor: HexColor.Wbackground_color,
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide.none)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(11, 20, 0, 0),
                          child: Text(
                            "Write short discription",
                            textAlign: TextAlign.start,
                            style: text_style,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.93,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                        child: Container(
                          height: 204,
                          decoration: theme.com_sugge_out_shadow,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 200,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Neumorphic(
                                    style: theme.complaint_neumorphism,
                                    child: TextField(
                                      style: TextStyle(color: Colors.white),
                                      maxLines: null,
                                      controller: suggestion_description,
                                      decoration: InputDecoration(
                                          hintText:
                                              "Enter Your Concern Here!!!",
                                          hintStyle: TextStyle(
                                            color: HexColor.WblackText,
                                          ),
                                          filled: true,
                                          fillColor: HexColor.Wbackground_color,
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                bottomRight:
                                                    Radius.circular(10)),
                                          )),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: SizedBox(
                    width: 341,
                    height: 78,
                    child: NeumorphicButton(
                      style: theme.button,
                      onPressed: () {
                        add_data();
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Suggest",
                            style: TextStyle(
                              fontSize: 26,
                              color: HexColor.WblackText,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
