import 'package:flutter/material.dart';

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

class MaterialDetail extends StatefulWidget {
  final dynamic material;
  const MaterialDetail({Key? key, required this.material}) : super(key: key);

  @override
  State<MaterialDetail> createState() => _MaterialDetailState(material);
}

class _MaterialDetailState extends State<MaterialDetail> {
  final dynamic material;

  _MaterialDetailState(this.material);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('${material["title"]}'), actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {},
          ),
        ]),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Image.network(
                    material["imageLink"],
                    fit: BoxFit.fill,
                    height: 250,
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            "Disponibles: ${material["available"]}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            "Nombre: ${material["title"]}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            "Escrito por: ${material["author"]}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            "Año: ${material["year"]}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            "Total de paginas: ${material["pages"]}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: GestureDetector(
                            onTap: () {},
                            child: Text(
                              "${material["description"]}",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic, fontSize: 16),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                  Center(
                    child: MaterialButton(
                      hoverColor: Colors.blueAccent,
                      disabledColor: Colors.grey,
                      height: 40,
                      minWidth: 300,
                      color: Colors.blue,
                      onPressed: material["disponibles"] == 0
                          ? null
                          : () {
                              _pickUpMaterial();
                            },
                      child: Text(
                        "Rentar",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }

  bool _isTodayLabourDay(int day) {
    return (day >= 1 && day <= 5);
  }

  bool _isTomorrowLabourDay(int day) {
    day++;
    return (day >= 1 && day <= 5);
  }

  String _whenToPick() {
    var when;
    var dt = DateTime.now();
    if (dt.hour < 19 && _isTodayLabourDay(dt.weekday)) {
      when = "hoy mismo ";
    } else if (dt.hour > 19 && _isTomorrowLabourDay(dt.weekday)) {
      dt = dt.add(Duration(days: 1));
      when = "mañana ";
    } else {
      dt = dt.add(Duration(
          days: (DateTime.monday - dt.weekday) % DateTime.daysPerWeek));
      when = "el proximo ";
    }
    when +=
        "${WeekDay.values[dt.weekday - 1].toString().split('.').last} ${dt.day} de ${Month.values[dt.month - 1].toString().split('.').last} de ${dt.year}";
    return when;
  }

  void _pickUpMaterial() {
    showDialog(
      context: context,
      builder: ((context) {
        return AlertDialog(
          title: Text("Rentado exitosamente por 7 días"),
          content: Text(
              "Pasa a biblioteca a recoger tu material a partir de ${_whenToPick()}\nTienes todo tu periodo para recogerlo\nDisponible de 8am a 7pm"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Entendido"),
            )
          ],
        );
      }),
    );
  }
}
