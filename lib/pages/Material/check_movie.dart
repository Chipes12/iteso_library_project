//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iteso_library_project/pages/Search/bloc/data_fire_b_bloc.dart';
//import 'package:iteso_library_project/pages/Search/search_page.dart';
import 'package:iteso_library_project/providers/rent_provider.dart';
import '../../providers/messages.dart';
import 'package:provider/provider.dart';

class MaterialDetailMovie extends StatefulWidget {
  final dynamic material;
  const MaterialDetailMovie({Key? key, required this.material})
      : super(key: key);

  @override
  State<MaterialDetailMovie> createState() => _MaterialDetailState();
}

class _MaterialDetailState extends State<MaterialDetailMovie> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('${widget.material["title"]}'), actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              BlocProvider.of<DataFireBBloc>(context)
                  .add(AddFavoriteEvent(title: widget.material["title"]));
            },
          ),
        ]),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Image.network(
                    widget.material["image_url"],
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
                            "Disponibles: ${widget.material["available"]}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            "Título: ${widget.material["title"]}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            "Dirigida por: ${widget.material["director"]}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            "Año: ${widget.material["year"]}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            "Duración: ${widget.material["duration"]} minutos",
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
                              "${widget.material["description"]}",
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
                      onPressed: widget.material["available"] == 0
                          ? null
                          : () {
                              context
                                  .read<RentProvider>()
                                  .rentMaterial(widget.material);
                              pickUpMaterial(context);
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
}
