import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TabbarCategory extends StatefulWidget {
  const TabbarCategory({super.key});

  @override
  State<TabbarCategory> createState() => _TabbarCategoryState();
}

class _TabbarCategoryState extends State<TabbarCategory> {
  late Color col;
  late Color cole;

  @override
  void initState() {
    col = Color.fromARGB(255, 144, 237, 237);
    cole = Color.fromARGB(255, 214, 214, 214);
    super.initState();
  }

  void change(value) {
    if (value == 1) {
      setState(() {
        col = Color.fromARGB(255, 144, 237, 237);
        cole = Color.fromARGB(255, 214, 214, 214);
      });
    } else if (value == 2) {
      setState(() {
        col = Color.fromARGB(255, 214, 214, 214);
        cole = Color.fromARGB(255, 144, 237, 237);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color.fromARGB(255, 238, 236, 236),
      child: Row(
        children: [
          SizedBox(
            width: 20,
          ),
          Container(
            width: 150,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: col,
               boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(255, 158, 158, 158),
                      blurRadius: 15,
                      offset: Offset(5, 5),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      blurRadius: 15,
                      offset: Offset(-5, -5),
                    ),
                  ]
            ),
            child: Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              semanticContainer: true,
              elevation: 0,
              // margin: EdgeInsets.only(
              //   top: 50,
              //   right: 30,
              // ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              color: col,
              child: TextButton(
                child: Text('INCOME',style: TextStyle(color: Colors.black,fontSize: 18),),
                onPressed: () {
                  change(1);
                },
              ),
            ),
          ),
          SizedBox(
            width: 50,
          ),
          Container(
            width: 150,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: cole,
               boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(255, 158, 158, 158),
                      blurRadius: 15,
                      offset: Offset(5, 5),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      blurRadius: 15,
                      offset: Offset(-5, -5),
                    ),
                  ]
            ),
            child: Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              semanticContainer: true,
              elevation: 0,
              // margin: EdgeInsets.only(
              //   top: 50,
              //   right: 30,
              // ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              color: cole,
              child: TextButton(
                child: Text('EXPENSE',style: TextStyle(color: Colors.black,fontSize: 18),),
                onPressed: () {
                  change(2);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
