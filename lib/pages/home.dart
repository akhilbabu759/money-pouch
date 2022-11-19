import 'package:flutter/material.dart';
import 'package:moneypouch/pages/add_category.dart';
import 'package:moneypouch/pages/add_transation.dart';
import 'package:moneypouch/pages/settings.dart';

import 'view_all _transation/view_all_transation.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List choices = [const Home(),  AddCatogery(), const Settings()];
  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Morning';
    }
    if (hour < 17) {
      return 'Afternoon';
    }
    return 'Evening';
  }

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => choices[index]));
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: ((context) => const AddTransation())));
          },
          child: const Icon(Icons.add)),
      backgroundColor: const Color.fromARGB(213, 20, 27, 38),
      body: SingleChildScrollView(
        child: SafeArea(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 170),
              child: Text(
                'good ${greeting()}' ,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    fontStyle: FontStyle.italic),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(' Akhil',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 29,
                    fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.all(17.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35.0)),
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    children: [
                      const Text(
                        'CURRENT BALANCE',
                        style: TextStyle(
                             fontSize: 25),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        '6000',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 13,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('INCOME',
                              style: TextStyle(fontSize:19,)),
                          Icon(
                            Icons.arrow_upward,
                            color: Colors.green,
                          ),
                          SizedBox(width: 50,),
                          Icon(Icons.arrow_downward, color: Colors.red),
                          Padding(
                            padding: EdgeInsets.only(right: 1),
                            child: Text(
                              'EXPENSE',
                              style: TextStyle(fontSize:19,),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 9,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('₹ 5000', style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500)),
                          Text(
                            '₹ 1000',
                            style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),
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
              height: 440,
              child: Column(
                children: [
                   Padding(
                    padding: EdgeInsets.only( top:20,left: 10,right: 10,bottom: 20),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Recent Transation',
                            style:
                                TextStyle(fontSize: 20, )),
                       TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ViewAllTransation(),));
                      },
                      child: const Text(
                        'view all',
                        style: TextStyle(color: Colors.blue),
                      ))],
                    ),
                  )
                 ,
                  Expanded(
                    child: Card(
                      elevation: 0,
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
                    ),
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.white,
          backgroundColor: const Color.fromARGB(212, 49, 54, 62),
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
          selectedItemColor: const Color.fromARGB(255, 7, 255, 255),
          items: const [
            BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
            BottomNavigationBarItem(
                label: 'Category', icon: Icon(Icons.category)),
            BottomNavigationBarItem(
                label: 'Settings', icon: Icon(Icons.settings))
          ]),
    );
  }
}
