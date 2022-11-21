import 'package:flutter/material.dart';
import 'messages.dart';

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
                    material["image_url"],
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
                      onPressed: material["available"] == 0
                          ? null
                          : () {
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
