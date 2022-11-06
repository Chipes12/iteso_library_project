import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iteso_library_project/pages/Search/bloc/data_fire_b_bloc.dart';
import 'package:iteso_library_project/pages/Search/search_page.dart';
import 'package:iteso_library_project/pages/blocCamera/bloc/camera_bloc_bloc.dart';
import 'package:iteso_library_project/pages/logIn/logIn.dart';

void main() => runApp(MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => CameraBlocBloc(),
      ),
      BlocProvider(
        create: (context) => DataFireBBloc(),
      ),
    ], child: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ITESO Library',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: SearchPage(),
    );
  }
}
