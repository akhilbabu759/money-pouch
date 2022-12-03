 import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:moneypouch/models/category/category_model.dart';
 const categdbname='category_name';

class CategoryDbFunction{
  CategoryDbFunction._internal();
  static CategoryDbFunction instance= CategoryDbFunction._internal();
  factory CategoryDbFunction(){
    return instance;
  }

  Future<List<CategoryModel>> getCategory ()async{
    final categoryDb= await Hive.openBox<CategoryModel>(categdbname);
    return categoryDb.values.toList();
  }
  

  
  Future<void> insertCategory(CategoryModel value) async{
   
    
   final categoryDB= await Hive.openBox<CategoryModel>(categdbname);
  
   await categoryDB.put(value.id,value);
  
    
   

   refreshUI();

    

  }
  ValueNotifier<List<CategoryModel>> incomeListenable=ValueNotifier([]);
   ValueNotifier<List<CategoryModel>> expenseListenable=ValueNotifier([]);
   Future<void>refreshUI()async{
    final allCategories=await getCategory();
    incomeListenable.value.clear();
    expenseListenable.value.clear();
    
   await Future.forEach(allCategories, (CategoryModel category) {
   
      if(category.type==CategoryType.income){
        incomeListenable.value.add(category);
      }else if(category.type==CategoryType.expense){
        expenseListenable.value.add(category);
      }
    });
    incomeListenable.notifyListeners();
    expenseListenable.notifyListeners();

   }
   Future deleteCategory({required id}) async{
    final categoryDb= await Hive.openBox<CategoryModel>(categdbname);
   
    await categoryDb.delete(id);
    refreshUI();
   }

 }