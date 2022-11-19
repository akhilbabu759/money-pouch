

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:moneypouch/models/category/category_model.dart';

import 'package:moneypouch/pages/splash_screen.dart';




Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
   await Hive.initFlutter();
   if(!Hive.isAdapterRegistered(CategoryTypeAdapter().typeId)){
      Hive.registerAdapter(CategoryTypeAdapter()); 
   }


    if(!Hive.isAdapterRegistered(CategoryModelAdapter().typeId)){
     Hive.registerAdapter(CategoryModelAdapter()); 
   }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData(
   primaryColor: const Color.fromARGB(66, 20, 27, 38),
   ),
      
      title: 'money pouch',
      // theme: ThemeData(primaryColor: Color.fromARGB(255, 221, 224, 229)),
      home:   const Splash(),
    );
  }
}
