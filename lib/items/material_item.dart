import 'package:flutter/material.dart';
import 'package:iteso_library_project/pages/check_material.dart';

class MaterialItem extends StatelessWidget {
  final dynamic material;
  const MaterialItem({super.key, required this.material});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        MaterialButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MaterialDetail(
                        material: material,
                      )),
            );
          },
          child: Image.network(
            material["imageLink"],
            width: 120,
            height: 130,
          ),
        ),
        Container(
          width: 120,
          height: 20,
          child: Text(
            "${material["title"]}",
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
