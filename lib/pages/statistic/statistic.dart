import 'package:flutter/material.dart';


class Statistic extends StatefulWidget {
   const Statistic({super.key});

  @override
  State<Statistic> createState() => _StatisticState();
}

class _StatisticState extends State<Statistic> {
String dropdownvalue = 'All'; 

var items = [   
    'All',
    'income',
    'Expense',
    
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 3,child:Scaffold( appBar: AppBar(
      bottom: TabBar(
        tabs: [
          DropdownButton(dropdownColor: const Color.fromARGB(213, 20, 27, 38),
            style: const TextStyle(color: Color.fromARGB(255, 144, 237, 237),fontSize: 19),
               
              // Initial Value
              value: dropdownvalue,
               
              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),   
               
              // Array list of items
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
            ),
          const Text('Today',style: TextStyle(fontSize: 25),),
          
          const Text('30 days',style: TextStyle(fontSize: 25),),
        ],
      ),

            backgroundColor: const Color.fromARGB(213, 20, 27, 38),
            title: const Text(
              'Statistic',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            )),
      ),
    );
  }
}