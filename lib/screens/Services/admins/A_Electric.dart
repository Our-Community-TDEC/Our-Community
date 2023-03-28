import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:intl/intl.dart';
import 'package:our_community/nuemorphism/border_effect.dart';
import 'package:our_community/nuemorphism/colors.dart';
import 'package:table_calendar/table_calendar.dart';

class A_Electric extends StatefulWidget {
  const A_Electric({super.key});

  @override
  State<A_Electric> createState() => _A_ElectricState();
}

class _A_ElectricState extends State<A_Electric> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController mobileController = new TextEditingController();
  TextEditingController sloteController = new TextEditingController();
  TextEditingController timeHourController = new TextEditingController();
  TextEditingController timeMinuteController = new TextEditingController();
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  var day = DateFormat('dd-MM-yyyy').format(DateTime.now());
  DateTime? _selectedDay = DateTime.now();
  var icon_color = HexColor.WBlackButton;
  WhiteTheme theme = new WhiteTheme();
  var page_title_style = TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w400,
        color: HexColor.WblueText,
      );

  @override
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
                // add();
                Navigator.pop(context);
              })
        ],
      ),
    );
  }

  

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddEventDialog(),
        child: Icon(Icons.add),
      ),
      body: Column(
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
                      "Electritian",
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
          ),
        ],
      ),
    );
    ;
  }
}
