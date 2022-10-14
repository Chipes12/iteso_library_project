import 'package:flutter/material.dart';

class BookItem extends StatelessWidget {
  final dynamic book;
  const BookItem({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        MaterialButton(
          onPressed: () {},
          child: Image.network(
            book["imageLink"],
            width: 120,
            height: 130,
          ),
        ),
        Text(
          "${book["title"]}",
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          softWrap: false,
          style: TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
