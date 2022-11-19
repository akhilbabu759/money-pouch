import 'package:flutter/material.dart';


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
    return DefaultTabController(length: 3,child:Scaffold( appBar: AppBar(
      bottom: TabBar(
        tabs: [
          DropdownButton(dropdownColor: const Color.fromARGB(213, 20, 27, 38),
            style: const TextStyle(color: Color.fromARGB(255, 144, 237, 237),fontSize: 19),
               
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
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
            ),
          const Text('Today',style: TextStyle(fontSize: 25),),
          const Text('Monthly',style: TextStyle(fontSize: 25),),
        ],
      ),

            backgroundColor: const Color.fromARGB(213, 20, 27, 38),
            title: const Text(
              'All Transation',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            )),

    
    body: Padding(
      padding: const EdgeInsets.only(top: 50),
      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 5,
                          itemBuilder: (context, index) => ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 18,right: 18,bottom: 15),
                              child: ListTile(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                tileColor:
                                    const Color.fromARGB(255, 241, 241, 241),
                                leading: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.arrow_downward,
                                    color: Colors.red,
                                  ),
                                ),
                                subtitle: const Text('2 Nov 22'),
                                title: const Text('EMI',style: TextStyle(fontSize:18),),
                                trailing: const Text('₹ 400',style: TextStyle(fontSize: 19),),
                              ),
                            ),
                          ),
                        ),
    ),));
  }
}