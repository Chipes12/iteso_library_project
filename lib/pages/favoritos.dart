import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iteso_library_project/providers/favorites_provider.dart';
import 'package:provider/provider.dart';

class Favoritos extends StatefulWidget {
  const Favoritos({super.key});

  @override
  State<Favoritos> createState() => _FavoritosState();
}

class _FavoritosState extends State<Favoritos> {
  @override
  Widget build(BuildContext context) {
    context.read<FavProvider>().myFavs();
    List<dynamic> libros = context.read<FavProvider>().getBooksList;
    List<dynamic> peliculas = context.read<FavProvider>().getMoviesList;
    return Scaffold(
      backgroundColor: Colors.grey[200],
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
                  child: ListView.builder(
                      itemCount: libros.length,
                      itemBuilder: (BuildContext context, int index) {
                        var _favoriteItem = libros[index];
                        return Card(
                          color: index % 2 == 0 ? Colors.blue : Colors.blueAccent,
                          child: ListTile(
                            title: Text(_favoriteItem["title"], style: TextStyle(color: Colors.white),),
                            trailing: Icon(Icons.movie, color: Colors.yellowAccent,),
                          ),
                        );
                      })),
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
                  child: ListView.builder(
                      itemCount: peliculas.length,
                      itemBuilder: (BuildContext context, int index) {
                        var _favoriteItem = peliculas[index];
                        return Card(
                          color: index % 2 == 0 ? Colors.blue : Colors.blueAccent,
                          child: ListTile(
                            title: Text(_favoriteItem["title"], style: TextStyle(color: Colors.white),),
                            trailing: Icon(Icons.movie, color: Colors.yellowAccent,),
                          ),
                        );
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
