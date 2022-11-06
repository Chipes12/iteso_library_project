import 'package:flutter/material.dart';
import 'package:iteso_library_project/Widgets/drawer.dart';
import 'package:iteso_library_project/pages/Calendar/material_return.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class Calendario extends StatefulWidget {
  const Calendario({super.key});

  @override
  State<Calendario> createState() => _CalendarioState();
}

class _CalendarioState extends State<Calendario> {
  Map<dynamic, List<MaterialReturn>> selectedMaterial = {
    DateFormat('yyyy-MM-dd').format(DateTime.now()): [
      MaterialReturn(
        title: "El libro de la selva",
        isABook: true,
      )
    ]
  };
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  CalendarFormat _format = CalendarFormat.month;

  List<MaterialReturn> _getMaterialsfromDay(DateTime date) {
    return selectedMaterial[DateFormat('yyyy-MM-dd').format(date)] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Calendario",
        style: TextStyle(fontSize: 20),
      )),
      drawer: DrawerNav(),
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 15),
            Column(
              children: [
                TableCalendar(
                  firstDay: DateTime(1990),
                  lastDay: DateTime(2030),
                  focusedDay: DateTime.now(),
                  currentDay: DateTime.now(),
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  daysOfWeekVisible: true,
                  eventLoader: _getMaterialsfromDay,
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDay, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                      print(_getMaterialsfromDay(_selectedDay));
                    });
                  },
                  calendarFormat: _format,
                  onFormatChanged: (format) {
                    setState(() {
                      _format = format;
                    });
                  },
                  onPageChanged: (focusedDay) {
                    _focusedDay = focusedDay;
                  },
                  calendarStyle: CalendarStyle(
                    isTodayHighlighted: true,
                    selectedDecoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    selectedTextStyle: TextStyle(color: Colors.white),
                    todayDecoration: BoxDecoration(
                      color: Colors.indigoAccent,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    defaultDecoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    weekendDecoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  headerStyle: HeaderStyle(
                    formatButtonVisible: true,
                    titleCentered: true,
                    formatButtonShowsNext: false,
                    formatButtonDecoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    formatButtonTextStyle: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Expanded(child: SizedBox(width: 4)),
                    Text(
                      "Material Prestado",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                    SizedBox(
                      width: 10,
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    height: 200,
                    child: ListView(
                      children: [
                        ..._getMaterialsfromDay(_selectedDay).map(
                          (MaterialReturn mr) => Card(
                            child: ListTile(
                              leading:
                                  Icon(mr.isABook ? Icons.book : Icons.movie),
                              title: Text(mr.title),
                            ),
                          ),
                        )
                      ],
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
