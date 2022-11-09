import 'package:flutter/material.dart';

import 'package:moneypouch/pages/splash_screen.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'add_category.dart';
import 'home.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  List choices = [const Home(), const AddCatogery(), const Settings()];

  int _selectedIndex = 2;
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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(78.0), // here the desired height
        child: AppBar(  
            leading: Container(),
            backgroundColor: const Color.fromARGB(210, 22, 27, 35),
            title: const Text(
              'Settings',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            )),
      ),
      // backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 40,left: 15),
              child: Column(
          children: [
              const ListTile(
                leading:
                    Icon(Icons.bar_chart, size: 40),
                title: Text('Status',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold,fontSize: 20)),
              ),ListTile(
                leading:
                    IconButton(onPressed: ()async { SharedPreferences prefs = await SharedPreferences.getInstance();
                    await prefs.clear();
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) =>const Splash(),));} ,icon:const Icon(Icons.restore, size: 40)),
                title: const Text('Factory reset',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold,fontSize: 20)),
              ),const ListTile(
                leading:
                    Icon(Icons.help_outline, size: 40),
                title: Text('Help',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold,fontSize: 20)),
              ),const ListTile(
                leading:
                    Icon(Icons.info_outline, size: 40),
                title: Text('About',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold,fontSize: 20)),
              ),const ListTile(
                leading:
                    Icon(Icons.share, size: 40),
                title: Text('Invite',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold,fontSize: 20)),
              ),const SizedBox(height: 250,),
          const Text('version 1.1')],
        ),
            )),
      ),
      bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.white,
          backgroundColor: const Color.fromARGB(210, 22, 27, 35),
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
