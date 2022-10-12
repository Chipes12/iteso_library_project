import 'package:flutter/material.dart';
import 'package:iteso_library_project/Pantallas/calendario.dart';
import 'package:iteso_library_project/Pantallas/favoritos.dart';
import 'package:iteso_library_project/Pantallas/historial.dart';
import 'package:iteso_library_project/Pantallas/home_page.dart';

class DrawerNav extends StatelessWidget {
  const DrawerNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Text("Something"),
            decoration: BoxDecoration(color: Colors.indigo),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: ((context) => HomePage())));
            },
            child: ListTile(
              leading: Icon(Icons.home),
              title: Text("Inicio"),
              trailing: Icon(Icons.arrow_forward),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: ((context) => Calendario())));
            },
            child: ListTile(
              leading: Icon(Icons.home),
              title: Text("Calendario"),
              trailing: Icon(Icons.arrow_forward),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: ((context) => Historial())));
            },
            child: ListTile(
              leading: Icon(Icons.home),
              title: Text("Historial"),
              trailing: Icon(Icons.arrow_forward),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: ((context) => Favoritos())));
            },
            child: ListTile(
              leading: Icon(Icons.home),
              title: Text("Favoritos"),
              trailing: Icon(Icons.arrow_forward),
            ),
          ),
        ],
      ),
    );
  }
}
