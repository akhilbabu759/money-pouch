import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class InputName extends StatelessWidget {
  const InputName({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(31, 20, 27, 38),
      body: Container( decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/money time.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Container(
                  alignment: Alignment.center,
                  height: 300,
                  padding: EdgeInsets.all(36.0),
                  color: Color.fromARGB(184, 251, 253, 253).withOpacity(0.2),
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
                      SizedBox(height: 50,),Padding(padding: EdgeInsets.only(left: 200,),
                        child: ElevatedButton(
                            onPressed: (() {}),
                            child: Text(
                              'Submit',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            )),
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
