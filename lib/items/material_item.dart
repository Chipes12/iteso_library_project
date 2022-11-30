import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iteso_library_project/pages/Material/check_book.dart';
import 'package:iteso_library_project/pages/Material/check_movie.dart';

class MaterialItem extends StatelessWidget {
  final dynamic collection;
  const MaterialItem({super.key, required this.collection});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        MaterialButton(
          onPressed: () {
            //print(collection.data());
            try {
              if (collection["duration"] != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MaterialDetailMovie(
                            material: collection,
                          )),
                );
              }
            } catch (e) {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MaterialDetailBook(
                          material: collection,
                        )),
              );
            }
          },
          child: Image.network(
            collection["image_url"],
            width: 120,
            height: 130,
          ),
        ),
        Container(
          width: 120,
          height: 20,
          child: Text(
            "${collection["title"]}",
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            softWrap: false,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
