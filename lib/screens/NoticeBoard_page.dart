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
      body: Container(
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
                        width: 400,
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            "Notice",
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
                SfCalendar(
                  //TODO: increase height
                  view: CalendarView.month,
                  dataSource: MeetingDataSource(_getDataSource()),
                  monthViewSettings: MonthViewSettings(
                    showAgenda: true,
                    agendaViewHeight: 50,
                  ),
                  scheduleViewSettings: ScheduleViewSettings(
                    appointmentItemHeight: 70,
                  ),
                  backgroundColor: Colors.white70,
                  showNavigationArrow: true,
                  selectionDecoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 2),
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    shape: BoxShape.rectangle,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
