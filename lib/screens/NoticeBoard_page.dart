import 'package:our_community/logic/noticeboard_logic.dart';
import 'package:our_community/screens/CreateNoticePage.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'CreateNoticePage.dart';

void main() {
  runApp(Notice_Board_Page());
}

List<Meeting> _getDataSource() {
  final List<Meeting> meetings = <Meeting>[];
  final DateTime today = DateTime.now();
  final DateTime startTime =
      DateTime(today.year, today.month, today.day, 9, 0, 0);
  final DateTime endTime = startTime.add(const Duration(hours: 2));
  meetings.add(Meeting(
      'Conference', startTime, endTime, const Color(0xFF0F8644), false));
  meetings.add(
      Meeting('Meeting', startTime, endTime, const Color(0xffe580ff), false));
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

class Notice_Board_Page extends StatelessWidget with noticeboaard_logic {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Clicked here');
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CreateNoticePage()));
        },
        backgroundColor: Colors.black38,
        child: const Icon(
          Icons.add,
          color: Colors.blue,
        ),
      ),
      backgroundColor: Colors.grey[800],
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
                      CircleAvatar(
                        backgroundColor: Colors.black38,
                        child: IconButton(
                          onPressed: () => print('Clicked on list'),
                          icon: Icon(Icons.list),
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(
                          width: MediaQuery. of(context). size. width*0.7,
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              "Notice",
                              // textAlign:TextAlign.center,
                              // textDirection: TextDirection.ltr,
                              style: TextStyle(
                                fontFamily: 'Poppins-SemiBold',
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 35,
                              ),
                            ),
                          ))
                    ],
                  ),
                  Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 1),
                  child: Divider(
                    thickness: 5,
                    indent: 12,
                    endIndent: 12,
                    color: Colors.black,
                  ),
                ),
                  // CircleAvatar(
                  //   backgroundColor: Colors.black38,
                  //   child: IconButton(
                  //     onPressed:() => print('Clicked on list'),
                  //     icon: Icon(Icons.chevron_left),
                  //     color: Colors.blue,
                  //   ),
                  // ),
                  // CircleAvatar(
                  //   backgroundColor: Colors.black38,
                  //   child: IconButton(
                  //     onPressed:() => print('Clicked on list'),
                  //     icon: Icon(Icons.chevron_right),
                  //     color: Colors.blue,
                  //   ),
                  // ),

                  SizedBox(
                    width: MediaQuery. of(context). size. width,
                    child: SfCalendar(
                      //TODO: increase height
                      // viewHeaderHeight: 10,
                      view: CalendarView.month,
                      // headerHeight: 10,
                      // viewHeaderStyle: ViewHeaderStyle(
                      //     backgroundColor: Colors.grey,
                      //     dayTextStyle: TextStyle(
                      //         fontSize: 18,
                      //         color: Color(0xFFff5eaea),
                      //         fontWeight: FontWeight.w500),
                      //     dateTextStyle: TextStyle(
                      //         fontSize: 22,
                      //         color: Color(0xFFff5eaea),
                      //         letterSpacing: 2,
                      //         fontWeight: FontWeight.w500)),
                      dataSource: MeetingDataSource(_getDataSource()),
                      // dataSource: getCalendarDataSource(),
                      monthViewSettings: MonthViewSettings(
                        showAgenda: true,
                        agendaViewHeight: 50,
                        // appointmentDisplayCount: 3,
                        // agendaItemHeight: 10,
                      ),
                      scheduleViewSettings: ScheduleViewSettings(
                        appointmentItemHeight: 70,
                      ),
                      // initialSelectedDate: DateTime(2019, 12, 20, 12),
                      // dataSource: MeetingDataSource(_getDataSource()),
                      backgroundColor: Colors.white70,
                      // textStyle: TextStyle(color: Colors.white, fontSize: 15),
                      // todayHighlightColor: Colors.blue,
                      // cellBorderColor: Colors.blue,
                      showNavigationArrow: true,
                      selectionDecoration: BoxDecoration(
                        // color: Colors.transparent,
                        border: Border.all(color: Colors.blue, width: 2),
                        borderRadius: const BorderRadius.all(Radius.circular(5)),
                        shape: BoxShape.rectangle,
                      ),
                    ),
                  ),

                  // children: [
                  //   CircleAvatar(
                  //     backgroundColor: Colors.black38,
                  //     child: IconButton(
                  //       onPressed:() => print('Clicked on list'),
                  //       icon: Icon(Icons.home),
                  //       color: Colors.blue,
                  //     ),
                  //   ),
                  // ],

                  // ElevatedButton(
                  //     onPressed: () {
                  //       Button_Clicked_Function();
                  //     },
                  //     child: Text("Event")
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
