import 'package:flutter/material.dart';
import 'package:tutelar_pet_app/src/screens/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 115, 0, 0),
        secondaryHeaderColor: const Color.fromARGB(255, 150, 0, 0),
        dividerColor: const Color.fromARGB(255, 76, 76, 76),
      ),
      home: const HomePage(),
    );
  }
}
