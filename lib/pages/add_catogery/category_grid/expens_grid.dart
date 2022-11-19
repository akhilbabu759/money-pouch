import 'package:flutter/material.dart';

import 'package:moneypouch/db/category/category_db.dart';
import 'package:moneypouch/models/category/category_model.dart';

class ExpenseGrid extends StatefulWidget {
  const ExpenseGrid({super.key});

  @override
  State<ExpenseGrid> createState() => _ExpenseGridState();
}

class _ExpenseGridState extends State<ExpenseGrid> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(valueListenable: CategoryDbFunction().expenseListenable,builder: (BuildContext  ctx, List<CategoryModel> newlIst, Widget? _) => 
       Material(
        color: Color.fromARGB(255, 170, 93, 93),
        child: GridView.builder( itemCount: newlIst.length,
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
                        color: Colors.white,
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