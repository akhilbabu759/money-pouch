import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../add_transation.dart';



class DatePick extends StatefulWidget {
  const DatePick({super.key});

  @override
  State<DatePick> createState() => _DatePickState();
}

class _DatePickState extends State<DatePick> {
  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        tx=Text("${selectedDate.toLocal()}".split(' ')[0]);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(color: Color.fromARGB(255, 224, 224, 224),
      child: IconButton(onPressed: (() {
         _selectDate(context);
        
      }), icon: Icon(Icons.calendar_month)),
    );
  }
}