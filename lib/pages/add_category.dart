import 'package:flutter/material.dart';
import 'package:moneypouch/pages/add%20catogery/category_grid.dart';
import 'package:moneypouch/pages/add%20catogery/tabbar_category.dart';
import 'package:moneypouch/pages/home.dart';
import 'package:moneypouch/pages/settings.dart';

class AddCatogery extends StatefulWidget {
  const AddCatogery({super.key});

  @override
  State<AddCatogery> createState() => _AddCatogeryState();
}

class _AddCatogeryState extends State<AddCatogery> {
  List choices = [const Home(), const AddCatogery(), const Settings()];
  dynamic hi = 'p';
  int _selectedIndex = 1;
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
          child: const Icon(Icons.add),
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    actions: [
                      OutlinedButton(
                          onPressed: () {}, child: const Text('Submit'))
                    ],
                    title: const Text('Add Category'),
                    content: TextField(
                      onChanged: (value) {},
                      // decoration:
                      //     const InputDecoration(hintText: "Enter Category"),
                    ),
                  );
                });
          },
        ),
        backgroundColor: const Color.fromARGB(255, 238, 236, 236),
        appBar:PreferredSize(
        preferredSize: const Size.fromHeight(60.0), // here the desired height
        child:
         AppBar(

            backgroundColor: const Color.fromARGB(213, 20, 27, 38),
            title: const Text(
              'Add Category',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ))),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                const SizedBox(
                  height: 37,
                ),
                TabbarCategory(),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.all(18.0),
                  child: CategoryGrid(),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            onTap: _onItemTapped,
            unselectedItemColor: Colors.white,
            selectedItemColor: const Color.fromARGB(255, 7, 255, 255),
            backgroundColor: const Color.fromARGB(213, 20, 27, 38),
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
