import 'package:flutter/material.dart';
import 'package:moneypouch/pages/add_category.dart';
import 'package:moneypouch/pages/settings.dart';

import 'bottom_navigator/bottom_navigator.dart';
import 'home.dart';

class ScreenMAinPage extends StatelessWidget {
  ScreenMAinPage({super.key});
  final page = [
    const Home(),
    const AddCatogery(isFromBottomNav: true),
    const Settings()
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: ValueListenableBuilder(
          valueListenable: selectedIndex,
          builder: (context, int index, _) { return page[selectedIndex.value];}),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
