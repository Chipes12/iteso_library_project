import 'package:flutter/material.dart';
import 'package:iteso_library_project/Widgets/drawer.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendario extends StatefulWidget {
  const Calendario({super.key});

  @override
  State<Calendario> createState() => _CalendarioState();
}

class _CalendarioState extends State<Calendario> {
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
            TableCalendar(
              firstDay: DateTime(1990),
              lastDay: DateTime(2030),
              focusedDay: DateTime.now(),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(child: SizedBox(width: 4)),
                Text(
                  "Material Prestado",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                SizedBox(
                  width: 10,
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 200,
              child: ListView(
                children: [
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.book),
                      title: Text("Introducción a bases de datos"),
                      trailing: Text("19 de Noviembre"),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.book),
                      title: Text("Programación orientada a objetos"),
                      trailing: Text("19 de Noviembre"),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


/*
class Calendario extends StatelessWidget {
  const Calendario({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Calendario",
        style: TextStyle(fontSize: 20),
      )),
      drawer: DrawerNav(),
      body: TableCalendar(
        firstDay: DateTime(1990),
        lastDay: DateTime(2030),
        focusedDay: DateTime.now(),
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day);
        },
      ),
    );
  }
}
*/