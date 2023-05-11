import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:our_community/logic/notification.dart';
import 'package:our_community/logic/suggestion_logic.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../nuemorphism/colors.dart';
import 'package:our_community/nuemorphism/border_effect.dart';

import 'package:flutter_neumorphic/flutter_neumorphic.dart';

TextEditingController suggestion_title = TextEditingController();
TextEditingController suggestion_description = TextEditingController();

class NewSuggestion extends StatefulWidget with AddNewSuggestion {
  @override
  State<NewSuggestion> createState() => _NewSuggestionState();
}

class _NewSuggestionState extends State<NewSuggestion> with sendnotification {
  var icon_color = HexColor.WBlackButton;
  var page_title_style;
  var text_style;
  var button_text;
  bool isDark = false;
  themeF(isDark) {
    print("Theme" + isDark.toString());
    if (isDark) {
      page_title_style = TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w500,
        color: HexColor.text_color,
      );

      button_text = TextStyle(
        fontSize: 26,
        color: HexColor.text_color,
        fontWeight: FontWeight.w500,
      );

      text_style = TextStyle(
        color: HexColor.text_color,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      );

      icon_color = HexColor.icon_color;
    } else {
      icon_color = HexColor.WiconColor;
      page_title_style = TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w500,
        color: HexColor.WblueText,
      );

      text_style = TextStyle(
        color: HexColor.WblueText,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      );

      button_text = TextStyle(
        fontSize: 26,
        color: HexColor.WblackText,
        fontWeight: FontWeight.w500,
      );
    }
    setState(() {});
  }

  getPreference() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.containsKey("Theme")) {
      isDark = pref.getBool("Theme")!;
    }
    themeF(isDark);
  }

  @override
  initState() {
    // TODO: implement initState
    super.initState();
    getPreference();
    // getTheme();
  }

  Future<String> getCurrentUserReferralCode() async {
    final user = FirebaseAuth.instance.currentUser?.uid;
    DocumentSnapshot snapshot =
        await FirebaseFirestore.instance.collection('user').doc(user).get();
    return snapshot.get('refferalcode');
  }

  @override
  Widget build(BuildContext context) {
    String datetime = (DateFormat.Md('en_US').add_jm().format(DateTime.now()));
    final theme = isDark ? DarkTheme() : WhiteTheme();
    void add_data() async {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      String refferalcode = await getCurrentUserReferralCode();
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
          "refferalcode": refferalcode
        }).then((result) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Suggstion Posted"),
            backgroundColor: Colors.blue,
          ));
          sendNotificationToAllUsers("New Complaint Arived");
        });
      }
    }

    return Theme(
      data: ThemeData(
        fontFamily: 'poppins',
      ),
      child: Scaffold(
          floatingActionButton: SizedBox(
            height: 45,
            width: 45,
            child: FittedBox(
              child: NeumorphicFloatingActionButton(
                onPressed: () => {Navigator.pop(context)},
                child: Icon(
                  Icons.arrow_back,
                  color: icon_color,
                ),
                style: theme.back_button,
              ),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
          body: Container(
            height: MediaQuery.of(context).size.height,
            decoration: theme.background_color,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 7, 0, 0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(70, 0, 0, 0),
                              child: Text(
                                "New Suggestion",
                                style: page_title_style,
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
                                        style:
                                            theme.com_sugg_textfield_textstyle,
                                        controller: suggestion_title,
                                        decoration:
                                            theme.com_sugg_textfield_decoration,
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
                                        style:
                                            theme.com_sugg_textfield_textstyle,
                                        maxLines: null,
                                        controller: suggestion_description,
                                        decoration: theme
                                            .com_sugg_textfield_desc_decoration,
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
                            Text("Suggest", style: button_text),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
