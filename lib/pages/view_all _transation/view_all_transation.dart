import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:moneypouch/db/transation_db/transation_db.dart';
import 'package:moneypouch/models/category/category_model.dart';

class ViewAllTransation extends StatefulWidget {
  const ViewAllTransation({super.key});

  @override
  State<ViewAllTransation> createState() => _ViewAllTransationState();
}

class _ViewAllTransationState extends State<ViewAllTransation> {
  String dropdownvalue = 'All';

  // List of items in our dropdown menu
  var items = [
    'All',
    'income',
    'Expense',
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
              bottom: TabBar(
                tabs: [
                  DropdownButton(
                    dropdownColor: const Color.fromARGB(213, 20, 27, 38),
                    style: const TextStyle(
                        color: Color.fromARGB(255, 144, 237, 237),
                        fontSize: 19),

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
                      log(dropdownvalue);
                      log(TransationDbFunction().transationAll.value.length.toString());
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                  ),
                  const Text(
                    'Today',
                    style: TextStyle(fontSize: 25),
                  ),
                  const Text(
                    'Monthly',
                    style: TextStyle(fontSize: 25),
                  ),
                ],
              ),
              backgroundColor: const Color.fromARGB(213, 20, 27, 38),
              title: const Text(
                'All Transation',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              )),
          body: ValueListenableBuilder(
            valueListenable: TransationDbFunction().transationAll,
            builder: (context, value, child) => Padding(
              padding: const EdgeInsets.only(top: 50),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount:( 
                  // dropdownvalue == 'All'?
                  TransationDbFunction().transationAll.value.length),
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
                          TransationDbFunction().transationAll.value[index].id),
                      startActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        children: [
                          SlidableAction(
                            borderRadius: BorderRadius.circular(20),
                            onPressed: (ctx) {
                              TransationDbFunction().deleteTRAnsation(
                                  id: TransationDbFunction()
                                      .transationAll
                                      .value[index]
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
                           TransationDbFunction()
                                      .transationAll
                                      .value[index]
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
                        subtitle: Text(
                          // dropdownvalue == 'All'
                            // ? 
                            TransationDbFunction().transationAll.value[index].date),
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
                            TransationDbFunction().transationAll.value[index].category,
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
                            +TransationDbFunction().transationAll.value[index].amount.toString(),
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
            ),
          ),
        ));
  }
}
