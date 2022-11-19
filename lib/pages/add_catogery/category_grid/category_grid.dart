

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:moneypouch/db/category/category_db.dart';
import 'package:moneypouch/models/category/category_model.dart';



import '../tabbar_category.dart';


class CategoryGrid extends StatefulWidget {
   const CategoryGrid({Key? key, this.categoryList=const[]}):super(key: key);
  // final Text textCategory;
  final List<CategoryModel> categoryList;

  @override
  State<CategoryGrid> createState() => _CategoryGridState();
}

class _CategoryGridState extends State<CategoryGrid> {
  
  // ValueNotifier<dynamic> catname=ValueNotifier([]);
   
  @override
  void initState() {
    CategoryDbFunction.instance.refreshUI;
  selectListenable();
    
    // print(CategoryDbFunction().incomeListenable.value.length);
    // print(CategoryDbFunction().incomeListenable.value.toList());
    // final CategoryModel a=  CategoryModel(id: 1,name: 'dd',type: CategoryType.expense);
    // CategoryDbFunction().insertCategory(a);
    
    super.initState();
  }
  
   void selectListenable(){
    // categoryCheck.notifyListeners();
    log( categoryCheck.value.toString());
    if(categoryCheck.value==1)
    {
      // catname.value.add( CategoryDbFunction().incomeListenable.value);
      // catname.value.add(catname.value.toString());
      //  itemCount=CategoryDbFunction().incomeListenable.value.length;
       
    }
   
    
    
    
    
  }
  // @override
  // setState(() {
      
  //   });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(valueListenable: CategoryDbFunction.instance.incomeListenable  ,builder: (BuildContext ctx, List<CategoryModel> newlIst, Widget? _) => 
       Material(
        color: const Color.fromARGB(255, 238, 236, 236),
        child: GridView.builder( itemCount:CategoryDbFunction.instance.incomeListenable.value.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            crossAxisCount:3,
          ),
          shrinkWrap: true,
          itemBuilder: (context, index) =>
            Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 224, 224, 224),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(255, 158, 158, 158),
                        blurRadius: 15,
                        offset: Offset(5, 5),
                      ),
                      BoxShadow(
                        color: Color.fromARGB(255, 236, 234, 234),
                        blurRadius: 15,
                        offset: Offset(-5, -5),
                      ),
                    ]),
                child:  Card(
                    color: const Color.fromARGB(255, 214, 214, 214),
                    child: Center(
                        child: TextButton(onPressed: () {
                          
                          
                        },onLongPress: () {
                          showDialog(
                  context: context,
                  builder: (contex) {
                    return AlertDialog(
                      actions: [TextButton(onPressed: () { 
                        // log(newlIst[index].id.toString());
                       CategoryDbFunction().deleteCategory(id: newlIst[index].id);
                       Navigator.of(contex).pop();},child: const Text('yes')),const SizedBox(width: 30,),
                          TextButton(onPressed: () => Navigator.of(contex).pop(),child: const Text('no'))
                      ],
                      title:  const Text('Do you want to delete'),
                      content: Text(newlIst[index].name)
                    );
                  });
            },
    
                          //delete function
                        
                          child: Text(newlIst[index].name 
                                            ,
                                            style: const TextStyle(
                            color: Color.fromARGB(221, 49, 42, 42),
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontStyle: FontStyle.italic),
                                          ),
                        )))),
            
        ),
      ),
    );
  }
}
