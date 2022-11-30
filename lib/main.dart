import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:iteso_library_project/pages/Search/bloc/data_fire_b_bloc.dart';
import 'package:iteso_library_project/pages/blocCamera/bloc/camera_bloc_bloc.dart';
import 'package:iteso_library_project/pages/logIn/login2.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  initializeDateFormatting().then((_) => runApp(MultiBlocProvider(providers: [
        BlocProvider(
          create: (context) => CameraBlocBloc(),
        ),
        BlocProvider(
          create: (context) => DataFireBBloc(),
        ),
      ], child: MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ITESO Library',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: Login2(),
    );
  }
}
