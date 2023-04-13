import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:our_community/logic/OtherComplaints_logic.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../nuemorphism/colors.dart';
import 'package:our_community/nuemorphism/border_effect.dart';

import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool uploadingImage = false;
  bool _isButtonEnabled = true;
  String imageUrl = '';

  WhiteTheme theme = WhiteTheme();
  var back_color = HexColor.WBlackButton;
  var icon_color = HexColor.WBlackButton;
  var name_title_style;
  var address_style;
  var text_list_style;
  bool isDark = false;
  themeF(isDark) {
    print("Theme" + isDark.toString());
    if (false) {
      back_color = HexColor.background_top;
      icon_color = HexColor.icon_color;
      // theme = DarkTheme();
      name_title_style = TextStyle(fontSize: 25, color: HexColor.text_color);
      address_style = TextStyle(fontSize: 20, color: HexColor.text_color);
      text_list_style = TextStyle(color: HexColor.text_color, fontSize: 20);
    } else {
      theme = WhiteTheme();
      back_color = HexColor.Wbackground_color;
      icon_color = HexColor.WiconColor;
      name_title_style = TextStyle(fontSize: 25, color: HexColor.WblueText);
      address_style = TextStyle(fontSize: 20, color: HexColor.WblueText);
      text_list_style = TextStyle(color: HexColor.WblueText, fontSize: 20);
    }
    setState(() {});
  }

  getPreference() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.containsKey("Theme")) {
      isDark = pref.getBool("Theme")!;
    }
    await getUserDetail();
    themeF(isDark);
  }

  @override
  initState() {
    // TODO: implement initState
    super.initState();
    getPreference();

    // getTheme();
  }

  TextEditingController cemailController = TextEditingController();
  TextEditingController cuserNameController = TextEditingController();
  TextEditingController cpasswordController = TextEditingController();
  TextEditingController coPasswordController = TextEditingController();
  TextEditingController creferralController = TextEditingController();
  TextEditingController cflatNumber = TextEditingController();
  TextEditingController cvehicalNumber = TextEditingController();
  TextEditingController cMobileNumber = TextEditingController();
  TextEditingController cdate = TextEditingController();
  TextEditingController cyear = TextEditingController();
  TextEditingController cmonth = TextEditingController();
  TextEditingController cfamilyMember = TextEditingController();
  TextEditingController csloteController = TextEditingController();
  TextEditingController ctimeHourController = TextEditingController();
  TextEditingController ctimeMinuteController = TextEditingController();

  _showAddEventDialog() async {
    await showDialog(
      context: context,
      builder: (context) => SingleChildScrollView(
        child: AlertDialog(
          title: Text(
            'Edit your detail',
            textAlign: TextAlign.center,
          ),
          content: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: cuserNameController,
                  textCapitalization: TextCapitalization.words,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                  ),
                ),
                TextField(
                  controller: cflatNumber,
                  textCapitalization: TextCapitalization.words,
                  decoration: const InputDecoration(
                    labelText: 'Flat/house number',
                  ),
                ),
                TextField(
                  controller: cvehicalNumber,
                  textCapitalization: TextCapitalization.words,
                  decoration: const InputDecoration(
                    labelText: 'Vehical number',
                  ),
                ),
                TextField(
                  controller: cMobileNumber,
                  textCapitalization: TextCapitalization.words,
                  decoration: const InputDecoration(
                    labelText: 'Mobile number',
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 7,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'DD',
                        ),
                        controller: cdate,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 7,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'MM',
                        ),
                        controller: cmonth,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 7,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'YYYY',
                        ),
                        controller: cyear,
                      ),
                    ),
                  ],
                ),
                TextField(
                  controller: cflatNumber,
                  textCapitalization: TextCapitalization.words,
                  decoration: const InputDecoration(
                    labelText: 'Family Member',
                  ),
                ),
                role != "admin" && role != "user"
                    ? Column(
                        children: [
                          TextField(
                            controller: csloteController,
                            textCapitalization: TextCapitalization.words,
                            decoration: const InputDecoration(
                              labelText: 'Slote',
                            ),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 3.5,
                                child: TextField(
                                  controller: ctimeHourController,
                                  textCapitalization: TextCapitalization.words,
                                  decoration: const InputDecoration(
                                    labelText: 'Hour',
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 3.5,
                                child: TextField(
                                  onChanged: (value) {
                                    ctimeHourController.text = value;
                                  },
                                  controller: ctimeMinuteController,
                                  textCapitalization: TextCapitalization.words,
                                  decoration: const InputDecoration(
                                    labelText: 'Minute',
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    : Row(),
              ]),
          actions: [
            TextButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.pop(context);
                }),
            TextButton(
                child: Text('Update detail'),
                onPressed: () {
                  add();
                  Navigator.pop(context);
                })
          ],
        ),
      ),
    );
  }

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  void add() async {
    String userName = cuserNameController.text.toString().trim();
    String flatNumber = cflatNumber.text.toString().trim();
    String date = cdate.text.toString().trim();
    String year = cyear.text.toString().trim();
    String month = cmonth.text.toString().trim();
    String familyMember = cfamilyMember.text.toString().trim();
    String slote = csloteController.text.toString().trim();
    String hour = ctimeHourController.text.toString().trim();
    String minute = ctimeMinuteController.text.toString().trim();
    String mobile = cMobileNumber.text.toString().trim();
    String vehicalNumber = cvehicalNumber.text.toString().trim();
    String DOB = "$date-$month-$year";

    if (userName == "" ||
        flatNumber == "" ||
        date == "" ||
        year == "" ||
        month == "" ||
        familyMember == "" ||
        mobile == "" ||
        slote == "" ||
        hour == "" ||
        minute == "" ||
        vehicalNumber == "") {
      snackBar("Fill all the field");
    } else {
      firestore
          .collection("user")
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .set({
        "userName": userName,
        "flatNumber": flatNumber,
        "dateOfBirth": DOB,
        "familyMember": familyMember,
        "profileImg": imageUrl,
        "mobile": mobile,
        "vehical": vehicalNumber
      }, SetOptions(merge: true)).then((value) => {
                if (role == "doctor")
                  {
                    firestore
                        .collection("user")
                        .doc(FirebaseAuth.instance.currentUser?.uid)
                        .set({
                      "slot": slote,
                      "time": "$hour hr $minute min",
                    }, SetOptions(merge: true)).then(
                            (value) => snackBar("Datial Updated"))
                  },
                if (role == "electrician")
                  {
                    firestore
                        .collection("user")
                        .doc(FirebaseAuth.instance.currentUser?.uid)
                        .set({
                      "slot": slote,
                      "time": "$hour hr $minute min",
                    }, SetOptions(merge: true)).then(
                            (value) => snackBar("Datial Updated"))
                  },
                if (role == "plumber")
                  {
                    firestore
                        .collection("user")
                        .doc(FirebaseAuth.instance.currentUser?.uid)
                        .set({
                      "slot": slote,
                      "time": "$hour hr $minute min",
                    }, SetOptions(merge: true)).then(
                            (value) => snackBar("Datial Updated"))
                  },
                if (role == "cleaner")
                  {
                    firestore
                        .collection("user")
                        .doc(FirebaseAuth.instance.currentUser?.uid)
                        .set({
                      "slot": slote,
                      "time": "$hour hr $minute min",
                    }, SetOptions(merge: true)).then(
                            (value) => snackBar("Datial Updated"))
                  },
                snackBar("Datial Updated"),
              });
    }
  }

  static String role = "";
  String refferalcode = "";
  String userName = "";
  String imgUrl = "";
  String address = "";
  String bod = "";

  Future<String> getUserDetail() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection("user")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    role = snapshot.get("role");
    refferalcode = snapshot.get("refferalcode");
    userName = snapshot.get("userName");
    address = snapshot.get("flatNumber");
    bod = snapshot.get("dateOfBirth");

    String dateString = bod;

