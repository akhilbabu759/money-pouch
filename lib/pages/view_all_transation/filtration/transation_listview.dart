import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:moneypouch/db/category/category_db.dart';
import 'package:moneypouch/db/transation_db/transation_db.dart';
import 'package:moneypouch/models/category/category_model.dart';
import 'package:moneypouch/models/transation_model/transation_model.dart';

late var dropDownVale;


class TransationListView extends StatefulWidget {
    TransationListView({Key?key,required this.results,});
    // int ?tabValue;
  //  :super(key: key);
  // bool isIncome;
  List<TransationModel> results = [];

  

  @override
  State<TransationListView> createState() => _DropdownListState();
}

class _DropdownListState extends State<TransationListView> {
  String parseDate(DateTime date) {
    return DateFormat.MMMd().format(date);
  }
  
  
   
  String dropdownvalue = 'All';
   var items = [
    'All',
    'income',
    'Expense',
  ];
  // int categoryGet(value){
    
  //   return dropDownVale;

  // }
   
  @override
  void initState() {
  
    super.initState();
  }
 

  // List of items in our dropdown menu
  // CategoryModel dropdownvalue=CategoryDbFunction().incomeListenable.value.first ;
  //  List<CategoryModel> items = CategoryDbFunction().incomeListenable.value;
  @override
  Widget build(BuildContext context) {
    return Material(
      // color: const Color.fromARGB(255, 224, 224, 224),
      child: Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount:( 
                      // dropdownvalue == 'All'?
                     widget.results.length),
                    // : TransationDbFunction().incomeListenable.value.length 
                        //  : dropdownvalue == 'income'
                            //  ? TransationDbFunction().incomeListenable.value.length
                            //  :
                              // TransationDbFunction().expenseListenable.value.length),
                    itemBuilder: (BuildContext context, index) => ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 18, right: 18, bottom: 15),
                        child: Slidable(
                          key: ValueKey(
                              widget.results[index].id),
                          startActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            children: [
                              SlidableAction(
                                borderRadius: BorderRadius.circular(20),
                                onPressed: (ctx) {
                                  TransationDbFunction().deleteTRAnsation(
                                      id: widget.results[index]
                                          .id);
                                },
                                icon: Icons.delete,
                                backgroundColor: Colors.red,
                                label: 'DELETE',
                              )
                            ],
                          ),
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            tileColor: const Color.fromARGB(255, 241, 241, 241),
                            leading: Padding(
                              padding:const EdgeInsets.all(8.0),
                              child: (
                                // dropdownvalue=='All'?
                               widget.results[index]
                                          .isIncome ==
                                      true
                                  ? const Icon(
                                      Icons.arrow_upward,
                                      color: Colors.green,
                                    )
                                  : const Icon(
                                      Icons.arrow_downward,
                                      color: Colors.red,
                                    )
                                    // :dropdownvalue=='income'?Icon(
                                    //   Icons.arrow_upward,
                                    //   color: Colors.green,
                                    // ):Icon(
                                    //   Icons.arrow_downward,
                                    //   color: Colors.red,
                                    // )
                                    ),
                            ),
                            subtitle: Text(parseDate(widget.results[index].date)
                              // dropdownvalue == 'All'
                                // ? 
                                ),
                                // : dropdownvalue == 'income'
                                    // ? TransationDbFunction()
                                        // .incomeListenable
                                        // .value
                                        // [index].date
                                    // : TransationDbFunction()
                                        // .expenseListenable
                                        // .value
                                        // [index].date),
                            title: Text(
                              // dropdownvalue == 'All'
                                // ? 
                                widget.results[index].category,
                                // : dropdownvalue == 'income'
                                //     ? TransationDbFunction()
                                //         .incomeListenable
                                //         .value
                                //         [index].category
                                //     : TransationDbFunction()
                                //         .expenseListenable
                                //         .value
                                //         [index].category,
                              style:const  TextStyle(fontSize: 18),
                            ),
                            trailing: Text(
                              '₹'
                              // $dropdownvalue' == 'All'
                                // ? 
                                +widget.results[index].amount.toString(),
                                // : dropdownvalue == 'income'
                                    // ? TransationDbFunction()
                                    //     .incomeListenable
                                    //     .value
                                    //     [index].amount.toString()
                                    // : TransationDbFunction()
                                    //     .expenseListenable
                                    //     .value
                                    //     [index].amount.toString(),
                              style: const TextStyle(fontSize: 19),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
    );
  }
}