import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:moneypouch/db/category/category_db.dart';
import 'package:moneypouch/models/category/category_model.dart';

 dynamic dropDownVale='';


class DropdownList extends StatefulWidget {
   DropdownList({Key?key ,required this.isIncome}):super(key: key);
  bool isIncome;
  

  @override
  State<DropdownList> createState() => _DropdownListState();
}

class _DropdownListState extends State<DropdownList> {
  // int categoryGet(value){
    
  //   return dropDownVale;

  // }
   
  @override
  void initState() {
  
    super.initState();
  }
 

  // List of items in our dropdown menu
  // CategoryModel dropdownvalue=CategoryDbFunction().incomeListenable.value.first ;
   List<CategoryModel> items = CategoryDbFunction().incomeListenable.value;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color.fromARGB(255, 224, 224, 224),
      child: DropdownButtonFormField(elevation: 0,
      hint: Text('Select Category'),
            // icon: Icon(Icons.arrow_circle_down),
          decoration: InputDecoration(
            fillColor: const Color.fromARGB(255, 224, 224, 224),
            filled: true,
            isDense: true,
            contentPadding: EdgeInsets.zero,
            border: OutlineInputBorder(borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
          ) ,
          items:(widget.isIncome==false? CategoryDbFunction(). expenseListenable.value:CategoryDbFunction().incomeListenable.value).map((e) {
            return DropdownMenuItem( 
              value: e.name,
              child: Text(e.name),
            );
          }).toList(),
          // value: 'hj',
          onChanged: ( newValue) {
            print(newValue);
            log(newValue.toString());
            setState(() {
               dropDownVale= newValue;
            });
          }),
    );
  }
}

  // _DropdownListState objDropDown=_DropdownListState();


