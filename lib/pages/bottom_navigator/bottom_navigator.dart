import 'package:flutter/material.dart';

import 'package:moneypouch/pages/add_category.dart';
import 'package:moneypouch/pages/home.dart';
import 'package:moneypouch/pages/settings.dart';
 ValueNotifier< int> selectedIndex= ValueNotifier(0);
class BottomNavigation extends StatefulWidget {
   BottomNavigation({
    Key? key,
     
  }) : super(key: key);
 

  @override
  State<BottomNavigation> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<BottomNavigation> {
  // List bottomNavigChoices = [
  //   const Home(),
  //   const AddCatogery(isFromBottomNav: true),
  //   const Settings()
  // ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = ValueNotifier(index);
    });

    // Navigator.pushReplacement(context,
    //     MaterialPageRoute(builder: (context) => bottomNavigChoices[index]));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ValueListenableBuilder(valueListenable:selectedIndex ,builder: (context, values, child) => 
        BottomNavigationBar(
            unselectedItemColor: Colors.white,
            backgroundColor: const Color.fromARGB(210, 22, 27, 35),
            onTap: (value)async {
               selectedIndex.value=value;
            // selectedIndex.notifyListeners();},
            },
            currentIndex: selectedIndex.value,
            selectedItemColor: const Color.fromARGB(255, 7, 255, 255),
            items: const [
              BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
              BottomNavigationBarItem(
                  label: 'Category', icon: Icon(Icons.category)),
              BottomNavigationBarItem(
                  label: 'Settings', icon: Icon(Icons.settings))
            ]),
      ),
    );
  }
}
