import 'package:flutter/material.dart';
import 'package:iteso_library_project/providers/record_provider.dart';
import 'package:provider/provider.dart';

class Historial extends StatefulWidget {
  const Historial({super.key});

  @override
  State<Historial> createState() => _HistorialState();
}

class _HistorialState extends State<Historial> {
  @override
  Widget build(BuildContext context) {
    context.read<RecordProvider>().loadRecord();
    List<dynamic> mes = context.read<RecordProvider>().getThisMonthList;
    List<dynamic> mesPasado = context.read<RecordProvider>().getLastMonthList;
    List<dynamic> year = context.read<RecordProvider>().getThisYearList;
    List<dynamic> otros = context.read<RecordProvider>().getOthers;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Historial"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Este mes",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 230,
                  child: ListView.builder(
                      itemCount: mes.length,
                      itemBuilder: (BuildContext context, int index) {
                        var _item = mes[index];
                        return Card(
                          color: index % 2 == 0 ? Colors.blue : Colors.blueAccent,
                          child: ListTile(
                            title: Text(_item["title"], style: TextStyle(color: Colors.white),),
                            trailing: Icon(_item.containsKey("pages") ? Icons.book : Icons.movie, color: Colors.yellowAccent,),
                          ),
                        );
                      })
              ),
              SizedBox(
                height: 50,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Mes pasado",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 200,
                  child: ListView.builder(
                      itemCount: mesPasado.length,
                      itemBuilder: (BuildContext context, int index) {
                        var _item = mesPasado[index];
                        return Card(
                          color: index % 2 == 0 ? Colors.blue : Colors.blueAccent,
                          child: ListTile(
                            title: Text(_item["title"], style: TextStyle(color: Colors.white),),
                            trailing: Icon(_item.containsKey("pages") ? Icons.book : Icons.movie,  color: Colors.yellowAccent,),
                          ),
                        );
                      })
              ),
              SizedBox(
                height: 50,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Este año",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 230,
                  child: ListView.builder(
                      itemCount: year.length,
                      itemBuilder: (BuildContext context, int index) {
                        var _item = year[index];
                        return Card(
                          color: index % 2 == 0 ? Colors.blue : Colors.blueAccent,
                          child: ListTile(
                            title: Text(_item["title"], style: TextStyle(color: Colors.white),),
                            trailing: Icon(_item.containsKey("pages") ? Icons.book : Icons.movie,  color: Colors.yellowAccent,),
                          ),
                        );
                      })
              ),
              SizedBox(
                height: 50,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "En el pasado",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 230,
                  child: ListView.builder(
                      itemCount: otros.length,
                      itemBuilder: (BuildContext context, int index) {
                        var _item = otros[index];
                        return Card(
                          color: index % 2 == 0 ? Colors.blue : Colors.blueAccent,
                          child: ListTile(
                            title: Text(_item["title"], style: TextStyle(color: Colors.white),),
                            trailing: Icon(_item.containsKey("pages") ? Icons.book : Icons.movie,  color: Colors.yellowAccent,),
                          ),
                        );
                      })
              ),
            ],
          ),
        ),
      ),
    );
  }
}
