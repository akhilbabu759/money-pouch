import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:moneypouch/pages/add_transation.dart';



class DropdownList extends StatefulWidget {
  const DropdownList({super.key});

  @override
  State<DropdownList> createState() => _DropdownListState();
}

class _DropdownListState extends State<DropdownList> {
  // List of items in our dropdown menu
  String dropdownvalue = 'Item 1';
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color.fromARGB(255, 224, 224, 224),
      child: DropdownButtonFormField(elevation: 0,
          decoration: InputDecoration(
            fillColor: Color.fromARGB(255, 224, 224, 224),
            filled: true,
            isDense: true,
            contentPadding: EdgeInsets.zero,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ) ,
          items: items.map((String items) {
            return DropdownMenuItem( 
              value: items,
              child: Text(items),
            );
          }).toList(),
          value: dropdownvalue,
          onChanged: (String? newValue) {
            setState(() {
              dropdownvalue = newValue!;
            });
          }),
    );
  }
}
