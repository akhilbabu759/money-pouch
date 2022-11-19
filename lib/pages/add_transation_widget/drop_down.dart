import 'package:flutter/material.dart';




class DropdownList extends StatefulWidget {
  const DropdownList({super.key});

  @override
  State<DropdownList> createState() => _DropdownListState();
}

class _DropdownListState extends State<DropdownList> {
  // List of items in our dropdown menu
  String dropdownvalue = 'food';
  var items = [
    'food',
    'emi',
    'rent',
    'loan',
    'other',
  ];
  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color.fromARGB(255, 224, 224, 224),
      child: DropdownButtonFormField(elevation: 0,
          decoration: InputDecoration(
            fillColor: const Color.fromARGB(255, 224, 224, 224),
            filled: true,
            isDense: true,
            contentPadding: EdgeInsets.zero,
            border: OutlineInputBorder(borderSide: BorderSide.none,
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