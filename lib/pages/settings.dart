import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:moneypouch/db/chart_function/graph_function.dart';
import 'package:moneypouch/db/transation_db/transation_db.dart';
import 'package:moneypouch/models/category/category_model.dart';
import 'package:moneypouch/models/transation_model/transation_model.dart';
import 'package:moneypouch/pages/settings_widget/about.dart';

import 'package:moneypouch/pages/splash_screen.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import 'bottom_navigator/bottom_navigator.dart';
import 'grapgh/graph.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  void initState() {
    filterFunction();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0), // here the desired height
        child: AppBar(
            centerTitle: true,
            backgroundColor: const Color.fromARGB(210, 22, 27, 35),
            title: const Text(
              'Settings',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            )),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 1),
          child: Column(
            children: [
              ListTile(
                minLeadingWidth: 1,
                leading: const Icon(Icons.bar_chart, size: 30),
                title: Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Graphs(),
                        ));
                      },
                      child: const Text('Status',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20)),
                    ),
                  ],
                ),
              ),
              ListTile(
                minLeadingWidth: 1,
                leading: const Icon(Icons.restore, size: 30),
                title: Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (contex) {
                              return AlertDialog(
                                actions: [
                                  TextButton(
                                      onPressed: () async {
                                        SharedPreferences prefs =
                                            await SharedPreferences
                                                .getInstance();
                                        await prefs.clear();
                                        SharedPreferences tectcontrol =
                                            await SharedPreferences
                                                .getInstance();
                                        await tectcontrol.clear();
                                        final transationDb =
                                            await Hive.openBox<TransationModel>(
                                                'transationDb');
                                        final categorydb =
                                            await Hive.openBox<CategoryModel>(
                                                'category_name');

                                        categorydb.clear();
                                        transationDb.clear();
                                        TransationDbFunction().totalExpenseNotifer=ValueNotifier(0);
                                        TransationDbFunction().totalIncomeNotifer=ValueNotifier(0);
                                        TransationDbFunction().totalAmountNotifer=ValueNotifier(0);
                                         TransationDbFunction().totalExpenseNotifer.notifyListeners();
                                         TransationDbFunction().totalIncomeNotifer.notifyListeners();
                                         TransationDbFunction().totalAmountNotifer.notifyListeners();

                                        Navigator.of(context)
                                            .pushReplacement(MaterialPageRoute(
                                          builder: (context) => const Splash(),
                                        ));

                                       
                                      },
                                      child: const Text('Yes')),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  TextButton(
                                      onPressed: () =>
                                          Navigator.of(contex).pop(),
                                      child: const Text('No'))
                                ],
                                title: const Text('Do you want to restart'),
                              );
                            });
                      },
                      child: const Text('App reset',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20)),
                    ),
                  ],
                ),
              ),
              ListTile(
                minLeadingWidth: 1,
                leading: const Icon(Icons.help_outline, size: 30),
                title: Row(
                  children: [
                    TextButton(
                      onPressed: () {
                           launchUr(Uri.parse('mailto:akhilb4001@gmail.com?subject=Help me&body=need help'));
                      },
                      child: const Text('Help',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20)),
                    ),
                  ],
                ),
              ),
              ListTile(
                minLeadingWidth: 1,
                leading: const Icon(Icons.info_outline, size: 30),
                title: Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        //  About();
                         showDialog<String>(
        context: context,
        builder: (BuildContext context) => Padding(
          padding: const EdgeInsets.only(bottom:320.0),
          child: AlertDialog(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: const Text('About'),
            
            content: const AboutDialogWidget(),
            actions: <Widget>[
              
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        ),
      );
                        
                      },
                      child: const Text('About',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20)),
                    ),
                  ],
                ),
              ),
              ListTile(
                minLeadingWidth: 1,
                leading: const Icon(
                  Icons.share,
                  size: 30,
                ),
                title: Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text('Invite',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20)),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 340,
              ),
              const Text('version 1.1')
            ],
          ),
        )),
      ),
      // bottomNavigationBar: BottomNavigation(selectedIndex: 2),
    );
  }
  Future<void> launchUr(Uri url) async {
    if (!await launchUrl(url)) {
      throw 'Could not launch ';
    }
  }
}


