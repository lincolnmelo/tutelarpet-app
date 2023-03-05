import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tutelar_pet_app/src/screens/login/start.dart';
import 'package:tutelar_pet_app/src/screens/home/home.dart';

class MainLogin extends StatefulWidget {
  const MainLogin({super.key});

  @override
  State<MainLogin> createState() => _MainLoginState();
}

class _MainLoginState extends State<MainLogin> {
  bool starting = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      starting = true;
    });
    WidgetsBinding.instance.addPostFrameCallback((_) => _setState());
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: starting ? const StartPage() : const HomePage());
  }

  _setState() {
    Timer(
        const Duration(milliseconds: 2000),
        () => setState(() {
              starting = false;
            }));
  }
}
