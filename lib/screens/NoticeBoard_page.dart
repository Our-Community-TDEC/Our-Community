import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../nuemorphism/border_effect.dart';
import '../nuemorphism/colors.dart';
import 'package:table_calendar/table_calendar.dart';

class AttendanceCalendarPage extends StatefulWidget {
  final String sub;
  final String studentId;

  const AttendanceCalendarPage({
    Key? key,
    required this.sub,
    required this.studentId,
  }) : super(key: key);

  @override
  _AttendanceCalendarPageState createState() => _AttendanceCalendarPageState();
}

class _AttendanceCalendarPageState extends State<AttendanceCalendarPage> {
  var title_style;
  var desc_text_style;
  var page_title_style;
  var icon_color = HexColor.WBlackButton;
  var btn_text;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay = DateTime.now();
  var documents;
  var listEventSize;
  var day = DateFormat('dd-MM-yyyy').format(DateTime.now());
  bool isUser = true;
  static String role = "";
  WhiteTheme theme = WhiteTheme();
  bool isDark = false;
  Future<String> getRole() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection("user")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    role = snapshot.get("role");
    setrole();
    return "0";
  }

  Future<void> deleteExpiredDocuments() async {
    DateTime now = DateTime.now();
    String day = DateFormat('dd-MM-yyyy').format(now);

    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('noticeboard')
        .where('date', isLessThan: day)
        .get();

    snapshot.docs.forEach((document) async {
      await document.reference.delete();
    });
  }

  setrole() {
    print("obj" + role);
    if (role == "user") {
      isUser = true;
    } else if (role == "admin") {
      isUser = false;
    }
  }

  themeF(isDark) {
    print("Theme" + isDark.toString());
    // if (false) {
    //   // theme = DarkTheme();
    //   title_style = TextStyle(
    //       fontSize: 20,
    //       fontWeight: FontWeight.w700,
    //       color: HexColor.text_color,
    //       fontFamily: 'poppins');

    //   page_title_style = TextStyle(
    //     fontSize: 30,
    //     fontWeight: FontWeight.w400,
    //     color: HexColor.text_color,
    //   );

    //   desc_text_style = TextStyle(
    //       fontSize: 15,
    //       fontWeight: FontWeight.w400,
    //       color: HexColor.text_color,
    //       fontFamily: 'poppins');

    //   icon_color = HexColor.icon_color;

    //   TextStyle(
    //       color: HexColor.text_color,
    //       fontSize: 19,
    //       fontWeight: FontWeight.w600);
    // } else {
    //   // theme = WhiteTheme();
    //   desc_text_style = TextStyle(
    //       fontSize: 15,
    //       fontWeight: FontWeight.w400,
    //       color: HexColor.WblackText,
    //       fontFamily: 'poppins');

    //   icon_color = HexColor.WiconColor;

    //   page_title_style = TextStyle(
    //     fontSize: 30,
    //     fontWeight: FontWeight.w400,
    //     color: HexColor.WblackText,
    //   );
    //   print("title");
    //   title_style = TextStyle(
    //       fontSize: 20,
    //       fontWeight: FontWeight.w700,
    //       color: HexColor.WblackText,
    //       fontFamily: 'poppins');

    //   btn_text = TextStyle(
    //       color: HexColor.WblueText, fontSize: 19, fontWeight: FontWeight.w600);
    // }
  }

  String refferalcode = "";
  Future<String> getCurrentUserRefferalCode() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection("user")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    return snapshot.get("refferalcode");
  }

  getPreference() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.containsKey("Theme")) {
      isDark = pref.getBool("Theme")!;
    }
    refferalcode = await getCurrentUserRefferalCode();
    themeF(isDark);
  }

  @override
  initState() {
    // TODO: implement initState
    super.initState();
    getPreference();
    getRole();
    deleteExpiredDocuments();
    // getTheme();
  }

  TextEditingController noticeTitle = TextEditingController();
  TextEditingController noticeDescription = TextEditingController();
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
                controller: noticeTitle,
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                  labelText: 'Title',
                ),
              ),
              TextField(
                controller: noticeDescription,
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
                noticeTitle.clear();
                noticeDescription.clear();
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

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  void add() async {
    String title = noticeTitle.text.trim();
    String discription = noticeDescription.text.trim();
    print(title);
    if (title != "" || discription != "") {
      firestore.collection("noticeboard").doc().set({
        "title": title,
        "discription": discription,
        "date": day,
        "refferalcode": refferalcode
      }).then(
        (value) => {
          noticeTitle.clear(),
          noticeDescription.clear(),
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Notice added"),
              backgroundColor: Colors.blue,
            ),
          ),
        },
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("please enter all detail"),
        backgroundColor: Colors.blue,
      ));
    }
  }

  Widget build(BuildContext context) {
    if (isDark) {
      // theme = DarkTheme();
      title_style = TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: HexColor.text_color,
          fontFamily: 'poppins');

      page_title_style = TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w400,
        color: HexColor.text_color,
      );

      desc_text_style = TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: HexColor.text_color,
          fontFamily: 'poppins');

      icon_color = HexColor.icon_color;

      TextStyle(
          color: HexColor.text_color,
          fontSize: 19,
          fontWeight: FontWeight.w600);
    } else {
      theme = WhiteTheme();
      desc_text_style = TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: HexColor.WblackText,
          fontFamily: 'poppins');

      icon_color = HexColor.WiconColor;

      page_title_style = TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w400,
        color: HexColor.WblackText,
      );
      print("title");
      title_style = TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: HexColor.WblackText,
          fontFamily: 'poppins');

      btn_text = TextStyle(
          color: HexColor.WblueText, fontSize: 19, fontWeight: FontWeight.w600);
    }
    return Scaffold(
      floatingActionButton: role != "admin"
          ? FloatingActionButton(
              onPressed: () => _showAddEventDialog(),
              child: Icon(Icons.add),
            )
          : null,
      body: Container(
        decoration: theme.background_color,
        child: Column(
          children: [
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
                        "Noticeboard",
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
            TableCalendar(
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
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('noticeboard')
                    .where('date', isEqualTo: day)
                    .where("refferalcode", isEqualTo: refferalcode)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData &&
                      snapshot.data != null &&
                      snapshot.data!.docs.length != 0) {
                    documents = snapshot.data!.docs;
                    return ListView.builder(
                      itemCount: documents.length,
                      itemBuilder: (context, index) {
                        final data =
                            documents[index].data() as Map<String, dynamic>;
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 16),
                          child: Neumorphic(
                            style: theme.com_sugge_container,
                            child: ListTile(
                              title: Text(
                                '${data['title']}',
                                style: title_style,
                              ),
                              subtitle: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        '${data['discription']}',
                                        style: desc_text_style,
                                      ),
                                    ],
                                  ),
                                  isUser
                                      ? Row()
                                      : Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 7.0),
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 0, 10, 0),
                                                child: NeumorphicButton(
                                                  onPressed: () {
                                                    firestore
                                                        .collection(
                                                            "noticeboard")
                                                        .doc(snapshot
                                                            .data!
                                                            .docs[index]
                                                            .reference
                                                            .id
                                                            .toString())
                                                        .delete();
                                                  },
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 4,
                                                        horizontal: 20),
                                                    child: Text(
                                                      "Remove",
                                                      style: btn_text,
                                                    ),
                                                  ),
                                                  style: theme.button,
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                ],
                              ),
                              // trailing: Text(lecturePresent ? 'Present' : 'Absent'),
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    if (snapshot.data != null &&
                        snapshot.data!.docs.length == 0) {
                      return Center(child: Text("There is no any notice"));
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }
                },
              ),
              //     StreamBuilder<QuerySnapshot>(
              //   stream: FirebaseFirestore.instance
              //       .collection('attendance')
              //       .doc(widget.sub)
              //       .collection('lectures')
              //       .where('date', isEqualTo: day)
              //       .snapshots(),
              //   builder: (context, snapshot) {
              //     if (snapshot.hasData) {
              //       final documents = snapshot.data!.docs;
              //       return ListView.builder(
              //         itemCount: documents.length,
              //         itemBuilder: (context, index) {
              //           final data =
              //               documents[index].data() as Map<String, dynamic>;
              //           final attendanceData =
              //               data['attendance'] as Map<String, dynamic>?;
              //           final lecturePresent =
              //               attendanceData?[widget.studentId] ?? false;
              //           final attendanceStatus =
              //               lecturePresent ? 'Present' : 'Absent';
              //           return ListTile(
              //             title: Text('Lecture ${index + 1}'),
              //             subtitle: Text('${data['start']} - ${data['end']}'),
              //             trailing: Text(attendanceStatus),
              //           );
              //         },
              //       );
              //     } else {
              //       return const Center(
              //         child: CircularProgressIndicator(),
              //       );
              //     }
              //   },
              // ),
            ),
          ],
        ),
      ),
    );
  }

  // List<Event> _getEventsForDay(DateTime day) {
  //   return events[day] ?? [];
  // }}
}
