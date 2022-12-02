import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iteso_library_project/Widgets/drawer.dart';
import 'package:iteso_library_project/items/material_item.dart';
import 'package:iteso_library_project/pages/Search/bloc/data_fire_b_bloc.dart';
import 'package:iteso_library_project/pages/Search/qr_scanner.dart';
import 'package:iteso_library_project/providers/rent_provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchPage> createState() => _searchPageState();
}

class _searchPageState extends State<SearchPage> {
  var bookController = TextEditingController();

  final Stream<QuerySnapshot> books =
      FirebaseFirestore.instance.collection('book').snapshots();
  final Stream<QuerySnapshot> movies =
      FirebaseFirestore.instance.collection('movie').snapshots();

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
                  //Abrir camara para escanear código QR
                  /*BlocProvider.of<CameraBlocBloc>(context)
                      .add(OpenCameraEvent());*/
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: ((context) => QRScanner())));
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
                child: stateWidget(),
              ),
            ],
          ),
        ));
  }

  Column allElements() {
    return Column(
      children: [
        searchField(),
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
            child: StreamBuilder<QuerySnapshot>(
              stream: books,
              builder: ((BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text("Algo salió mal");
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                final bookData = snapshot.requireData;

                return ListView.builder(
                  itemCount: bookData.size ~/ 2,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return MaterialItem(collection: bookData.docs[index]);
                  },
                );
              }),
            )),
        SizedBox(
          height: 10,
        ),
        Container(
            height: 150,
            child: StreamBuilder<QuerySnapshot>(
              stream: books,
              builder: ((BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text("Algo salió mal");
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                final bookData = snapshot.requireData;

                return ListView.builder(
                  itemCount: bookData.size ~/ 2,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return MaterialItem(
                        collection: bookData.docs[index + bookData.size ~/ 2]);
                  },
                );
              }),
            )),
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
            child: StreamBuilder<QuerySnapshot>(
              stream: movies,
              builder: ((BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text("Algo salió mal");
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                final movieData = snapshot.requireData;

                return ListView.builder(
                  itemCount: movieData.size ~/ 2,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return MaterialItem(collection: movieData.docs[index]);
                  },
                );
              }),
            )),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 150,
          child: StreamBuilder<QuerySnapshot>(
            stream: movies,
            builder:
                ((BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text("Algo salió mal");
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              final movieData = snapshot.requireData;

              return ListView.builder(
                itemCount: movieData.size ~/ 2,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return MaterialItem(
                      collection: movieData.docs[index + movieData.size ~/ 2]);
                },
              );
            }),
          ),
        )
      ],
    );
  }

  TextField searchField() {
    return TextField(
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
          onPressed: () {
            BlocProvider.of<DataFireBBloc>(context)
                .add(SearchEvent(strToSearch: bookController.text));
          },
        ),
      ),
    );
  }

  BlocConsumer<DataFireBBloc, DataFireBState> stateWidget() {
    return BlocConsumer<DataFireBBloc, DataFireBState>(
      listener: ((context, state) {
        if (state is DataNotFoundState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                  "No se encontró el material, regresando a todos los elementos")));
        }
      }),
      builder: (context, state) {
        if (state is DataSearchingState) {
          return Column(
            children: [
              searchField(),
              Center(child: CircularProgressIndicator()),
            ],
          );
        } else if (state is DataFoundState) {
          return Container(
            child: Column(
              children: [
                searchField(),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: context.watch<DataFireBBloc>().results.length,
                    itemBuilder: (BuildContext context, int index) {
                      return MaterialItem(
                          collection:
                              context.watch<DataFireBBloc>().results[index]);
                    },
                  ),
                ),
              ],
            ),
          );
        } else if (state is DataNotFoundState) {
          return allElements();
        } else
          return allElements();
      },
    );
  }
}
