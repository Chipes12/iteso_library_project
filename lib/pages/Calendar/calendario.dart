import 'package:flutter/material.dart';
import 'package:iteso_library_project/Widgets/drawer.dart';
import 'package:iteso_library_project/pages/Calendar/material_return.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:iteso_library_project/providers/rent_provider.dart';
import 'package:provider/provider.dart';

class Calendario extends StatefulWidget {
  const Calendario({super.key});

  @override
  State<Calendario> createState() => _CalendarioState();
}

class _CalendarioState extends State<Calendario> {
  Map<dynamic, List<dynamic>> selectedMaterial = {};
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  
  void _onDaySelected(DateTime day, DateTime focusedDay){
    setState(() {
      _selectedDay = day;
    });
  }
  CalendarFormat _format = CalendarFormat.month;

  List<dynamic> _getMaterialsfromDay(DateTime date) {
    // print(context.read<RentProvider>().getRentsList[DateFsormat('yyyy-MM-dd').format(date)]?.length);
    return context.read<RentProvider>().getRentsList[DateFormat('yyyy-MM-dd').format(date)] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    context.read<RentProvider>().getRents();
    return Scaffold(
      backgroundColor: Colors.grey[200],
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
                  locale: 'es_ES',
                  firstDay: DateTime(1990),
                  lastDay: DateTime(2030),
                  focusedDay: _focusedDay,
                  currentDay: DateTime.now(),
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  daysOfWeekVisible: true,
                  eventLoader: _getMaterialsfromDay,
                  selectedDayPredicate: (day) => isSameDay(day, _selectedDay),
                  onDaySelected: _onDaySelected,
                  calendarFormat: _format,
                  onFormatChanged: (format) {
                    setState(() {
                      _format = format;
                    });
                  },
                  onPageChanged: (day) {
                    _focusedDay = day;
                  },
                  calendarStyle: CalendarStyle(
                    isTodayHighlighted: true,
                    selectedDecoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    selectedTextStyle: TextStyle(color: Colors.white),
                    todayDecoration: BoxDecoration(
                      color: Colors.indigoAccent,
                      shape: BoxShape.circle
                    ),
                    defaultDecoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    weekendDecoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                  ),
                  headerStyle: HeaderStyle(
                    formatButtonVisible: true,
                    titleCentered: true,
                    formatButtonShowsNext: false,
                    formatButtonDecoration: BoxDecoration(
                      color: Colors.indigo,
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
                      "Material por regresar",
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
                          (dynamic m) => Card(
                            child: ListTile(
                              leading:
                                  Icon(m.containsKey("pages") ? Icons.book : Icons.movie),
                              title: Text(m["title"]),
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
