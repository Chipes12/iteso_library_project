import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:iteso_library_project/pages/Calendar/calendario.dart';
import 'package:iteso_library_project/pages/favoritos.dart';
import 'package:iteso_library_project/pages/historial.dart';
import 'package:iteso_library_project/pages/Search/search_page.dart';

class DrawerNav extends StatelessWidget {
  const DrawerNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: Center(
              child: Text(
                "Biblioteca ITESO",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.indigo,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/Library.jpg"))),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: ((context) => SearchPage())));
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
              leading: Icon(Icons.calendar_month),
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
              leading: Icon(Icons.history),
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
              leading: Icon(Icons.favorite),
              title: Text("Favoritos"),
              trailing: Icon(Icons.arrow_forward),
            ),
          ),
          Expanded(child: Text("")),
          GestureDetector(
            onTap: () async {
              await FirebaseAuth.instance.signOut();
            },
            child: ListTile(
              leading: Icon(Icons.exit_to_app, color: Colors.indigoAccent),
              title: Text("Cerrar sesi??n"),
              trailing: Icon(Icons.arrow_back),
            ),
          ),
        ],
        
      ),
    );
  }
}
