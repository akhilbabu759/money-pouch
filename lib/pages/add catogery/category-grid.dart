import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color.fromARGB(255, 238, 236, 236),
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          crossAxisCount: 3,
        ),
        children: [
          Container(
              child: Card(
                  color: Color.fromARGB(255, 214, 214, 214),
                  child: Center(
                      child: Text(
                    'Food',
                    style: TextStyle(
                        color: Color.fromARGB(221, 49, 42, 42),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontStyle: FontStyle.italic),
                  ))),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 224, 224, 224),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(255, 158, 158, 158),
                      blurRadius: 15,
                      offset: Offset(5, 5),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      blurRadius: 15,
                      offset: Offset(-5, -5),
                    ),
                  ])),
          Container(
              child: Card(
                  color: Color.fromARGB(255, 214, 214, 214),
                  child: Center(
                      child: Text(
                    'TAX',
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontStyle: FontStyle.italic),
                  ))),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 224, 224, 224),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(255, 158, 158, 158),
                      blurRadius: 15,
                      offset: Offset(5, 5),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      blurRadius: 15,
                      offset: Offset(-5, -5),
                    ),
                  ])),
          Container(
              child: Card(
                  color: Color.fromARGB(255, 214, 214, 214),
                  child: Center(
                      child: Text(
                    'EMI',
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontStyle: FontStyle.italic),
                  ))),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 224, 224, 224),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(255, 158, 158, 158),
                      blurRadius: 15,
                      offset: Offset(5, 5),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      blurRadius: 15,
                      offset: Offset(-5, -5),
                    ),
                  ])),
          Container(
              child: Card(
                  color: Color.fromARGB(255, 214, 214, 214),
                  child: Center(
                      child: Text(
                    'Film',
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontStyle: FontStyle.italic),
                  ))),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 224, 224, 224),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(255, 158, 158, 158),
                      blurRadius: 15,
                      offset: Offset(5, 5),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      blurRadius: 15,
                      offset: Offset(-5, -5),
                    ),
                  ])),
          Container(
              child: Card(
                  color: Color.fromARGB(255, 214, 214, 214),
                  child: Center(
                      child: Text(
                    'Rent',
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontStyle: FontStyle.italic),
                  ))),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 224, 224, 224),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(255, 158, 158, 158),
                      blurRadius: 15,
                      offset: Offset(5, 5),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      blurRadius: 15,
                      offset: Offset(-5, -5),
                    ),
                  ])),
        ],
        shrinkWrap: true,
      ),
    );
  }
}
