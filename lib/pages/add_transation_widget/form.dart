import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';


import 'date_pick.dart';
import 'drop_down.dart';
Text tx=const Text('Date');

class FormTransation extends StatefulWidget {
   FormTransation({Key?key , required this.isIncome}):super(key: key);
   bool isIncome;

  @override
  State<FormTransation> createState() => _FormTransationState();
}

class _FormTransationState extends State<FormTransation> {
  

  var amontController=TextEditingController();

 var categoryController=TextEditingController();

 var dateController=TextEditingController();

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
    return Material(
      child: Form(
        child: Column(children: [
           Padding(
                    padding: const EdgeInsets.only(left: 19,right: 19,top: 10,bottom: 10),
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
                      child: TextField(controller: amontController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            fillColor: const Color.fromARGB(255, 224, 224, 224),
                            filled: true,
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 241, 241, 241),
                                    style: BorderStyle.none),
                                borderRadius: BorderRadius.circular(20.0)),
                            hintText: 'Amount',
                            hintStyle:
                                const TextStyle(fontWeight: FontWeight.w300),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 241, 241, 241)),
                                borderRadius: BorderRadius.circular(20.0)),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 241, 241, 241)),
                              borderRadius: BorderRadius.circular(25.7),
                            )),
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 19,right: 19,top: 15,bottom: 10),
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
                        ]),child: const Padding(
                          padding: EdgeInsets.only(left: 19,right: 19,top: 15,bottom: 13 ),
                          child: 
                          
                          DropdownList(),
                        ))
                ),
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
                      title:  tx 
                      // Text(
                      //   ,
                      //   style: TextStyle(fontWeight: FontWeight.w300),
                      // ),
                      ,
                      trailing: IconButton(icon: Icon(Icons.date_range),onPressed: (() {
                        _selectDate(context); }),
                      ),
                     ) ,
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
                        title:  Center(
                            child: Text(
                                                    'Save',
                                                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
                                                  )),
                        onTap: () {
                        print('jk');
                        log(amontController.text);
                        log(categoryController.text);
                        log(dropDownVale.toString());
                        log(widget.isIncome.toString());
                        
                        log(tx.toString());
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("SAVED"),));}
                            ))),
                      
                    
        
      
        ]),
      ),
    );
  }
}
// FormTransation objformTRansation=FormTransation(isIncome: false,);