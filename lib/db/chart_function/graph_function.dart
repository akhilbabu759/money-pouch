import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:moneypouch/db/transation_db/transation_db.dart';
import 'package:moneypouch/models/category/category_model.dart';
import 'package:moneypouch/models/transation_model/transation_model.dart';

ValueNotifier<List<TransationModel>> overviewNotifier = ValueNotifier([]);
ValueNotifier<List<TransationModel>> incomeNotifier = ValueNotifier([]);

ValueNotifier<List<TransationModel>> expenseNotifier = ValueNotifier([]);

ValueNotifier<List<TransationModel>> todayNotifier = ValueNotifier([]);

ValueNotifier<List<TransationModel>> yesterdayNotifier = ValueNotifier([]);

ValueNotifier<List<TransationModel>> incomeTodayNotifier = ValueNotifier([]);

ValueNotifier<List<TransationModel>> incomeYesterdayNotifier =
    ValueNotifier([]);

ValueNotifier<List<TransationModel>> expenseTodayNotifier = ValueNotifier([]);

ValueNotifier<List<TransationModel>> expenseYesterdayNotifier =
    ValueNotifier([]);
ValueNotifier<List<TransationModel>> lastWeekNotifier = ValueNotifier([]);

ValueNotifier<List<TransationModel>> incomeLastWeekNotifier =
    ValueNotifier([]);

ValueNotifier<List<TransationModel>> expenseLastWeekNotifier =
    ValueNotifier([]);

ValueNotifier<List<TransationModel>> lastMonthNotifier = ValueNotifier([]);

ValueNotifier<List<TransationModel>> incomeLastMonthNotifier =
    ValueNotifier([]);

ValueNotifier<List<TransationModel>> expenseLastMonthNotifier =
    ValueNotifier([]);

String today = DateFormat.yMd().format(
  DateTime.now(),
);
String yesterday = DateFormat.yMd().format(
  DateTime.now().subtract(
    const Duration(days: 1),
  ),
);


filterFunction() async {
  final list = await TransationDbFunction.instance.getTransation();
  overviewNotifier.value.clear();
  incomeNotifier.value.clear();
  expenseNotifier.value.clear();
  todayNotifier.value.clear();
  yesterdayNotifier.value.clear();
  incomeTodayNotifier.value.clear();
  incomeYesterdayNotifier.value.clear();
  expenseTodayNotifier.value.clear();
  expenseYesterdayNotifier.value.clear();
  lastWeekNotifier.value.clear();
  expenseLastWeekNotifier.value.clear();
  incomeLastWeekNotifier.value.clear();
  lastMonthNotifier.value.clear();
  expenseLastMonthNotifier.value.clear();
  incomeLastMonthNotifier.value.clear();

  for (var element in list) {
    if (element.isIncome == true) {
      incomeNotifier.value.add(element);
    } else if (element.isIncome == false) {
      expenseNotifier.value.add(element);
    }
    overviewNotifier.value.add(element);
  }

  for (var element in list) {
    String elementDate = DateFormat.yMd().format(element.date);
    if (elementDate == today) {
      todayNotifier.value.add(element);
    }

    if (elementDate == yesterday) {
      yesterdayNotifier.value.add(element);
    }
    if (element.date.isAfter(
      DateTime.now().subtract(
        const Duration(days: 7),
      ),
    )) {
      lastWeekNotifier.value.add(element);
    }

    if (element.date.isAfter(
      DateTime.now().subtract(
        const Duration(days: 30),
      ),
      // selectedGrapMonth
    )) {
      lastMonthNotifier.value.add(element);
    }

    if (elementDate == today && element.isIncome == true) {
      incomeTodayNotifier.value.add(element);
    }

    if (elementDate == yesterday && element.isIncome == true) {
      incomeYesterdayNotifier.value.add(element);
    }

    if (elementDate == today && element.isIncome == false) {
      expenseTodayNotifier.value.add(element);
    }

    if (elementDate == yesterday && element.isIncome == false) {
      expenseYesterdayNotifier.value.add(element);
    }
    if (element.date.isAfter(
          DateTime.now().subtract(
            const Duration(days: 7),
          ),
        ) &&
        element.isIncome == true) {
      incomeLastWeekNotifier.value.add(element);
    }

    if (element.date.isAfter(
          DateTime.now().subtract(
            const Duration(days: 7),
          ),
        ) &&
        element.isIncome == false) {
      expenseLastWeekNotifier.value.add(element);
    }

    if (element.date.isAfter(
          DateTime.now().subtract(
            const Duration(days: 30),
          ),
        ) &&
        element.isIncome == false) {
      incomeLastMonthNotifier.value.add(element);
    }

    if (element.date.isAfter(
          DateTime.now().subtract(
            const Duration(days: 30),
          ),
        ) &&
        element.isIncome == false) {
      expenseLastMonthNotifier.value.add(element);
    }
  }
  overviewNotifier.notifyListeners();
  todayNotifier.notifyListeners();
  yesterdayNotifier.notifyListeners();
  incomeNotifier.notifyListeners();
  expenseNotifier.notifyListeners();
  incomeTodayNotifier.notifyListeners();
  incomeYesterdayNotifier.notifyListeners();
  expenseTodayNotifier.notifyListeners();
  expenseYesterdayNotifier.notifyListeners();
  lastWeekNotifier.notifyListeners();
  incomeLastWeekNotifier.notifyListeners();
  expenseLastWeekNotifier.notifyListeners();
  lastMonthNotifier.notifyListeners();
  incomeLastMonthNotifier.notifyListeners();
  expenseLastMonthNotifier.notifyListeners();
}