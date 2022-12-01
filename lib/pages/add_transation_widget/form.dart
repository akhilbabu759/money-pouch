import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:moneypouch/db/transation_db/transation_db.dart';
import 'package:moneypouch/models/category/category_model.dart';
import 'package:moneypouch/models/transation_model/transation_model.dart';
import 'package:moneypouch/pages/add_category.dart';
import 'package:moneypouch/pages/home.dart';

import 'date_pick.dart';
import 'drop_down.dart';

String? tx;

class FormTransation extends StatefulWidget {
  FormTransation({Key? key, required this.isIncome}) : super(key: key);
  bool isIncome;

  @override
  State<FormTransation> createState() => _FormTransationState();
}

class _FormTransationState extends State<FormTransation> {
  var amontController = TextEditingController();

  var categoryController = TextEditingController();

  var dateController = TextEditingController();

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary:
                    Color.fromARGB(213, 20, 27, 38), // header background color
                onPrimary: Colors.white, // header text color
                onSurface: Color.fromARGB(213, 20, 27, 38), // body text color
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  primary: Colors.red, // button text color
                ),
              ),
            ),
            child: child!,
          );
        },
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime.now());
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        tx = parseDate(picked);
        // tx = ("${selectedDate.toLocal()}".split(' ')[0]);
      });
    }
  }

  String parseDate(DateTime date) {
    return DateFormat.MMMd().format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Form(
        child: Column(children: [
          Padding(
              padding: const EdgeInsets.only(
                  left: 19, right: 19, top: 10, bottom: 10),
              child: Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 224, 224, 224),
                    borderRadius: BorderRadius.circular(20),
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
                child: TextField(
                  autofocus: false,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(10),
                  ],
                  controller: amontController,
                  //  222maxLength: 7,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      fillColor: const Color.fromARGB(255, 224, 224, 224),
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 241, 241, 241),
                              style: BorderStyle.none),
                          borderRadius: BorderRadius.circular(20.0)),
                      // hintText: 'Amount',
                      label: Text('Amount'),
                      hintStyle: const TextStyle(fontWeight: FontWeight.w300),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 241, 241, 241)),
                          borderRadius: BorderRadius.circular(20.0)),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 241, 241, 241)),
                        borderRadius: BorderRadius.circular(25.7),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 9.0, horizontal: 10.0)),
                ),
              )),
          Padding(
              padding: const EdgeInsets.only(
                  left: 19, right: 19, top: 15, bottom: 10),
              child: Container(
                  height: 54,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 224, 224, 224),
                      borderRadius: BorderRadius.circular(20),
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
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                            child: DropdownList(isIncome: widget.isIncome)),
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    AddCatogery(isFromBottomNav: false),
                              ));
                            },
                            icon: Icon(Icons.add))
                      ],
                    ),
                  ))),
          Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 224, 224, 224),
                    borderRadius: BorderRadius.circular(20),
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
                child: ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  tileColor: const Color.fromARGB(255, 241, 241, 241),
                  title: tx == null
                      ? Text(
                          'Date',
                          style: TextStyle(fontWeight: FontWeight.w300),
                        )
                      : Text(tx.toString(),
                          style: TextStyle(fontWeight: FontWeight.w300))
                  // Text(
                  //   ,
                  //   style: TextStyle(fontWeight: FontWeight.w300),
                  // ),
                  ,
                  trailing: IconButton(
                    icon: Icon(Icons.date_range),
                    onPressed: (() {
                      _selectDate(context);
                    }),
                  ),
                ),
              )),
          Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 144, 237, 237),
                      borderRadius: BorderRadius.circular(20),
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
                  child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      //
                      title: const Center(
                          child: Text(
                        'Save',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      )),
                      onTap: () {
                        log(selectedDate.toString());

                        if (amontController.text == '' ||
                            dropDownVale == '' ||
                            tx == null) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.yellow,
                            content: Text("Please enter Data"),
                          ));
                        } else {
                          final transation = TransationModel(
                              amount: int.parse(amontController.text),
                              category: dropDownVale,
                              isIncome: widget.isIncome,
                              date: selectedDate,
                              id: DateTime.now()
                                  .millisecondsSinceEpoch
                                  .toString());
                          TransationDbFunction().insertTransation(transation);
                          // print('jk');
                          log(amontController.text);
                          log(categoryController.text);
                          log(dropDownVale.toString());
                          log(widget.isIncome.toString());

                          // print(tx);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.green,
                            content: Text("SAVED"),
                          ));
                          Navigator.of(context).pop(MaterialPageRoute(
                            builder: (context) => Home(),
                          ));
                        }
                      }))),
        ]),
      ),
    );
  }
}
