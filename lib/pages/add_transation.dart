import 'package:flutter/material.dart';

import 'package:moneypouch/pages/add_transation_widget/form.dart';

Text tx = const Text('Date');

class AddTransation extends StatefulWidget {
  const AddTransation({super.key});

  @override
  State<AddTransation> createState() => _AddTransationState();
}

class _AddTransationState extends State<AddTransation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
            backgroundColor: const Color.fromARGB(213, 20, 27, 38),
            title: const Text(
              'Add Transation',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            )),
      ),
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          initialIndex: 0,
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                height: 65,
                child: TabBar(
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
                  onTap: (value) {},
                  indicatorColor: Colors.transparent,
                  labelColor: Colors.green,
                  unselectedLabelColor: Colors.black,
                  tabs: const [
                    Text(
                      'INCOME',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    Text(
                      'EXPENSE',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ],
                ),
              ),
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 18.0, left: 1, right: 1),
                  child: TabBarView(children: [
                    FormTransation(isIncome: true),
                    FormTransation(isIncome: false)
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
