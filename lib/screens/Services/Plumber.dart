import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:time_duration_picker/time_duration_picker.dart';

import '../../logic/services/plumber/Plumber_logic.dart';
import '../../nuemorphism/border_effect.dart';
import '../../nuemorphism/colors.dart';

class Plumber extends StatefulWidget with Plumber_logic {
  const Plumber({super.key});

  @override
  State<StatefulWidget> createState() => _Plumber();
}

class _Plumber extends State<Plumber> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay = DateTime.now();
  var day = DateFormat('dd-MM-yyyy').format(DateTime.now());

  var icon_color = HexColor.WBlackButton;
  var page_title_style;
  var theme;
  bool isDark = false;
  themeF(isDark) {
    print("Theme" + isDark.toString());
    if (isDark) {
      theme = DarkTheme();
      page_title_style = TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w400,
        color: HexColor.text_color,
      );
    } else {
      theme = WhiteTheme();
      page_title_style = TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w400,
        color: HexColor.WblueText,
      );
    }
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
    deleteExpiredDocuments();
    // getTheme();
  }

  Future<String> getslot() async {
    DateTime now = DateTime.now();
    String day = DateFormat('dd-MM-yyyy').format(now);
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection("plumber")
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
    DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
        .instance
        .collection("plumber")
        .doc("plumberdetail")
        .get();

    if (snapshot.exists && snapshot.data() != null) {
      Map<String, dynamic> slotData = snapshot.data() as Map<String, dynamic>;
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
        .collection('plumber')
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
          'Add new Notice',
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
              child: Text('Add Notice'),
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
          firestore.collection("plumber").doc().set({
            "title": title,
            "discription": discription,
            "date": day,
            "duration": workDuration,
          }).then(
            (value) => {
              plumbingTitle.clear(),
              plumbingDescription.clear(),
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Notice added"),
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
          content: Text(
              "you can appoint for only $hours hour $minutes minute"),
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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddEventDialog(),
        child: Icon(Icons.add),
      ),
      backgroundColor: HexColor.Wbackground_color,
      body: Container(
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
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: icon_color,
                        ),
                        style: theme.back_button,
                      ),
                    ),
                    Text(
                      "Plumbing",
                      style: page_title_style,
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 5,
                indent: 12,
                endIndent: 12,
                color: Colors.black,
              ),
            ],
          ),
          // Row(
          //   children: [
          //     SvgPicture.asset(
          //       'assets/Images/Services/Plumber/background.svg',
          //       semanticsLabel: 'My SVG Image',
          //     ),
          //   ],
          // ),
          Row(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 5, 0, 5),
                  child: Text(
                    "Select Services",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: (() {
                          // Drainage();
                        }),
                        style: ElevatedButton.styleFrom(
                            primary: const Color((0xffb4D4E54))),
                        child: SizedBox(
                          width: 60,
                          height: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.asset(
                                'assets/Images/Services/Plumber/image 71.png',
                                width: 50,
                                height: 40,
                              ),
                              Column(
                                children: const [
                                  Text("Drainage"),
                                  Text("system"),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: (() {
                          // Repair();
                        }),
                        style: ElevatedButton.styleFrom(
                            primary: const Color((0xffb4D4E54))),
                        child: SizedBox(
                          width: 60,
                          height: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.asset(
                                'assets/Images/Services/Plumber/image 73.png',
                                width: 60,
                                height: 40,
                              ),
                              Column(
                                children: const [
                                  Text("Repair"),
                                  Text("Pipe"),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: (() {
                          // Fitting();
                        }),
                        style: ElevatedButton.styleFrom(
                            primary: const Color((0xffb4D4E54))),
                        child: SizedBox(
                          width: 60,
                          height: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.asset(
                                'assets/Images/Services/Plumber/image 76.png',
                                width: 60,
                                height: 40,
                              ),
                              Column(
                                children: const [
                                  Text("Fitting"),
                                  Text("Pipe"),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      child: Text(
                        "Data",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
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
                    calendarBuilders: CalendarBuilders(
                      dowBuilder: (context, day) {
                        if (day.weekday == DateTime.sunday) {
                          final text = DateFormat.E().format(day);
                          return Center(
                            child: Text(
                              text,
                              style: TextStyle(color: Colors.red),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                )
              ],
            ),
            // Next part
          ]),
          TimeDurationPicker(
            diameter: size.width / 2.3,
            icon1Data: Icons.notifications_none,
            icon2Data: Icons.bed,
            knobDecoration: BoxDecoration(
              color: HexColor.WblackText,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: Offset(-2, -2),
                  blurRadius: 5,
                  spreadRadius: 1,
                ),
                BoxShadow(
                  color: Colors.white.withOpacity(0.7),
                  offset: Offset(2, 2),
                  blurRadius: 5,
                  spreadRadius: 1,
                ),
              ],
            ),
            clockDecoration: BoxDecoration(
              color: HexColor.Wbackground_color,
              boxShadow: [
                BoxShadow(
                  color: HexColor.Wdark_container,
                  offset: Offset(-2, -2),
                  blurRadius: 2,
                  spreadRadius: 4,
                ),
                BoxShadow(
                  color: HexColor.Wlight_container,
                  offset: Offset(2, 2),
                  blurRadius: 2,
                  spreadRadius: 4,
                ),
              ],
            ),
            knobBackgroundDecoration: BoxDecoration(
              color: HexColor.Wbackground_color,
              boxShadow: [
                BoxShadow(
                  color: HexColor.Wdark_container,
                  offset: Offset(0, 0),
                  blurRadius: 5,
                  spreadRadius: 7,
                ),
                BoxShadow(
                  color: HexColor.Wlight_container,
                  offset: Offset(0, 0),
                  blurRadius: 5,
                  spreadRadius: 7,
                ),
              ],
            ),
            onIcon1RotatedCallback: (value) {
              setState(() {
                String timeString = value;
                DateTime parsedTime = DateFormat('h:mm a').parse(timeString);
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
          //  SizedBox(height: size.height * 2 * smallerMarginRatio),
          //       SizedBox(
          //         width: size.width * 0.45,
          //         child: FittedBox(
          //           fit: BoxFit.fitWidth,
          //           child: Text(
          //             workDuration,
          //             style: const TextStyle(
          //               color: Color.fromRGBO(
          //                 54,
          //                 61,
          //                 86,
          //                 1,
          //               ),
          //               fontWeight: FontWeight.bold,
          //             ),
          //           ),
          //         ),
          //       ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              workDuration,
              style: TextStyle(fontSize: 20),
            ),
            Text(
              bedTime,
              style: TextStyle(fontSize: 20),
            ),
            Text(
              alarmTime,
              style: TextStyle(fontSize: 20),
            )
          ]),
        ]),
      ),
    );
  }
}
