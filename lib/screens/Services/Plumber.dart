import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../logic/services/plumber/Plumber_logic.dart';
import '../../nuemorphism/colors.dart';

class Plumber extends StatefulWidget with Plumber_logic {
  const Plumber({super.key});

  @override
  State<StatefulWidget> createState() => _Plumber();
}

class _Plumber extends State<Plumber> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back),
      ),
      backgroundColor: HexColor.Wbackground_color,
      body: Container(
        child: Column(children: [
          Row(children: [
            Image.asset(
              'assets/Images/Services/Plumber/background.png',
              width: 410,
            ),
          ]),
          Row(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(27, 5, 0, 5),
                  child: Text(
                    "Select Services",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  width: 411,
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
                Row(
                  children: [
                    SfCalendar(
                      view: CalendarView.month,
                      dataSource: MeetingDataSource(_getDataSource()),
                      monthViewSettings: MonthViewSettings(
                          appointmentDisplayMode:
                              MonthAppointmentDisplayMode.appointment),
                    ),
                  ],
                )
              ],
            ),
            // Next part
          ]),
        ]),
      ),
    );
  }
}

List<Meeting> _getDataSource() {
  final List<Meeting> meetings = <Meeting>[];
  final DateTime today = DateTime.now();
  final DateTime startTime =
      DateTime(today.year, today.month, today.day, 9, 0, 0);
  final DateTime endTime = startTime.add(const Duration(hours: 2));
  meetings.add(Meeting(
      'Conference', startTime, endTime, const Color(0xFF0F8644), false));
  return meetings;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}
