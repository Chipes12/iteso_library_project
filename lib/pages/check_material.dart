import 'package:flutter/material.dart';

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
        appBar: AppBar(
            title:  Text('${material["title"]}'),
            actions: [
              IconButton(
                icon:  Icon(Icons.favorite),
                onPressed: () {},
              ),
            ]),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Image.network(
                      material["imageLink"],
                      fit: BoxFit.fill,
                      height: 250,
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          "Disponibles: ${material["available"]}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5, left: 5),
                          child: Text(
                            "${material["description"]}",
                            style: TextStyle(
                                fontStyle: FontStyle.italic, fontSize: 16),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

