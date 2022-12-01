import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:moneypouch/db/transation_db/transation_db.dart';

import 'package:moneypouch/pages/add_transation.dart';

import 'package:moneypouch/pages/bottom_navigator/bottom_navigator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'view_all_transation/view_all_transation.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String name = '';
  @override
  void initState() {
    TransationDbFunction().refreshUI();
    super.initState();
    nameSet();
  }

  void nameSet() async {
    WidgetsFlutterBinding.ensureInitialized();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('name').toString();
    });
  }

  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'morning';
    }
    if (hour < 17) {
      return 'afternoon';
    }
    return 'evening';
  }

  String parseDate(DateTime date) {
    return DateFormat.MMMd().format(date);
  }

  late SlidableController slidableController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 224, 224, 224),
          onPressed: () {
           
            Navigator.of(context).push(MaterialPageRoute(
                builder: ((context) => const AddTransation())));
          },
          child: const Icon(
            Icons.add,
            color: Colors.black,
          )),
      backgroundColor: const Color.fromARGB(213, 20, 27, 38),
      body: SingleChildScrollView(
        child: SafeArea(
          child: ValueListenableBuilder(
            valueListenable: TransationDbFunction().recentTransation,
            builder: (context, value, child) => Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 270),
                    child: Text(
                      'Good ${greeting()} ,',
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 145.0,
                    ),
                    child: Text(' $name',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 23,
                            fontWeight: FontWeight.w400)),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(17.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(35.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(25),
                        child: Column(
                          children: [
                            Text(
                              TransationDbFunction().totalAmountNotifer.value <=
                                      -1
                                  ? 'LOSS'
                                  : 'CURRENT BALANCE',
                              style: const TextStyle(fontSize: 25),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              TransationDbFunction().totalAmountNotifer.value <=
                                      -1
                                  ? TransationDbFunction()
                                      .totalAmountNotifer
                                      .value
                                      .toString()
                                  : '₹ ${TransationDbFunction().totalAmountNotifer.value}',
                              style: TransationDbFunction()
                                          .totalAmountNotifer
                                          .value <=
                                      -1
                                  ? const TextStyle(
                                      color: Colors.red, fontSize: 17)
                                  : const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 13,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text('INCOME',
                                    style: TextStyle(
                                      fontSize: 19,
                                    )),
                                Icon(
                                  Icons.arrow_upward,
                                  color: Colors.green,
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                Icon(Icons.arrow_downward, color: Colors.red),
                                Padding(
                                  padding: EdgeInsets.only(right: 1),
                                  child: Text(
                                    'EXPENSE',
                                    style: TextStyle(
                                      fontSize: 19,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 9,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    '₹ ${TransationDbFunction().totalIncomeNotifer.value}',
                                    style: const TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w500)),
                                Text(
                                  '₹ ${TransationDbFunction().totalExpenseNotifer.value}',
                                  style: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    height:
                        459, // if lose is come ,the container dispaly on before bottom navigator
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20, left: 27, right: 20, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Recent Transation',
                                  style: TextStyle(
                                    fontSize: 20,
                                  )),
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) =>
                                          const ViewAllTransation(),
                                    ));
                                  },
                                  child: const Text(
                                    'view all',
                                    style: TextStyle(color: Colors.blue),
                                  ))
                            ],
                          ),
                        ),
                        Expanded(
                          child: ValueListenableBuilder(
                            valueListenable:
                                TransationDbFunction().recentTransation,
                            builder: (BuildContext context, value, Widget? _) =>
                                Card(
                              elevation: 0,
                              child: TransationDbFunction()
                                      .recentTransation
                                      .value
                                      .isEmpty
                                  ? const Center(
                                      child: Text("No data available"),
                                    )
                                  : ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: TransationDbFunction()
                                          .recentTransation
                                          .value
                                          .length,
                                      itemBuilder: (context, index) =>
                                          ClipRRect(
                                        borderRadius: BorderRadius.circular(30),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 18, right: 18, bottom: 15),
                                          child: Slidable(
                                            key: ValueKey(TransationDbFunction()
                                                .recentTransation
                                                .value[index]
                                                .id),
                                            startActionPane: ActionPane(
                                              motion: const ScrollMotion(),
                                              dismissible: null,
                                              children: [
                                                SlidableAction(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  onPressed: (ctx) {
                                                    showDialog(
                                                        context: context,
                                                        builder: (contex) {
                                                          return AlertDialog(
                                                            actions: [
                                                              TextButton(
                                                                  onPressed:
                                                                      () {
                                                                    TransationDbFunction().deleteTRAnsation(
                                                                        id: TransationDbFunction()
                                                                            .recentTransation
                                                                            .value[index]
                                                                            .id);
                                                                    if (index <
                                                                        0) {
                                                                      setState(
                                                                          () {});
                                                                    }

                                                                    Navigator.of(
                                                                            contex)
                                                                        .pop();
                                                                  },
                                                                  child:
                                                                      const Text(
                                                                          'Yes')),
                                                              const SizedBox(
                                                                width: 30,
                                                              ),
                                                              TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.of(
                                                                              contex)
                                                                          .pop(),
                                                                  child:
                                                                      const Text(
                                                                          'No'))
                                                            ],
                                                            title: const Text(
                                                                'Do you want to delete'),
                                                          );
                                                        });
                                                  },
                                                  icon: Icons.delete,
                                                  backgroundColor: Colors.red,
                                                  label: 'DELETE',
                                                ),
                                              ],
                                            ),
                                            child: ListTile(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0)),
                                              tileColor: const Color.fromARGB(
                                                  255, 241, 241, 241),
                                              leading: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: (TransationDbFunction()
                                                            .recentTransation
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
                                                      )),
                                              ),
                                              subtitle: Text(parseDate(
                                                  TransationDbFunction()
                                                      .recentTransation
                                                      .value[index]
                                                      .date)),
                                              title: Text(
                                                TransationDbFunction()
                                                    .recentTransation
                                                    .value[index]
                                                    .category
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontSize: 18),
                                              ),
                                              trailing: Text(
                                                '₹ ${TransationDbFunction().recentTransation.value[index].amount}',
                                                style: const TextStyle(
                                                    fontSize: 19),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ]),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(selectedIndex: 0),
    );
  }
}
