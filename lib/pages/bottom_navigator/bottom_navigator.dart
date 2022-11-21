import 'package:flutter/material.dart';


import 'package:moneypouch/pages/add_category.dart';
import 'package:moneypouch/pages/home.dart';
import 'package:moneypouch/pages/settings.dart';

class BottomNavigation extends StatefulWidget {
  BottomNavigation({
    Key? key,
     required this.selectedIndex,
  });
  int selectedIndex=0 ;
  

  @override
  State<BottomNavigation> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<BottomNavigation> {
  List bottomNavigChoices = [const Home(), AddCatogery(), const Settings()];
  
 @override
  
  
  void _onItemTapped(int index) {
    print(obj.selectedIndex);
    setState(() {
      obj.selectedIndex = index;
    });
    print(obj.selectedIndex);
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => bottomNavigChoices[index]));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: BottomNavigationBar(
          unselectedItemColor: Colors.white,
          backgroundColor: const Color.fromARGB(210, 22, 27, 35),
          onTap: _onItemTapped,
          currentIndex: obj.selectedIndex,
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
