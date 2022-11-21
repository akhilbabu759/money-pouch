import 'package:flutter/material.dart';

import 'package:moneypouch/pages/splash_screen.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'add_category.dart';
import 'bottom_navigator/bottom_navigator.dart';
import 'home.dart';
import 'statistic/statistic.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
 

  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0), // here the desired height
        child: AppBar(
            backgroundColor: const Color.fromARGB(210, 22, 27, 35),
            title: const Text(
              'Settings',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            )),
      ),
      // backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 1),
          child: Column(
            children: [
               ListTile(
                leading: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Statistic(),));
                    }, icon: const Icon(Icons.bar_chart, size: 30)),
                title: const Text('Status',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
              ),
              ListTile(
                leading: IconButton(
                    onPressed: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      await prefs.clear();
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Splash(),
                      ));
                    },
                    icon: const Icon(Icons.restore, size: 30)),
                title: const Text('App reset',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
              ),
               ListTile(
                leading: IconButton(
                    onPressed: () {}, icon:const Icon(Icons.help_outline, size: 30)),
                title: const Text('Help',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
              ),
               ListTile(
                leading: IconButton(
                    onPressed: () {}, icon:const Icon(Icons.info_outline, size: 30),),
                title: const Text('About',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
              ),
               ListTile(
                leading: IconButton(
                    onPressed: () {}, icon:const Icon(Icons.share, size: 30)),
                title: const Text('Invite',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
              ),
              const SizedBox(
                height: 340,
              ),
              const Text('version 1.1')
            ],
          ),
        )),
      ),
      bottomNavigationBar:BottomNavigation(selectedIndex: 2),
    );
  }
}
