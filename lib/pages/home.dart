import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      appBar: AppBar(),
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(
            height: 70,
          ),
          Text('hai Akhil',
              style: TextStyle(color: Colors.white, fontSize: 19)),
          Card(
            child: Column(children: [
              Text('CURRENT BALANCE'),
              Text('6000'),
            ]),
          ),
          Container(
            color: Colors.white,
            height: 500,
            child: Column(
              children: [
                Text('TRANSACTION',
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                ListTile(
                  leading: Icon(
                    Icons.arrow_downward,
                    color: Colors.red,
                  ),
                  subtitle: Text('November 2'),
                  title: Text('EMI'),
                  trailing: Text('₹ 400'),
                ),
                FloatingActionButton(
                  onPressed: () {},
                  child: Icon(Icons.add),
                )
              ],
            ),
          )
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
        BottomNavigationBarItem(label: 'Category', icon: Icon(Icons.category)),
         BottomNavigationBarItem(label: 'Settings', icon: Icon(Icons.settings))
      ]),
    );
  }
}