// Split the date string into its components
    List<String> dateComponents = dateString.split('-');

// Parse the date components into integers
    int month = int.parse(dateComponents[0]);
    int date = int.parse(dateComponents[1]);
    int year = int.parse(dateComponents[2]);

// Create a DateTime object with the parsed components
    DateTime dateObject = DateTime(year, month, date);

// Get the month, date, and year from the DateTime object
    int monthResult = dateObject.month;
    int dateResult = dateObject.day;
    int yearResult = dateObject.year;

    String durationString = snapshot.get("time");

// Split the duration string into its components
    List<String> durationComponents = durationString.split(' ');

// Parse the hours and minutes as integers
    int hours = int.parse(durationComponents[0]);
    int minutes = int.parse(durationComponents[2]);

    setState(() {
      cuserNameController.text = snapshot.get("userName");
      cflatNumber.text = snapshot.get("flatNumber");
      cvehicalNumber.text = snapshot.get("vehical");
      cMobileNumber.text = snapshot.get("mobile");
      cdate.text = dateResult.toString();
      cyear.text = yearResult.toString();
      cmonth.text = monthResult.toString();
      cfamilyMember.text = snapshot.get("familyMember");
      csloteController.text = snapshot.get("slot");
      ctimeHourController.text = hours.toString();
      ctimeMinuteController.text = minutes.toString();
    });
    print(role);
    setrole();
    return "0";
  }

  bool isUser = true;
  setrole() {
    print("obj" + role);
    if (role == "user") {
      isUser = true;
    } else if (role == "admin") {
      print("object");
      isUser = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var margin = width / 15.77;
    var padding = width / 15.77;
    print(width / 1.40);

    return Theme(
      data: ThemeData(fontFamily: 'poppins'),
      child: Scaffold(
        
        body: Container(
          decoration: theme.background_color,
          child: Container(
            width: width,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: padding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: width,
                    height: width / 1.40,
                    child: Stack(
                      children: [
                        // Rectangle
                        Positioned(
                          // top: 0,
                          top: (width / 2) / 2,
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: SizedBox(
                            width: width,
                            height: width / 2,
                            child: Neumorphic(
                              style: theme.container_style,
                            ),
                          ),
                        ),
                        // Circle
                        Positioned(
                          left: width / 2.5 - 75,
                          child: SizedBox(
                            width: width / 2.28,
                            height: width / 2.28,
                            child: Neumorphic(
                              style: theme.circle_container_style,
                            ),
                          ),
                        ),
                        // Upper circle
                        Positioned(
                          top: 5,
                          left: width / 2.5 - 70,
                          child: Container(
                            width: (width / 2.28) - 10,
                            height: (width / 2.28) - 10,
                            child: imgUrl != ""
                                ? ClipRRect(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(width)),
                                    child: Image.network(
                                      imgUrl,
                                      loadingBuilder: (BuildContext context,
                                          Widget child,
                                          ImageChunkEvent? loadingProgress) {
                                        if (loadingProgress == null) {
                                          return child;
                                        }
                                        return Center(
                                          child: CircularProgressIndicator(
                                            value: loadingProgress
                                                        .expectedTotalBytes !=
                                                    null
                                                ? loadingProgress
                                                        .cumulativeBytesLoaded /
                                                    loadingProgress
                                                        .expectedTotalBytes!
                                                : null,
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                : Container(
                                    width: (width / 2.28) - 10,
                                    height: (width / 2.28) - 10,
                                    child: CircleAvatar(
                                      radius: 30,
                                      child: Image.asset(
                                        'assets/Images/user.png',
                                        width: 40,
                                      ),
                                    ),
                                  ),
                          ),
                        ),
                        // Showing ussr name
                        Positioned(
                          bottom: 20,
                          width: width / 1.223,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      userName,
                                      style: name_title_style,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_pin,
                                          size: 25,
                                          color: icon_color,
                                        ),
                                        Text(
                                          address,
                                          style: address_style,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Neumorphic(
                    style: theme.container_style,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.person_2_outlined,
                                    color: icon_color,
                                    size: 36,
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(4, 0, 0, 0),
                                    child: Text(
                                      "Personal Details",
                                      style: text_list_style,
                                    ),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  _showAddEventDialog();
                                },
                                child: Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: icon_color,
                                  size: 36,
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 2,
                            color: Colors.black,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.person_2_outlined,
                                    color: icon_color,
                                    size: 36,
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(4, 0, 0, 0),
                                    child: Text(
                                      "Emergency Contacts",
                                      style: text_list_style,
                                    ),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: icon_color,
                                size: 36,
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 2,
                            color: Colors.black,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.person_2_outlined,
                                    color: icon_color,
                                    size: 36,
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(4, 0, 0, 0),
                                    child: Text(
                                      "Homes",
                                      style: text_list_style,
                                    ),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: icon_color,
                                size: 36,
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 2,
                            color: Colors.black,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.person_2_outlined,
                                    color: icon_color,
                                    size: 36,
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(4, 0, 0, 0),
                                    child: Text(
                                      "Bank Details",
                                      style: text_list_style,
                                    ),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: icon_color,
                                size: 36,
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 2,
                            color: Colors.black,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.person_2_outlined,
                                    color: icon_color,
                                    size: 36,
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(4, 0, 0, 0),
                                    child: Text(
                                      "Notification",
                                      style: text_list_style,
                                    ),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: icon_color,
                                size: 36,
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 2,
                            color: Colors.black,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.person_2_outlined,
                                    color: icon_color,
                                    size: 36,
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(4, 0, 0, 0),
                                    child: Text(
                                      "Refferal code : $refferalcode",
                                      style: text_list_style,
                                    ),
                                  ),
                                ],
                              ),
                              // Icon(
                              //   Icons.arrow_forward_ios_outlined,
                              //   color: icon_color,
                              //   size: 36,
                              // ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  snackBar(showMsg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(showMsg),
      backgroundColor: Colors.blue,
    ));
  }
}
