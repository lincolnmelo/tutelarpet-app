import 'package:flutter/material.dart';
import 'package:tutelar_pet_app/src/components/app_bar.dart';
import 'package:tutelar_pet_app/src/components/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarComponent(
          key: UniqueKey(),
          title: const Text(''),
          appBar: AppBar(),
        ),
        drawer: const DrawerComponent(),
        body: graphic());
  }

  Widget graphic() {
    return const Scaffold();
  }
}
