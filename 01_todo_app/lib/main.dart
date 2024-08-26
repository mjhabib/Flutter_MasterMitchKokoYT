import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/pages/home_page.dart';

Future<void> main() async {
  // init Hive
  await Hive.initFlutter();
  // open a box
  await Hive.openBox('myBox');

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData.light().copyWith(
          appBarTheme: const AppBarTheme(backgroundColor: Colors.yellow),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: Colors.yellow),
          primaryColor: Colors.yellow),
    );
  }
}
