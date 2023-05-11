import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:intl/intl.dart';
import 'package:our_community/logic/notification.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:time_duration_picker/time_duration_picker.dart';

import '../../logic/services/plumber/Plumber_logic.dart';
import '../../nuemorphism/border_effect.dart';
import '../../nuemorphism/colors.dart';

class Doctor extends StatefulWidget with Plumber_logic {
  @override
  State<Doctor> createState() => _DoctorState();
}

class _DoctorState extends State<Doctor> with sendnotification {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay = DateTime.now();
  var day = DateFormat('dd-MM-yyyy').format(DateTime.now());

  var icon_color = HexColor.WiconColor;
  var page_title_style;

  bool isDark = false;
  var text_color;
  themeF(isDark) {
    print("Theme" + isDark.toString());
    if (isDark) {
      text_color = HexColor.text_color;
      page_title_style = TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w400,
        color: HexColor.text_color,
      );
    } else {
      text_color = HexColor.WblueText;
      page_title_style = TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w400,
        color: HexColor.WblueText,
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
    deleteExpiredDocuments();
    // getTheme();
  }

  Future<String> getslot() async {
    DateTime now = DateTime.now();
    String day = DateFormat('dd-MM-yyyy').format(now);
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection("doctor")
        .where("date", isEqualTo: day)
        .get();
    if (snapshot.docs.isNotEmpty) {
      int slotValue = snapshot.size;
      String slot = slotValue.toString();
      return slot;
    } else {
      return "0";
    }
  }

  String bookTimeLimit = "2 hr 00 min";

  Future<String> getTotalslot() async {
  QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
      .instance
      .collection("user")
      .where("role", isEqualTo: "doctor")
      .where("refferalcode" , isEqualTo: refferalcode)
      .get();

  if (snapshot.docs.isNotEmpty) {
    Map<String, dynamic> slotData = snapshot.docs.first.data() as Map<String, dynamic>;
    String slot = slotData["slot"];
    bookTimeLimit = slotData['time'];
    return slot;
  } else {
    return "0";
  }
}

  Future<void> deleteExpiredDocuments() async {
    DateTime now = DateTime.now();
    String day = DateFormat('dd-MM-yyyy').format(now);

    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('doctor')
        .where('date', isLessThan: day)
        .get();

    snapshot.docs.forEach((document) async {
      await document.reference.delete();
    });
  }

