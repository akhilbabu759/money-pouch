import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(136, 20, 27, 38),
      body: SafeArea(
          child: Center(
        child: Column(mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children:const [
            Icon(Icons.money, color: Colors.deepOrangeAccent),
            Text(
              'MONEY POUCH',
              style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 7, 255, 255),
                  letterSpacing: 6),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
                width: 200,
                child: ClipRRect( borderRadius: BorderRadius.all(Radius.circular(40)),
                  child: LinearProgressIndicator(
                    color: Color.fromARGB(255, 7, 255, 255),
                    backgroundColor: Colors.white,
                    minHeight: 16,
                  ),
                )),
          ],
        ),
      )),
    );
  }
}
