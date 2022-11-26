import 'package:flutter/material.dart';
import 'package:moneypouch/pages/add_transation_widget/drop_down.dart';
import 'package:moneypouch/pages/add_transation_widget/form.dart';
import 'package:moneypouch/pages/add_transation_widget/tabbar_transation.dart';

import 'add_transation_widget/date_pick.dart';

Text tx = const Text('Date');

class AddTransation extends StatefulWidget {
  const AddTransation({super.key});

  @override
  State<AddTransation> createState() => _AddTransationState();
}

class _AddTransationState extends State<AddTransation> {
  // var isIncome=true;

 
  @override
  Widget build(BuildContext context) {
    return Scaffold( resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0), // here the desired height
        child: AppBar(
            backgroundColor: const Color.fromARGB(213, 20, 27, 38),
            title: const Text(
              'Add Transation',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            )),
      ),
      body: SafeArea(
        child: DefaultTabController(
          length: 2, // length of tabs
          initialIndex: 0,
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              Container(
                height: 65,
                child: TabBar(
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color.fromARGB(255, 144, 237, 237),
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
                  onTap: (value) {
                    // print(value);
                    // setState(() {
                    //   if(value==0){
                    //     isIncome=true;
                    //     // obj.isIncome=true;
                    //     //  typeAdd=ValueNotifier(CategoryType.income);
                    //   }else{
                    //     isIncome=false;
                    //     // obj.isIncome=false;
                    //     //  typeAdd=ValueNotifier(CategoryType.expense);
                    //   }
                    // });
                  },
                  indicatorColor: Colors.transparent,
                  labelColor: Colors.green,
                  unselectedLabelColor: Colors.black,
                  tabs: [
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
              //  Padding(
              //    padding: const EdgeInsets.all(778.0),
              //    child: TabBarView(children: [CategoryGrid(),Text('hh')]),
              //  )],
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 18.0, left: 1, right: 1),
                  child: TabBarView(
                      children: [
                        // Text('hj'),Text('jio')
                        FormTransation(isIncome:true),
                         FormTransation(isIncome:false)
                         ]),
                ),
              ),
              // const SizedBox(
              //   height: 20,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
