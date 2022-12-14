

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:intl/intl.dart';
import 'package:moneypouch/db/transation_db/transation_db.dart';

import 'package:moneypouch/models/transation_model/transation_model.dart';

import 'filtration/transation_listview.dart';

class ViewAllTransation extends StatefulWidget {
  const ViewAllTransation({super.key});

  @override
  State<ViewAllTransation> createState() => _ViewAllTransationState();
}

class _ViewAllTransationState extends State<ViewAllTransation>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    results = TransationDbFunction.instance.transationAll.value;

    super.initState();
    _tabController = TabController(vsync: this, length: 3);
    _tabController.addListener(() {
      setState(() {
       filter(dropDownVale);
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  DateTime selectedmonth = DateTime.now();
  void _selectDate(context) async {
    final DateTime? picked = await showDatePicker(
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary:
                    Color.fromARGB(213, 20, 27, 38), // header background color
                onPrimary: Colors.white, // header text color
                onSurface: Color.fromARGB(213, 20, 27, 38), // body text color
              ),
            ),
            child: child!,
          );
        },
        context: context,
        initialDate: selectedmonth,
        firstDate: DateTime(2021),
        lastDate: DateTime(2030));

    if (picked != null && picked != selectedmonth) {
      setState(() {
        selectedmonth = picked;
      });
    }
  }

  dynamic dropDownVale = 'All';

  List items = ['All', 'today', 'yesterday', 'week', 'month'];

  String parseDate(DateTime date) {
    return DateFormat.MMMd().format(date);
  }

  List<TransationModel> results = [];
  void _runFilter(String enteredKeyword) {
    if (enteredKeyword.isEmpty) {
      setState(() {
        
        filter(dropDownVale);
      });
    } else {
      setState(() {
        results = results
            .where((user) => user.category
                .toLowerCase()
                .contains(enteredKeyword.toLowerCase()))
            .toList();
        
      });
    }

    // Refresh the UI
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(213, 20, 27, 38),
            title: const Text(
              'All Transation',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
          ),
          body: ValueListenableBuilder(
            valueListenable: TransationDbFunction.instance.recentTransation,
            builder: (context, value, child) => Column(
              children: [
                Padding(
                    padding: const EdgeInsets.only(
                        left: 19, right: 19, top: 20, bottom: 1),
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
                        onChanged: (value) {
                          _runFilter(value);
                        },
                        autofocus: false,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10),
                        ],
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            suffixIcon: const Icon(Icons.search),
                            fillColor: const Color.fromARGB(255, 224, 224, 224),
                            filled: true,
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 241, 241, 241),
                                    style: BorderStyle.none),
                                borderRadius: BorderRadius.circular(20.0)),
                            label: const Text('Search'),
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
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 9.0, horizontal: 10.0)),
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 250.0, right: 5),
                  child: DropdownButton(
                      icon: const Icon(Icons.filter_list_alt),
                      underline: Container(),
                      elevation: 0,
                      borderRadius: BorderRadius.circular(10),
                      items: items.map((e) {
                        return DropdownMenuItem(
                          value: e,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(e),
                          ),
                        );
                      }).toList(),
                      onChanged: (newValue){
                        if (newValue == 'month') {
                          _selectDate(context);
                          
                        }
                        filter(newValue);
                       
                      }),
                ),
                TabBar(
                  controller: _tabController,
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color.fromARGB(255, 144, 237, 237),
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
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.black,
                  tabs: const [
                    Tab(
                      text: 'Overview',
                    ),
                    Tab(
                      text: 'Income',
                    ),
                    Tab(
                      text: 'Expense',
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                    child: TabBarView(controller: _tabController, children: [
                  TransationListView(
                    results: results,
                  ),
                  TransationListView(
                    results: results,
                  ),
                  TransationListView(
                    results: results,
                  )
                ])),
              ],
            ),
          ),
        ));
  }
  void filter(newValue){
     

                        setState(() {
                          dropDownVale = newValue;
                        });
                        final DateTime now = DateTime.now();
                        if (dropDownVale == 'All') {
                          setState(() {
                            results = (_tabController.index == 0
                                ? TransationDbFunction().transationAll.value
                                : _tabController.index == 1
                                    ? TransationDbFunction()
                                        .incomeListenable
                                        .value
                                    : TransationDbFunction()
                                        .expenseListenable
                                        .value);
                          });
                        } else if (dropDownVale == 'today') {
                          setState(() {
                            results = (_tabController.index == 0
                                    ? TransationDbFunction().transationAll.value
                                    : _tabController.index == 1
                                        ? TransationDbFunction()
                                            .incomeListenable
                                            .value
                                        : TransationDbFunction()
                                            .expenseListenable
                                            .value)
                                .where((element) => parseDate(element.date)
                                    .toLowerCase()
                                    .contains(parseDate(DateTime.now())
                                        .toLowerCase()))
                                .toList();
                          });
                        } else if (dropDownVale == 'yesterday') {
                          setState(() {
                            DateTime start =
                                DateTime(now.year, now.month, now.day - 1);
                            DateTime end = start.add(const Duration(days: 1));
                            results = (_tabController.index == 0
                                    ? TransationDbFunction().transationAll.value
                                    : _tabController.index == 1
                                        ? TransationDbFunction()
                                            .incomeListenable
                                            .value
                                        : TransationDbFunction()
                                            .expenseListenable
                                            .value)
                                .where((element) =>
                                    (element.date.isAfter(start) ||
                                        element.date == start) &&
                                    element.date.isBefore(end))
                                .toList();
                          });
                        } else if (dropDownVale == 'week') {
                          setState(() {
                            DateTime start =
                                DateTime(now.year, now.month, now.day - 6);
                            DateTime end = DateTime(
                                start.year, start.month, start.day + 7);
                            results = (_tabController.index == 0
                                    ? TransationDbFunction().transationAll.value
                                    : _tabController.index == 1
                                        ? TransationDbFunction()
                                            .incomeListenable
                                            .value
                                        : TransationDbFunction()
                                            .expenseListenable
                                            .value)
                                .where((element) =>
                                    (element.date.isAfter(start) ||
                                        element.date == start) &&
                                    element.date.isBefore(end))
                                .toList();
                          });
                        } else {
                          setState(() {
                            DateTime start = DateTime(
                                selectedmonth.year, selectedmonth.month, 1);
                            DateTime end = DateTime(
                                start.year, start.month + 1, start.day);
                            results = (_tabController.index == 0
                                    ? TransationDbFunction().transationAll.value
                                    : _tabController.index == 1
                                        ? TransationDbFunction()
                                            .incomeListenable
                                            .value
                                        : TransationDbFunction()
                                            .expenseListenable
                                            .value)
                                .where((element) =>
                                    (element.date.isAfter(start) ||
                                        element.date == start) &&
                                    element.date.isBefore(end))
                                .toList();
                          });
                        }
  }
}
