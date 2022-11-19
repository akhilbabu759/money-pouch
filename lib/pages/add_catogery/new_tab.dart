

import 'package:flutter/material.dart';

import 'category_grid/category_grid.dart';

class NewTabe extends StatefulWidget {
  const NewTabe({super.key});

  @override
  State<NewTabe> createState() => _NewTabeState();
}

class _NewTabeState extends State<NewTabe> {
  @override
  Widget build(BuildContext context) {
    return Material(color:Color.fromARGB(255, 238, 236, 236),
       
      child:    Column(
        children: [
          DefaultTabController(
                length: 2, // length of tabs
                initialIndex: 0,
                child: Container(height: 65,
                  child: TabBar(
                    indicator:BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color:Color.fromARGB(255, 144, 237, 237) ,
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
                        ]
                  ),
                    indicatorColor: Colors.transparent,
                    labelColor: Colors.green,
                    unselectedLabelColor: Colors.black,
                    tabs: [
                      Text('INCOME',style: TextStyle(color: Colors.black,fontSize: 18),),
                      Text('EXPENSE',style: TextStyle(color: Colors.black,fontSize: 18),),
                      
                    TabBarView(children: [CategoryGrid(),])],
                  ),
                )),
        ],
      ));
    
  }
}