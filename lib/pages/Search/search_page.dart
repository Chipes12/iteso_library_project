import 'package:flutter/material.dart';
import 'package:iteso_library_project/Widgets/drawer.dart';
import 'package:iteso_library_project/items/material_item.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchPage> createState() => _searchPageState();
}

class _searchPageState extends State<SearchPage> {
  var bookController = TextEditingController();
  final List<Map<String, dynamic>> _listElements = [
    {
      "title": "La canción de Aquiles",
      "imageLink": "https://m.media-amazon.com/images/I/51TixRVm3mS.jpg",
      "available": "2",
      "description": "Aquiles cantando sobre su talón",
      "author": "Ernest Hemmingway",
      "pages": 172,
      "year": 1954,
    },
    {
      "title": "La teoría del todo: El origen y el destino del universo",
      "imageLink":
          "https://m.media-amazon.com/images/I/61YFN5RUm3L._SX323_BO1,204,203,200_.jpg",
      "available": "3",
      "description": "Una teoria de como nacio todo todito",
      "author": "Ernest Hemmingway",
      "pages": 172,
      "year": 1954,
    },
    {
      "title": "Bajo la misma estrella",
      "imageLink":
          "https://m.media-amazon.com/images/I/41f2y3meruL._SX316_BO1,204,203,200_.jpg",
      "available": "4",
      "description": "Una muchacha se enamora de un muchacho",
      "author": "Ernest Hemmingway",
      "pages": 172,
      "year": 1954,
    },
    {
      "title": "La ladrona de libros",
      "imageLink":
          "https://m.media-amazon.com/images/I/51w7Dd4gbmL._SX327_BO1,204,203,200_.jpg",
      "available": "5",
      "description": "Una muchacha que roba libros",
      "author": "Ernest Hemmingway",
      "pages": 172,
      "year": 1954,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Libreria ITESO",
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  //TODO: Abrir camara para escanear código QR
                },
                icon: Icon(Icons.camera_alt))
          ],
        ),
        drawer: DrawerNav(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              SizedBox(
                height: 10,
              ),
              Center(
                child: Column(
                  children: [
                    TextField(
                      controller: bookController,
                      decoration: InputDecoration(
                        filled: false,
                        fillColor: Colors.grey[100],
                        border: OutlineInputBorder(),
                        label: Text(
                          "Buscar un material",
                          style: TextStyle(color: Colors.grey),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () {},
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Libros",
                      style: TextStyle(color: Colors.blue),
                    ),
                    Divider(color: Colors.grey[100], thickness: 1),
                    Container(
                      height: 150,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: _listElements.length,
                        itemBuilder: (BuildContext context, int index) {
                          return MaterialItem(material: _listElements[index]);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 150,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: _listElements.length,
                        itemBuilder: (BuildContext context, int index) {
                          return MaterialItem(material: _listElements[index]);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Peliculas",
                      style: TextStyle(color: Colors.blue),
                    ),
                    Divider(color: Colors.grey[100], thickness: 1),
                    Container(
                      height: 150,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: _listElements.length,
                        itemBuilder: (BuildContext context, int index) {
                          return MaterialItem(material: _listElements[index]);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 150,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: _listElements.length,
                        itemBuilder: (BuildContext context, int index) {
                          return MaterialItem(material: _listElements[index]);
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
