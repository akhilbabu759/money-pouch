import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
import 'package:moneypouch/pages/one%20time/user_input.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(//differnt size phone 
      backgroundColor: const Color.fromARGB(255, 20, 27, 38),
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 80,
          ),LottieBuilder.asset('assets/images/38575-make-money-online.zip',height: 219,width: 490,),
         
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.647,
              alignment: Alignment.topRight,
              color: Colors.white,
              child: Column(
                children: [
                  const ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(130),
                        bottomRight: Radius.circular(130),
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    child: Image(
                        image: AssetImage(
                            'assets/images/Types-of-financial-managers.jpg')),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Do the best you can, and don’t take life too serious',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: ElevatedButton(
                      onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => const InputName(),));},
                      child: const Text('Get Start>>', style: TextStyle(fontSize: 20)),
                    ),
                  )
                ],
              ),
            ),
          ),
          
        ]),
      ),
    );
  }
}
