import 'package:flutter/material.dart';
import 'package:iteso_library_project/Widgets/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Inicio'),
        ),
        drawer: DrawerNav());
  }
}
