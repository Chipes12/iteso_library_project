import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Favoritos extends StatelessWidget {
  final dynamic favorites = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .snapshots();

  Favoritos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favoritos"),
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
                  "Libros",
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
                        title: Text("El señor de los anillos"),
                        trailing: Icon(Icons.book),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text("Microcontrolador 8051"),
                        trailing: Icon(Icons.book),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text("El Alquimistta"),
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
                  "Audiovisuales",
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
                        trailing: Icon(Icons.movie),
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
                        title: Text("El gran hotel budapest"),
                        trailing: Icon(Icons.movie),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text("Prisioneros"),
                        trailing: Icon(Icons.movie),
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
