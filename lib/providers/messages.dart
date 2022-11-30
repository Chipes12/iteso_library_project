import 'package:flutter/material.dart';

import '../pages/Search/search_page.dart';

enum WeekDay { Lunes, Martes, Miercoles, Jueves, Viernes, Sabado, Domingo }

enum Month {
  Enero,
  Febrero,
  Marzo,
  Abril,
  Mayo,
  Junio,
  Julio,
  Agosto,
  Septiembre,
  Octubre,
  Noviembre,
  Diciembre
}

bool isTodayLabourDay(int day) {
  return (day >= 1 && day <= 5);
}

bool isTomorrowLabourDay(int day) {
  day++;
  return (day >= 1 && day <= 5);
}

String _whenToPick() {
  var when;
  var dt = DateTime.now();
  if (dt.hour < 19 && isTodayLabourDay(dt.weekday)) {
    when = "hoy mismo ";
  } else if (dt.hour > 19 && isTomorrowLabourDay(dt.weekday)) {
    dt = dt.add(Duration(days: 1));
    when = "mañana ";
  } else {
    dt = dt.add(
        Duration(days: (DateTime.monday - dt.weekday) % DateTime.daysPerWeek));
    when = "el proximo ";
  }
  when +=
      "${WeekDay.values[dt.weekday - 1].toString().split('.').last} ${dt.day} de ${Month.values[dt.month - 1].toString().split('.').last} de ${dt.year}";
  return when;
}

void pickUpMaterial(context) {
  showDialog(
    context: context,
    builder: ((context) {
      return AlertDialog(
        title: Text("Rentado exitosamente por 14 días"),
        content: Text(
            "Pasa a biblioteca a recoger tu material a partir de ${_whenToPick()}\nTienes todo tu periodo para recogerlo\nDisponible de 8am a 7pm"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchPage()),
              );
            },
            child: Text("Entendido"),
          )
        ],
      );
    }),
  );
}
