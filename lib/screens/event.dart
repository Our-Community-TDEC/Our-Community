import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';
import 'package:intl/intl.dart';
import 'package:our_community/logic/notification.dart';
import 'package:our_community/nuemorphism/border_effect.dart';
import 'package:our_community/nuemorphism/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';

class Event extends StatefulWidget {
  const Event({super.key});

  @override
  State<Event> createState() => _EventState();
}

class _EventState extends State<Event> with sendnotification {
  var title_style;
  var desc_text_style;
  var page_title_style;
  var icon_color = HexColor.WBlackButton;
  var btn_text;
  var text_color;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay = DateTime.now();
  var documents;
  var listEventSize;
  var day = DateFormat('dd-MM-yyyy').format(DateTime.now());
  bool isUser = true;
  static String role = "";
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

  setrole() {
    if (role == "user") {
      isUser = true;
    } else if (role == "admin") {
      isUser = false;
    }
  }

  themeF(isDark) {
    print("Theme" + isDark.toString());
    if (isDark) {
      text_color = HexColor.text_color;
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
      text_color = HexColor.WblueText;
      desc_text_style = TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: HexColor.WblackText,
          fontFamily: 'poppins');

      icon_color = HexColor.WiconColor;

      page_title_style = TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w400,
        color: HexColor.WblueText,
      );

      title_style = TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: HexColor.WblackText,
          fontFamily: 'poppins');

      btn_text = TextStyle(
          color: HexColor.WblueText, fontSize: 19, fontWeight: FontWeight.w600);
    }
    setState(() {});
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
    // getTheme();
  }

  TextEditingController eventTitle = TextEditingController();
  TextEditingController eventDescription = TextEditingController();
  @override
  _showAddEventDialog() async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Add new Event',
          textAlign: TextAlign.center,
        ),
        content: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: eventTitle,
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                  labelText: 'Title',
                ),
              ),
              TextField(
                controller: eventDescription,
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
                eventTitle.clear();
                eventDescription.clear();
                Navigator.pop(context);
              }),
          TextButton(
              child: Text('Add Event'),
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
    String title = eventTitle.text.trim();
    String discription = eventDescription.text.trim();
    print(title);
    if (title != "" || discription != "") {
      firestore.collection("event").doc().set({
        "title": title,
        "discription": discription,
        "date": day,
        "refferalcode": refferalcode
      }).then(
        (value) => {
          sendNotificationToAllUsers("New event Arived"),
          eventTitle.clear(),
          eventDescription.clear(),
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
    final theme = isDark ? DarkTheme() : WhiteTheme();
    return Theme(
      data: ThemeData(
        fontFamily: 'poppins',
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.android: FadeInPageTransitionsBuilder(),
            TargetPlatform.iOS: FadeInPageTransitionsBuilder(),
          },
        ),
      ),
      child: Scaffold(
        floatingActionButton: role == "admin"
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
                    padding: const EdgeInsets.fromLTRB(0, 20, 110, 0),
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
                          "Events",
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
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('event')
                      .where('date', isEqualTo: day)
                      .where("refferalcode", isEqualTo: refferalcode)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData &&
                        snapshot.data != null &&
                        snapshot.data!.docs.isNotEmpty) {
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
                                                          .collection("event")
                                                          .doc(snapshot
                                                              .data!
                                                              .docs[index]
                                                              .reference
                                                              .id
                                                              .toString())
                                                          .delete();
                                                    },
                                                    style: theme.button,
                                                    padding:
                                                        const EdgeInsets.all(5),
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
                          snapshot.data!.docs.isEmpty) {
                        return Center(
                            child: Text(
                          "There are no events! 😟",
                          style: title_style,
                        ));
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FadeInPageTransitionsBuilder extends PageTransitionsBuilder {
  @override
  Widget buildTransitions<T>(
    Route<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}