  TextEditingController plumbingTitle = TextEditingController();
  TextEditingController plumbingDescription = TextEditingController();
  @override
  _showAddEventDialog() async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Book Appointment',
          textAlign: TextAlign.center,
        ),
        content: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: plumbingTitle,
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                  labelText: 'Title',
                ),
              ),
              TextField(
                controller: plumbingDescription,
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                  labelText: 'Description',
                ),
              )
            ]),
        actions: [
          TextButton(
              child: Text('Cancel'),
              onPressed: () {
                plumbingTitle.clear();
                plumbingDescription.clear();
                Navigator.pop(context);
              }),
          TextButton(
              child: Text('Book Appointment'),
              onPressed: () {
                add();
                Navigator.pop(context);
              })
        ],
      ),
    );
  }

  Duration duration = const Duration(hours: 12, minutes: 00);
  Duration timeLimit = const Duration(hours: 2, minutes: 00);
  int slot = 0;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  void add() async {
    String currentSlot = await getslot();
    String totalSlot = await getTotalslot();
    slot = int.parse(currentSlot);

    String timeString = bookTimeLimit;
    List<String> parts = timeString.split(' ');
    int hours = int.parse(parts[0]);
    int minutes = int.parse(parts[2]);
    timeLimit = Duration(hours: hours, minutes: minutes);

    if (slot < int.parse(totalSlot)) {
      if (duration <= timeLimit) {
        String title = plumbingTitle.text.trim();
        String discription = plumbingDescription.text.trim();
        if (title != "" || discription != "") {
          slot += 1;
          firestore.collection("doctor").doc().set({
            "title": title,
            "discription": discription,
            "date": day,
            "duration": workDuration,
            "refferalcode": refferalcode
          }).then(
            (value) => {
              sendServiceNotificationToAllUsers("New Slot Booked", "doctor"),
              plumbingTitle.clear(),
              plumbingDescription.clear(),
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Appintment booked"),
                  backgroundColor: Colors.blue,
                ),
              ),
            },
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("please enter all detail"),
            backgroundColor: Colors.blue,
          ));
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("you can book for only $hours hour $minutes minute"),
          backgroundColor: Colors.blue,
        ));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("all slots are booked"),
        backgroundColor: Colors.blue,
      ));
    }
  }

  String alarmTime = "12:00 PM";
  String bedTime = "12:00 AM";
  String workDuration = "12 hr 00 min";
  @override
  Widget build(BuildContext context) {
    double smallerMarginRatio = 0.025;
    final theme = isDark ? DarkTheme() : WhiteTheme();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddEventDialog(),
        child: Icon(Icons.add),
      ),
      body: Container(
        decoration: theme.background_color,
        child: Column(children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 70, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: NeumorphicButton(
                        onPressed: () => {Navigator.pop(context)},
                        style: theme.back_button,
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: icon_color,
                        ),
                      ),
                    ),
                    Text(
                      "Doctor",
                      style: page_title_style,
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 5,
                indent: 12,
                endIndent: 12,
                color: Colors.black,
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height - 106,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  // height: MediaQuery.of(context).size.height/2.,
                  width: MediaQuery.of(context).size.width,
                  child: TableCalendar(
                    firstDay: DateTime.utc(2022, 1, 1),
                    lastDay: DateTime.utc(2023, 12, 31),
                    focusedDay: _focusedDay,
                    selectedDayPredicate: (day) {
                      return isSameDay(_selectedDay, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        _selectedDay = selectedDay;
                        day = DateFormat('dd-MM-yyyy').format(selectedDay);
                        _focusedDay = focusedDay;
                      });
                    },
                    // eventLoader: (day) {
                    //   return _getEventsForDay(
                    //     day,
                    //   );
                    // },

                    calendarFormat: _calendarFormat,
                    // @ week , week , month format of calender
                    onFormatChanged: (format) {
                      setState(() {
                        _calendarFormat = format;
                      });
                    },
                    headerStyle: HeaderStyle(
                      titleTextStyle: TextStyle(
                        color: text_color,
                        fontSize: 16,
                      ),
                      formatButtonTextStyle: TextStyle(
                        color: text_color,
                        fontSize: 16,
                      ),
                    ),
                    calendarStyle: CalendarStyle(
                      defaultTextStyle: TextStyle(
                        color: text_color,
                        fontSize: 16,
                      ),
                      weekendTextStyle: TextStyle(
                        color: text_color,
                        fontSize: 16,
                      ),
                      outsideTextStyle: TextStyle(
                        color: isDark
                            ? HexColor.text_color.withOpacity(0.4)
                            : HexColor.WblueText.withOpacity(0.8),
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                TimeDurationPicker(
                  diameter: size.width / 2.3,
                  icon1Data: Icons.more_time_sharp,
                  icon2Data: Icons.av_timer_sharp,
                  knobDecoration: theme.knobdecoration,
                  clockDecoration: theme.clockdecoration,
                  clockTextStyle: TextStyle(
                      color: isDark ? HexColor.text_color : HexColor.WblueText),
                  knobBackgroundDecoration: theme.knobBackgrounddecoration,
                  onIcon1RotatedCallback: (value) {
                    setState(() {
                      String timeString = value;
                      DateTime parsedTime =
                          DateFormat('h:mm a').parse(timeString);
                      TimeOfDay time = TimeOfDay.fromDateTime(parsedTime);
                      alarmTime = value;
                    });
                  },
                  onIcon2RotatedCallback: (value) {
                    setState(() {
                      bedTime = value;
                    });
                  },
                  setDurationCallback: (value) {
                    setState(() {
                      String timeString = value;
                      List<String> parts = timeString.split(' ');
                      int hours = int.parse(parts[0]);
                      int minutes = int.parse(parts[2]);
                      duration = Duration(hours: hours, minutes: minutes);
                      workDuration = value;
                    });
                  },
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 120,
                        height: 120,
                        child: Neumorphic(
                          style: theme.servive_container,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Total duration",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: isDark
                                        ? HexColor.text_color
                                        : HexColor.WblackText,
                                    fontSize: 20),
                              ),
                              Text(
                                workDuration,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: isDark
                                        ? HexColor.text_color
                                        : HexColor.WblackText),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 120,
                        height: 120,
                        child: Neumorphic(
                          style: theme.servive_container,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Start time",
                                style: TextStyle(
                                    color: isDark
                                        ? HexColor.text_color
                                        : HexColor.WblackText,
                                    fontSize: 20),
                              ),
                              Text(
                                bedTime,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: isDark
                                        ? HexColor.text_color
                                        : HexColor.WblackText),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 120,
                        height: 120,
                        child: Neumorphic(
                          style: theme.servive_container,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "End Time",
                                style: TextStyle(
                                    color: isDark
                                        ? HexColor.text_color
                                        : HexColor.WblackText,
                                    fontSize: 20),
                              ),
                              Text(
                                alarmTime,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: isDark
                                        ? HexColor.text_color
                                        : HexColor.WblackText),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
