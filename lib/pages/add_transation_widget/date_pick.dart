

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
      
        tx = Text(DateFormat.yMMMEd().format(picked));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color.fromARGB(255, 224, 224, 224),
      child: IconButton(
          onPressed: (() {
            _selectDate(context);
          }),
          icon: const Icon(Icons.calendar_month)),
    );
  }
}
