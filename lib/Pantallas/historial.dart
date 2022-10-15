import 'package:flutter/material.dart';

class Historial extends StatelessWidget {
  const Historial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Historial"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                onChanged: (value) {},
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: "Buscar",
                    suffixIcon:
                        IconButton(onPressed: () {}, icon: Icon(Icons.search))),
              ),
              SizedBox(
                height: 25,
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
                child: ListView(
                  children: [
                    Card(
                      child: ListTile(
                        title: Text("V for Vendetta"),
                        trailing: Icon(Icons.movie),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text("Erase una vez en Hollywood"),
                        trailing: Icon(Icons.movie),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text("Método TED para hablar en público"),
                        trailing: Icon(Icons.book),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text("1000 leguas de viaje submarino"),
                        trailing: Icon(Icons.book),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
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
                child: ListView(
                  children: [
                    Card(
                      child: ListTile(
                        title: Text("El señor de los anillos"),
                        trailing: Icon(Icons.book),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text("Eyes wide shut"),
                        trailing: Icon(Icons.movie),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text("Cien años de soledad"),
                        trailing: Icon(Icons.book),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text("El Psicoanalista"),
                        trailing: Icon(Icons.book),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
