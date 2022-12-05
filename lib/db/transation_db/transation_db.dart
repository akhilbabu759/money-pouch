

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:moneypouch/models/transation_model/transation_model.dart';

const transationDbName = 'transationDb';

class TransationDbFunction {
  TransationDbFunction._internal();
  static TransationDbFunction instance = TransationDbFunction._internal();
  factory TransationDbFunction() {
    return instance;
  }

  Future<void> insertTransation(TransationModel value) async {
    final transationDb = await Hive.openBox<TransationModel>(transationDbName);
     await transationDb.put(value.id,value);
    // value.id = id;

    
    refreshUI();
  }

  Future<List<TransationModel>> getTransation() async {
    final transationDb = await Hive.openBox<TransationModel>(transationDbName);
    return transationDb.values.toList();
  }

  ValueNotifier<List<TransationModel>> recentTransation = ValueNotifier([]);
  ValueNotifier<List<TransationModel>> incomeListenable = ValueNotifier([]);
  ValueNotifier<List<TransationModel>> expenseListenable = ValueNotifier([]);
  ValueNotifier<List<TransationModel>> transationAll = ValueNotifier([]);
  ValueNotifier<int> totalAmountNotifer = ValueNotifier(0);
  ValueNotifier<int> totalIncomeNotifer = ValueNotifier(0);
  ValueNotifier<int> totalExpenseNotifer = ValueNotifier(0);

  Future<void> refreshUI() async {
    final allTRansation = await getTransation();
    incomeListenable.value.clear();
    expenseListenable.value.clear();
    transationAll.value.clear();
    recentTransation.value.clear();
    
    var totalAmountVarible = 0;
    var totalIncomeVarible = 0;
    var totalExpenseVarible = 0;
    await Future.forEach(allTRansation, (TransationModel transation) {
    
      
      if (transation.isIncome == true) {
        incomeListenable.value.add(transation);
        totalAmountVarible = totalAmountVarible + transation.amount;
        totalIncomeVarible = totalIncomeVarible + transation.amount;
      } else if (transation.isIncome == false) {
        expenseListenable.value.add(transation);
        totalAmountVarible = totalAmountVarible - transation.amount;
        totalExpenseVarible = totalExpenseVarible + transation.amount;
      }
      totalAmountNotifer = ValueNotifier(totalAmountVarible);
      totalExpenseNotifer = ValueNotifier(totalExpenseVarible);
      totalIncomeNotifer = ValueNotifier(totalIncomeVarible);
      totalExpenseNotifer.notifyListeners();
      totalIncomeNotifer.notifyListeners();
      totalAmountNotifer.notifyListeners();
    });
    incomeListenable.notifyListeners();
    expenseListenable.notifyListeners();

    await Future.forEach(allTRansation.reversed, (TransationModel transations) {
      if (recentTransation.value.length <= 5) {
        recentTransation.value.add(transations);
      }
      transationAll.value.add(transations);

      recentTransation.notifyListeners();
      transationAll.notifyListeners();
      
    });
  }

  Future deleteTRAnsation({required id}) async {
    final categoryDb = await Hive.openBox<TransationModel>(transationDbName);
    
    await categoryDb.delete(id);
    recentTransation.notifyListeners();
    refreshUI();
  }
}
