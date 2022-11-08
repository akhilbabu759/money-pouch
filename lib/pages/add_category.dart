import 'package:flutter/material.dart';
import 'package:moneypouch/pages/add%20catogery/category-grid.dart';
import 'package:moneypouch/pages/home.dart';
import 'package:moneypouch/pages/settings.dart';

class AddCatogery extends StatefulWidget {
  const AddCatogery({super.key});

  @override
  State<AddCatogery> createState() => _AddCatogeryState();
}

class _AddCatogeryState extends State<AddCatogery> {
  List choices = [Home(), AddCatogery(),Settings()];
  dynamic hi = 'p';
  int _selectedIndex = 1;
  void _onItemTapped(int index) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => choices[index]));
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {},
        ),
        backgroundColor: Color.fromARGB(255, 238, 236, 236),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(78.0), // here the desired height
          child: AppBar(
              leading: Container(),
              backgroundColor: Color.fromARGB(213, 20, 27, 38),
              title: Text(
                'Add Category',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              )),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 29,
                    ),
                    Text(
                      'INCOME',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Expanded(
                      child: RadioListTile(
                          value: 'p',
                          groupValue: hi,
                          onChanged: ((value) {
                            setState(() {
                              hi = value;
                            });
                          })),
                    ),
                    Text('EXPENSE',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                    Expanded(
                      child: RadioListTile(
                          value: 'd',
                          groupValue: hi,
                          onChanged: ((value) {
                            setState(() {
                              hi = value;
                            });
                          })),
                    )
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: CategoryGrid(),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            onTap: _onItemTapped,
            unselectedItemColor: Colors.white,
            selectedItemColor: Color.fromARGB(255, 7, 255, 255),
            backgroundColor: Color.fromARGB(213, 20, 27, 38),
            currentIndex: _selectedIndex,
            items: const [
              BottomNavigationBarItem(
                  label: 'Home',
                  icon: Icon(
                    Icons.home,
                  )),
              BottomNavigationBarItem(
                  label: 'Category',
                  icon: Icon(
                    Icons.category,
                  )),
              BottomNavigationBarItem(
                  label: 'Settings',
                  icon: Icon(
                    Icons.settings,
                  ))
            ]));
  }
}
