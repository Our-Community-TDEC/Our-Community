import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../nuemorphism/border_effect.dart';
import '../nuemorphism/colors.dart';

class Notice_Board_Page extends StatefulWidget {
  const Notice_Board_Page({super.key});

  @override
  State<StatefulWidget> createState() => _NoticeBoard_Page();
}

final titleController = TextEditingController();
final descriptionController = TextEditingController();
FirebaseFirestore firestore = FirebaseFirestore.instance;

class _NoticeBoard_Page extends State<Notice_Board_Page> {
  WhiteTheme theme = WhiteTheme();
  // Future<String> getName(String documentId) async {
  //   DocumentSnapshot snapshot = await FirebaseFirestore.instance
  //       .collection("event")
  //       .doc(documentId)
  //       .get();
  //   return snapshot.get("userName");
  // }

  final title_text_style = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: Colors.white,
      fontFamily: 'poppins');

  final desc_text_style = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      color: Colors.white,
      fontFamily: 'poppins');

  add_data(TextEditingController titleController,
      TextEditingController descriptionController, DateTime focusedDay) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    String title = titleController.text.trim();
    String description = descriptionController.text.trim();

    String updatedDate = DateFormat('dd-MM-yyyy').format(focusedDay);

    print(updatedDate);

    titleController.clear();
    descriptionController.clear();

    if (title != '' && description != '') {
      firestore.collection('noticeboard').doc().set({
        "title": title,
        "description": description,
        "time": updatedDate,
        // "UID": FirebaseAuth.instance.currentUser?.uid,
      }).then((result) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Event posted"),
          backgroundColor: Colors.blue,
          duration: Duration(milliseconds: 500),
        ));
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Event not posted"),
        backgroundColor: Colors.blue,
        duration: Duration(milliseconds: 500),
      ));
    }
  }

  // CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDate;

  Map<String, List> mySelectedEvents = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedDate = _focusedDay;
  }

  List _listOfDayEvents(DateTime dateTime) {
    if (mySelectedEvents[DateFormat('dd-MM-yy').format(dateTime)] != null) {
      print("object");
      return mySelectedEvents[DateFormat('dd-MM-yy').format(dateTime)]!;
    } else {
      print("tttttt");
      return [];
    }
  }

  _showAddEventDialog() async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Add new event',
          textAlign: TextAlign.center,
        ),
        content: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                  labelText: 'Title',
                ),
              ),
              TextField(
                controller: descriptionController,
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                  labelText: 'Description',
                ),
              )
            ]),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context), child: Text('Cancel')),
          TextButton(
            child: Text('Add Event'),
            onPressed: () {
              // mySelectedEvents[_focusedDay]?.add({
              //   "eventTitle": titleController.text,
              //   "eventDescp": descriptionController.text,
              // });
              print(_focusedDay);
              add_data(titleController, descriptionController, _focusedDay);
              // Navigator.pop(context);

              // if (titleController.text.isEmpty &&
              //     descriptionController.text.isEmpty) {
              //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              //     content: Text("Suggstion Posted"),
              //     // duration: Duration(milliseconds: 400),
              //   ));
              //   return;
              // } else {
              //   print(titleController.text);
              //   print(descriptionController.text);

              // if (mySelectedEvents[
              //         DateFormat('dd-MM-yy').format(_selectedDate!)] !=
              //     null) {

              // DateTime dt = DateFormat('dd-MM-yy').parse(_focusedDay);
              // print()

              // } else {
              //   mySelectedEvents[
              //       DateFormat('dd-MM-yy').format(_selectedDate!)] = [
              //     {
              //       "eventTitle": titleController.text,
              //       "eventDescp": descriptionController.text,
              //     }
              //   ];
              print("New event ${json.encode(mySelectedEvents)}");
              //   titleController.clear();
              //   descriptionController.clear();
              //   Navigator.pop(context);
              // return;
              // }
              // }
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final CalendarController _controller = CalendarController();
    String selectedDate(CalendarSelectionDetails details) {
      String _text;
      if (_controller.view == CalendarView.month ||
          _controller.view == CalendarView.timelineMonth) {
        _text = DateFormat('dd, MMMM yyyy').format(details.date!).toString();
      } else {
        _text = DateFormat('dd, MMMM yyyy hh:mm a')
            .format(details.date!)
            .toString();
      }
      return _text;
    }

    return Scaffold(
      floatingActionButton: NeumorphicFloatingActionButton(
        onPressed: () => _showAddEventDialog(),
          // Icons.add,
          // color: Colors.blue,
        child: Icon(
          Icons.add,
          color: Colors.blue,
        ),
        style: NeumorphicStyle(
            boxShape: NeumorphicBoxShape.circle(),
            color: HexColor.Wbackground_color),
      ),
      backgroundColor: HexColor.Wbackground_color,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: NeumorphicButton(
                          onPressed: () => {Navigator.pop(context)},
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.blue,
                          ),
                          style: NeumorphicStyle(
                              color: HexColor.Wbackground_color,
                              boxShape: NeumorphicBoxShape.circle(),
                              shadowLightColor: HexColor.Wlight_vote,
                              shadowDarkColor: HexColor.Wdark_vote,
                              depth: 4),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            "Notice",
                            // textAlign:TextAlign.center,
                            // textDirection: TextDirection.ltr,
                            style: TextStyle(
                              fontFamily: 'Poppins-SemiBold',
                              color: Colors.blue,
                              fontWeight: FontWeight.w600,
                              fontSize: 35,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Text(selectedDate()),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 1),
                    child: Divider(
                      thickness: 5,
                      indent: 12,
                      endIndent: 12,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SfCalendar(
                view: CalendarView.month,
              ),
              ..._listOfDayEvents(_selectedDate!).map(
                ((myEvents) => ListTile(
                      leading: Icon(
                        Icons.done,
                        color: Colors.blue,
                      ),
                      title: Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Text('Event Title: ${myEvents['eventTitle']}'),
                      ),
                      subtitle: Text('Description: ${myEvents['eventDescp']}'),
                    )),
              ),
              StreamBuilder<QuerySnapshot>(
                stream: firestore
                    .collection('noticeboard')
                    .orderBy('time', descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    if (snapshot.hasData && snapshot.data != null) {
                      return Expanded(
                        child: ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            Map<String, dynamic> show_event =
                                snapshot.data!.docs[index].data()
                                    as Map<String, dynamic>;
                            // print(DateFormat('dd-MM-yy')
                            //     .format(d).runtimeType);
                            // print(d);
                            // mySelectedEvents[DateFormat('dd-MM-yy')
                            //         .parse(show_event["time"])]
                            //     ?.add({
                            //   "eventTitle": show_event["title"],
                            //   "eventDescp": show_event["description"],
                            // });
                            // if (mySelectedEvents[DateFormat('dd-MM-yy')
                            //         .format(_selectedDate!)] !=
                            //     null) {
                            //   mySelectedEvents[DateFormat('dd-MM-yy')
                            //           .format(_selectedDate!)]
                            //       ?.add({
                            //     "eventTitle": titleController.text,
                            //     "eventDescp": descriptionController.text,
                            //   });
                            // } else {
                            //   mySelectedEvents[DateFormat('dd-MM-yy')
                            //       .format(_selectedDate!)] = [
                            //     {
                            //       "eventTitle": titleController.text,
                            //       "eventDescp": descriptionController.text,
                            //     }
                            //   ];
                            // }

                            return ListTile(
                              title: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                    child: Image.asset(
                                      'assets/Images/user.png',
                                      width: 40,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // Text(
                                          //   await getName(show_event["UID"]),
                                          //   style: title_text_style,
                                          // ), //Darshan

                                          Text(
                                            show_event["title"],
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.black,
                                                fontFamily: 'poppins'),
                                          ),
                                          // Text(
                                          //   show_event["time"].toString(),
                                          //   style: TextStyle(
                                          //       fontSize: 10,
                                          //       fontWeight: FontWeight.w400,
                                          //       color: Colors.white,
                                          //       fontFamily: 'poppins'),
                                          // ),

                                          // FutureBuilder<String>(
                                          //   future: getName(
                                          //       show_event["UID"]),
                                          //   builder: (BuildContext context,
                                          //       AsyncSnapshot<String>
                                          //           snapshot) {
                                          //     if (snapshot.hasData) {
                                          //       return Text(
                                          //           snapshot.data.toString(),
                                          //           style: TextStyle(
                                          //               fontSize: 15,
                                          //               fontWeight:
                                          //                   FontWeight.w300,
                                          //               color: Colors.white,
                                          //               fontFamily:
                                          //                   'poppins'));
                                          //     } else if (snapshot.hasError) {
                                          //       return Text(
                                          //         "Loading...",
                                          //         style: title_text_style,
                                          //       );
                                          //     } else {
                                          //       return Text("Loading...",
                                          //           style: title_text_style);
                                          //     }
                                          //   },
                                          // ),
                                        ]),
                                  ),
                                ],
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 6),
                                      child: Text(
                                        show_event["description"],
                                        style: desc_text_style,
                                      ),
                                    ),
                                  ),
                                  Divider(
                                    thickness: 2,
                                    indent: 1,
                                    endIndent: 1,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                              // trailing: IconButton(
                              //   onPressed: () {
                              //     firestore
                              //         .collection("suggestion")
                              //         .doc(snapshot
                              //             .data!.docs[index].reference.id
                              //             .toString())
                              //         .delete();
                              //   },
                              //   icon: Icon(Icons.delete),
                              // ),
                            );
                          },
                        ),
                      );
                    } else {
                      return Text("Error");
                    }
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
