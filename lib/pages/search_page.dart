import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchPage> createState() => _searchPageState();
}

class _searchPageState extends State<SearchPage> {
  var bookController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Text(
            "Libreria ITESO",
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Column(
              children: [
                TextField(
                  controller: bookController,
                  decoration: InputDecoration(
                    filled: true,
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
                SizedBox(height: 10,),
                Divider(color:Colors.grey[100], height: 1,),
                ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
