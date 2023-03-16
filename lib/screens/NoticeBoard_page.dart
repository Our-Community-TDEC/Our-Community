// ignore_for_file: depend_on_referenced_packages

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

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
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  var day;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Attendance Calendar'),
      ),
      body: Column(
        children: [
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
            calendarFormat: _calendarFormat,
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('noticeboard')
                  .doc(widget.sub)
                  .collection('lectures')
                  .where('date', isEqualTo: day)
                  .where('attendance.206470316050', arrayContains: true)
                  // .where('mapField.attendance', isEqualTo: '206470316050')
                  // .where('attendance', arrayContains: FieldOverrideIndex(queryScope: '206470316050'))
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final documents = snapshot.data!.docs;
                  return ListView.builder(
                    itemCount: documents.length,
                    itemBuilder: (context, index) {
                      final data =
                          documents[index].data() as Map<String, dynamic>;
                      // final attendance =
                      //     data['attendance'] as Map<String, dynamic>?;
                      // final lecturePresent = attendance != null &&
                      //     attendance.containsKey(widget.studentId);
                      //  &&attendance[widget.studentId] is bool &&
                      // attendance[widget.studentId] == true;
                      //  &&attendance[widget.studentId] == false;
                      // final lecturePresent =
                      //     data['attendance'][widget.studentId];
                      // print(lecturePresent);
                      return ListTile(
                        title: Text('Lecture ${index + 1}'),
                        subtitle: Text('${data['start']} - ${data['end']}'),
                        // trailing: Text(lecturePresent ? 'Present' : 'Absent'),
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
    );
  }
}