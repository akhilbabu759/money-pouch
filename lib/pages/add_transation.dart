import 'package:flutter/material.dart';
import 'package:moneypouch/pages/Add%20transation%20widget/drop_down.dart';
import 'package:moneypouch/pages/Add%20transation%20widget/tabbar_transation.dart';

import 'Add transation widget/date_pick.dart';

Text tx=Text('Date');

class AddTransation extends StatefulWidget {
  const AddTransation({super.key});

  @override
  State<AddTransation> createState() => _AddTransationState();
}

class _AddTransationState extends State<AddTransation> {
  dynamic hi = 'p';

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0), // here the desired height
        child: AppBar(
            backgroundColor: const Color.fromARGB(213, 20, 27, 38),
            title: const Text(
              'Add Transation',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            )),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              TabbarTransation(),
              SizedBox(
                height: 20,
              ),
              Padding(
                  padding: const EdgeInsets.all(20.0),
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
                      ]),child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: DropdownList(),
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
                    trailing: DatePick(),
                  ),
                ),
              ),
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
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                      // onTap: () =>
                      //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      //       content: Text("SAVED"),
                      //     ))),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

