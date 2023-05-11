import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:our_community/logic/OtherComplaints_logic.dart';
import 'package:intl/intl.dart';
import 'package:our_community/logic/notification.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import '../../nuemorphism/colors.dart';
import 'package:our_community/nuemorphism/border_effect.dart';

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:firebase_storage/firebase_storage.dart';

TextEditingController complaint_title = TextEditingController();
TextEditingController complaint_description = TextEditingController();

class OtherComplains extends StatefulWidget with OtherComplains_Logic {
  static String ttle = "", desc = "";

  OtherComplains(String title, String description) {
    ttle = title;
    desc = description;
  }

  @override
  State<OtherComplains> createState() => _OtherComplainsState();
}

class _OtherComplainsState extends State<OtherComplains> with sendnotification {
  bool uploadingImage = false;
  bool _isButtonEnabled = true;

  // var theme;

  var icon_color = HexColor.WBlackButton;
  var page_title_style;
  var text_style;
  var button_text;
  bool isDark = false;
  String imageUrl = '';
  themeF(isDark) {
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
    refferalcode = await getCurrentUserRefferalCode();
    themeF(isDark);
  }

  String refferalcode = "";
  Future<String> getCurrentUserRefferalCode() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection("user")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    return snapshot.get("refferalcode");
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
    
    final theme = isDark ? DarkTheme() : WhiteTheme(); 
    complaint_title.text = OtherComplains.ttle;
    complaint_description.text = OtherComplains.desc;
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
          "description": description,
          "time": datetime,
          "UID": FirebaseAuth.instance.currentUser?.uid,
          "img": imageUrl,
          "refferalcode": refferalcode
        }).then((result) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Complain Posted"),
            backgroundColor: Colors.blue,
          ));
          sendNotificationToAllUsers(title);
        }).catchError((onError) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(onError),
            backgroundColor: Colors.blue,
          ));
        });
      } else {
        print("Aksh Exception Caught");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Please fill data in Title and Description."),
          backgroundColor: Colors.blue,
        ));
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
                                "Other Complaint",
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
                                        controller: complaint_title,
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
                              "Write short description",
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
                                        controller: complaint_description,
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
                      IconButton(
                        onPressed: () async {
                          ImagePicker imagePicker = ImagePicker();
                          XFile? file = await imagePicker.pickImage(
                              source: ImageSource.camera);

                          if (file == null) return;
                          print('pppppaaaaaaathhhhhhh${file.path}');

                          String uniqueFileName =
                              DateTime.now().millisecondsSinceEpoch.toString();

                          Reference referenceRoot =
                              FirebaseStorage.instance.ref();
                          Reference referenceDirImages =
                              referenceRoot.child('complaint/');

                          Reference referenceImageToUpload =
                              referenceDirImages.child(uniqueFileName);

                          try {
                            setState(() {
                              uploadingImage = true;
                              _isButtonEnabled = false;
                            });

                            await referenceImageToUpload
                                .putFile(File(file.path));
                            imageUrl =
                                await referenceImageToUpload.getDownloadURL();

                            setState(() {
                              uploadingImage = false;
                              _isButtonEnabled = true;
                            });
                          } catch (error) {
                            setState(() {
                              _isButtonEnabled = true;
                              uploadingImage = false;
                            });
                          }
                        },
                        icon: Icon(Icons.camera_alt),
                      ),
                      IconButton(
                        onPressed: () async {
                          ImagePicker imagePicker = ImagePicker();
                          XFile? file = await imagePicker.pickImage(
                              source: ImageSource.gallery);

                          if (file == null) return;
                          print('pppppaaaaaaathhhhhhh${file.path}');

                          String uniqueFileName =
                              DateTime.now().millisecondsSinceEpoch.toString();

                          Reference referenceRoot =
                              FirebaseStorage.instance.ref();
                          Reference referenceDirImages =
                              referenceRoot.child('complaint/');

                          Reference referenceImageToUpload =
                              referenceDirImages.child(uniqueFileName);

                          try {
                            setState(() {
                              uploadingImage = true;
                              _isButtonEnabled = false;
                            });

                            await referenceImageToUpload
                                .putFile(File(file.path));
                            imageUrl =
                                await referenceImageToUpload.getDownloadURL();

                            setState(() {
                              uploadingImage = false;
                              _isButtonEnabled = true;
                            });
                          } catch (error) {
                            setState(() {
                              _isButtonEnabled = true;
                              uploadingImage = false;
                            });
                          }
                        },
                        icon: Icon(Icons.browse_gallery_outlined),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                        child: SizedBox(
                          width: 341,
                          height: 78,
                          child: NeumorphicButton(
                            style: theme.button,
                            onPressed: () {
                              _isButtonEnabled ? add_data() : null;
                            },
                               child:  Center(child: _isButtonEnabled ? Text("Raise Complain", style: button_text) : CircularProgressIndicator()),
                                
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }

  Color? _iconsColor(BuildContext context) {
    final theme = NeumorphicTheme.of(context);
    if (theme!.isUsingDark) {
      return theme.current!.accentColor;
    } else {
      return null;
    }
  }

  Color _textColor(BuildContext context) {
    if (NeumorphicTheme.isUsingDark(context)) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }
}
