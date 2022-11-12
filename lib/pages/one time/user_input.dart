import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:moneypouch/pages/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InputName extends StatefulWidget {
   const InputName({super.key});

  @override
  State<InputName> createState() => _InputNameState();
}

class _InputNameState extends State<InputName> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(31, 20, 27, 38),
      body: Container( decoration:  BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/money time.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(filter: new ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
        // width: 400.0,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Container(
                    alignment: Alignment.center,
                    height:300,
                    padding: const EdgeInsets.all(36.0),
                    color: const Color.fromARGB(184, 251, 253, 253).withOpacity(0.3),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Enter name',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)))),
                        const SizedBox(height: 50,),Padding(padding: const EdgeInsets.only(left: 200,),
                          child: ClipRRect(
                            child: ElevatedButton(
                                onPressed: (() async {
                                   SharedPreferences prefs = await SharedPreferences.getInstance();
                                   await prefs.setBool('seen', true);
                                   Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Home(),));
                                }),
                                child: const Text(
                                  'Submit',
                                  style: TextStyle(
                                      fontSize: 17, fontWeight: FontWeight.bold),
                                )),
                          ),
                        ),
                        
                         
                    
                       
                        
                      ],
                    ),
                  ),
                ),
                 
              ]),
        ),
      )
      
    );
  }
}
