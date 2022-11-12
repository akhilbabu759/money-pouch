import 'package:flutter/material.dart';


class CategoryGrid extends StatefulWidget {
  const CategoryGrid({super.key});

  @override
  State<CategoryGrid> createState() => _CategoryGridState();
}

class _CategoryGridState extends State<CategoryGrid> {
  void delete(){
    
    
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color.fromARGB(255, 238, 236, 236),
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          crossAxisCount: 3,
        ),
        shrinkWrap: true,
        children: [
          Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 224, 224, 224),
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
                  ]),
              child:  Card(
                  color: Color.fromARGB(255, 214, 214, 214),
                  child: Center(
                      child: TextButton(onPressed: () {
                        
                      },onLongPress: () {
                        showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    actions: [Text('yes'),SizedBox(width: 30,),
                        Text('no')
                    ],
                    title:  Text('Do you want to delete'),
                    content: Text('Food')
                  );
                });
          },

                        //delete function
                      
                        child: Text(
                                          'Food',
                                          style: TextStyle(
                          color: Color.fromARGB(221, 49, 42, 42),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontStyle: FontStyle.italic),
                                        ),
                      )))),
          Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 224, 224, 224),
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
                  ]),
              child:  Card(
                  color: Color.fromARGB(255, 214, 214, 214),
                  child: Center(
                    
                      child: TextButton(onPressed: () {
                        
                      },onLongPress: () {
                        showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    actions: [Text('yes'),SizedBox(width: 30,),
                        Text('no')
                    ],
                    title:  Text('Do you want to delete'),
                    content: Text('TAX')
                  );
                });
          },
                        child: Text(
                                          'TAX',
                                          style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontStyle: FontStyle.italic),
                                        ),
                      )))),
          Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 224, 224, 224),
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
                  ]),
              child:  Card(
                  color: Color.fromARGB(255, 214, 214, 214),
                  child: Center(
                      child: TextButton(onPressed: () {
                        
                      },onLongPress: () {
                        showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    actions: [Text('yes'),SizedBox(width: 30,),
                        Text('no')
                    ],
                    title:  Text('Do you want to delete'),
                    content: Text('EmI')
                  );
                });
          },
                        child: Text(
                                          'EMI',
                                          style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontStyle: FontStyle.italic),
                                        ),
                      )))),
          Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 224, 224, 224),
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
                  ]),
              child:  Card(
                  color: Color.fromARGB(255, 214, 214, 214),
                  child: Center(
                      child: TextButton(onPressed: () {
                        
                      },onLongPress: () {
                        showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    actions: [Text('yes'),SizedBox(width: 30,),
                        Text('no')
                    ],
                    title:  Text('Do you want to delete'),
                    content: Text('Film')
                  );
                });
          },
                        child: Text(
                                          'Film',
                                          style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontStyle: FontStyle.italic),
                                        ),
                      )))),
          Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 224, 224, 224),
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
                  ]),
              child: Card(
                  color: Color.fromARGB(255, 214, 214, 214),
                  child: Center(
                      child: TextButton(onPressed: () {
                        
                      },onLongPress: () {
                        showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    actions: [Text('yes'),SizedBox(width: 30,),
                        Text('no')
                    ],
                    title:  Text('Do you want to delete'),
                    content: Text('RENT')
                  );
                });
          },
                        child: Text(
                                          'Rent',
                                          style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontStyle: FontStyle.italic),
                                        ),
                      )))),
        ],
      ),
    );
  }
}
