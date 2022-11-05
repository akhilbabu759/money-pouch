
import 'package:flutter/material.dart';
import 'package:moneypouch/pages/home.dart';
import 'package:moneypouch/pages/splash-screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'money pouch',
      // theme: ThemeData(primaryColor: Color.fromARGB(255, 221, 224, 229)),
      home: const Splash(),
    );
  }
}