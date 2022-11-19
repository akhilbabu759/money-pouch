import 'dart:developer';


import 'package:flutter/material.dart';
import 'package:moneypouch/db/category/category_db.dart';
import 'package:moneypouch/models/category/category_model.dart';
import 'package:moneypouch/pages/add_catogery/category_grid/category_grid.dart';
import 'package:moneypouch/pages/add_catogery/category_grid/expens_grid.dart';
import 'package:moneypouch/pages/add_catogery/tabbar_category.dart';
import 'package:moneypouch/pages/home.dart';
import 'package:moneypouch/pages/settings.dart';

import 'add_catogery/new_tab.dart';

final PageController controller = PageController();
void callPageViewNotifi()
{
  // _AddCatogeryState a=new _AddCatogeryState();
  // a.initState();
  categoryCheck.notifyListeners();
  indexForGrid.notifyListeners();
}

ValueNotifier<int> indexForGrid = ValueNotifier(0);
// ValueNotifier<CategoryType> typeAdd=ValueNotifier(CategoryType.income);

class AddCatogery extends StatefulWidget {
   AddCatogery({super.key});
  bool isIncome = true;
  int selectedIndex = 1;

  @override
  State<AddCatogery> createState() => _AddCatogeryState();
}

class _AddCatogeryState extends State<AddCatogery> {
  ValueNotifier<CategoryType> typeAdd=ValueNotifier(CategoryType.income);
  
//  late final PageControl;
  @override
  void initState() {
   CategoryDbFunction.instance.refreshUI();
    // if (categoryCheck.value == 1) {
    //   // indexForGrid = ValueNotifier(0);
    //   typeAdd=ValueNotifier(CategoryType.income);
      
    // } else {
    //   // indexForGrid = ValueNotifier(1);
    //   typeAdd=ValueNotifier(CategoryType.expense);
    // }
    super.initState();
  }
  void typeAddSelect(){
    setState(() {
      
      if (obj.isIncome == true) {
        // _selectedIndex=_selectedIndex*0;
        // _selectedIndex=1;
        CategoryDbFunction.instance.refreshUI();
       
      // typeAdd=ValueNotifier(CategoryType.income);
      }else{
        //  _selectedIndex=_selectedIndex*0;
        // _selectedIndex=2;
        CategoryDbFunction.instance.refreshUI();
        
        // typeAdd=ValueNotifier(CategoryType.expense);
      }
    });

  }
 List ah=[ CategoryGrid(),const ExpenseGrid()];

  List choices = [const Home(),  AddCatogery(), const Settings()];
  dynamic hi = 'p';
  
  void _onItemTapped(int index) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => choices[index]));
  }

  @override
  Widget build(BuildContext context) {
    return 
    
      ValueListenableBuilder(valueListenable: categoryCheck,builder: (BuildContext ctx, valindexForGridue, Widget?_) => 
          Scaffold(
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                typeAddSelect();
                showDialog( 
                    context: context,
                    builder: (ctx) {
                      var textcontrol = TextEditingController();
                      var val;
                      return AlertDialog(
                        actions: [
                          OutlinedButton(
                              onPressed: () async {
                                final _catego;
           
                                if (val.isEmpty) {
                                  return;
                                  // return print('not');
                                } else {
                                  log(val);
                                  _catego = CategoryModel(
                                      name: val,
                                      type: typeAdd.value,
                                      id: DateTime.now().millisecondsSinceEpoch);
                                }
                                CategoryDbFunction.instance.insertCategory(_catego);
                                Navigator.of(ctx).pop();
                              },
                              child: const Text('Submit'))
                        ],
                        title: const Text('Add Category'),
                        content: TextField(
                          controller: textcontrol,
                          onChanged: (value) {
                            // print(textcontrol.text);
                            val = value;
                          },
                          // decoration:
                          //     const InputDecoration(hintText: "Enter Category"),
                        ),
                      );
                    });
              },
            ),
            backgroundColor: const Color.fromARGB(255, 238, 236, 236),
            appBar: PreferredSize(
                preferredSize:
                    const Size.fromHeight(60.0), // here the desired height
                child: AppBar(
                    backgroundColor: const Color.fromARGB(213, 20, 27, 38),
                    title: const Text(
                      'Add Category',
                      style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ))),
            body: SafeArea(
              child: DefaultTabController(
            length: 2, // length of tabs
            initialIndex: 0,
            child: Column(
              children: [SizedBox(height: 25,),
                Container(height: 65,
                  child: TabBar(
                    indicator:BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color:Color.fromARGB(255, 144, 237, 237) ,
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
                  ),onTap: (value) {
                    // print(value);
                    setState(() {
                      if(value==0){
                        obj.isIncome=true;
                         typeAdd=ValueNotifier(CategoryType.income);
                      }else{
                        obj.isIncome=false;
                         typeAdd=ValueNotifier(CategoryType.expense);
                      }
                    });
                  },
                    indicatorColor: Colors.transparent,
                    labelColor: Colors.green,
                    unselectedLabelColor: Colors.black,
                    tabs: [
                  Text('INCOME',style: TextStyle(color: Colors.black,fontSize: 18),),
                  Text('EXPENSE',style: TextStyle(color: Colors.black,fontSize: 18),)
                  
                    
                     ,
                     ],
                  ),
                ),
              //  Padding(
              //    padding: const EdgeInsets.all(778.0),
              //    child: TabBarView(children: [CategoryGrid(),Text('hh')]),
              //  )],
              Expanded(child: Padding(
                padding: const EdgeInsets.only(top:18.0,left: 18,right: 18),
                child: TabBarView(children: [CategoryGrid(),ExpenseGrid()]),
              ))
              ]
            ),)),
            bottomNavigationBar: BottomNavigationBar(
                onTap: _onItemTapped,
                unselectedItemColor: Colors.white,
                selectedItemColor: const Color.fromARGB(255, 7, 255, 255),
                backgroundColor: const Color.fromARGB(213, 20, 27, 38),
                currentIndex:obj. selectedIndex,
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
                ]),
           ),
       );
  }
}

AddCatogery obj=AddCatogery();
