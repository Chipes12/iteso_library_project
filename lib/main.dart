import 'package:flutter/material.dart';
import 'package:iteso_library_project/pages/logIn/logIn.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ITESO Library',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: logIn(),
    );
  }
}
