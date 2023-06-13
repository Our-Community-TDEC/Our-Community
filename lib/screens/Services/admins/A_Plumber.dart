import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';
import 'package:intl/intl.dart';
import 'package:our_community/nuemorphism/border_effect.dart';
import 'package:our_community/nuemorphism/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';

class A_Plumber extends StatefulWidget {
  const A_Plumber({super.key});

  @override
  State<A_Plumber> createState() => _A_PlumberState();
}

class _A_PlumberState extends State<A_Plumber> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController mobileController = new TextEditingController();
  TextEditingController sloteController = new TextEditingController();
  TextEditingController timeHourController = new TextEditingController();
  TextEditingController timeMinuteController = new TextEditingController();
  var title_style;
  var desc_text_style;
  var duration__text_style;
  var btn_text;
  var page_title_style;
  _showAddEventDialog() async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Add Details',
          textAlign: TextAlign.center,
        ),
        content: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
              ),
              TextField(
                controller: mobileController,
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                  labelText: 'Mobile Number',
                ),
                maxLength: 10,
                keyboardType: TextInputType.phone,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onChanged: (value) {
                  if (value.length > 10) {
                    mobileController.text = value.substring(0, 10);
                    mobileController.selection = TextSelection.fromPosition(
                      TextPosition(offset: mobileController.text.length),
                    );
                  }
                },
              ),
              TextField(
                controller: sloteController,
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                  labelText: 'slote for a day',
                ),
              ),
              Text("time for a slot"),
              Row(
                children: [
                  Flexible(
                    child: TextField(
                      controller: timeHourController,
                      textCapitalization: TextCapitalization.words,
                      decoration: const InputDecoration(
                        labelText: 'Hour',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Flexible(
                    child: TextField(
                      controller: timeMinuteController,
                      textCapitalization: TextCapitalization.words,
                      decoration: const InputDecoration(
                        labelText: 'Minute',
                      ),
                    ),
                  ),
                ],
              )
            ]),
        actions: [
          TextButton(
              child: Text('Cancel'),
              onPressed: () {
                nameController.clear();
                mobileController.clear();
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

  bool isDark = false;
  var text_color;
  themeF(isDark) {
    print("Theme" + isDark.toString());
    if (isDark) {
      text_color = HexColor.text_color;
      title_style = TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: HexColor.text_color,
        fontFamily: 'poppins',
      );

      desc_text_style = TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w400,
        color: HexColor.text_color,
        fontFamily: 'poppins',
      );

      duration__text_style = TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        color: HexColor.text_color,
        fontFamily: 'poppins',
      );

      btn_text = TextStyle(
        color: HexColor.WblueText,
        fontSize: 19,
        fontWeight: FontWeight.w600,
      );

      page_title_style = TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w400,
        color: HexColor.text_color,
      );
    } else {
      text_color = HexColor.WblueText;
      title_style = TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: HexColor.WblackText,
        fontFamily: 'poppins',
      );

      desc_text_style = TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w400,
        color: HexColor.WblackText,
        fontFamily: 'poppins',
      );

      duration__text_style = TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        color: HexColor.WblackText,
        fontFamily: 'poppins',
      );

      btn_text = TextStyle(
        color: HexColor.WblueText,
        fontSize: 19,
        fontWeight: FontWeight.w600,
      );

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
    setState(() {
      themeF(isDark);
    });
  }

  @override
  initState() {
    // TODO: implement initState
    super.initState();
    getPreference();
    deleteExpiredDocuments();
    // getTheme();
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

  String refferalcode = "";
  Future<String> getCurrentUserRefferalCode() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection("user")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    return snapshot.get("refferalcode");
  }

  var documents;
  var day = DateFormat('dd-MM-yyyy').format(DateTime.now());
  var listEventSize;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay = DateTime.now();

  var icon_color = HexColor.WiconColor;
  void add() async {
    String name = nameController.text.trim();
    String mobile = mobileController.text.trim();
    String slot = sloteController.text.trim();
    String hour = timeHourController.text.trim();
    String minute = timeMinuteController.text.trim();
    if (name != "" || mobile != "") {
      firestore.collection("plumber").doc("plumberdetail").set({
        "name": name,
        "mobile": mobile,
        "slot": slot,
        "time": "$hour hr $minute min",
        "refferalcode": refferalcode
      }).then(
        (value) => {
          nameController.clear(),
          mobileController.clear(),
          sloteController.clear(),
          timeMinuteController.clear(),
          timeHourController.clear(),
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Data added"),
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
    return Scaffold(
      floatingActionButton: NeumorphicFloatingActionButton(
        onPressed: () => _showAddEventDialog(),
        child: Icon(
          Icons.add,
          color: icon_color,
        ),
        style: theme.back_button,
      ),
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
                        "Plumber",
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
                    .collection('plumber')
                    .where('date', isEqualTo: day)
                    .where("refferalcode", isEqualTo: refferalcode)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
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
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${data['title']}',
                                    style: title_style,
                                  ),
                                  GestureDetector(
                                    child: Icon(
                                      Icons.delete_forever_outlined,
                                      color: icon_color,
                                    ),
                                    onTap: () {
                                      firestore
                                          .collection("plumber")
                                          .doc(
                                            snapshot
                                                .data!.docs[index].reference.id
                                                .toString(),
                                          )
                                          .delete();
                                    },
                                  )
                                ],
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
                                  Row(
                                    children: [
                                      Text(
                                        'Book for ${data['duration']}',
                                        style: duration__text_style,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
