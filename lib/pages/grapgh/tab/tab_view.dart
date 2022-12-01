import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
import 'package:moneypouch/db/chart_function/graph_function.dart';
import 'package:moneypouch/models/graph/chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GraphTab extends StatefulWidget {
  GraphTab({Key? key,required this.categoryId2}):super(key: key);
  String  categoryId2;

  @override
  State<GraphTab> createState() => _GraphTabState();
}

class _GraphTabState extends State<GraphTab> {
   String categoryId2 = 'All';
   List<ChartDatas> dataExpense = chartLogic(expenseNotifier.value);
  List<ChartDatas> dataIncome = chartLogic(incomeNotifier.value);
  List<ChartDatas> overview = chartLogic(overviewNotifier.value);
  List<ChartDatas> yesterday = chartLogic(yesterdayNotifier.value);
  List<ChartDatas> today = chartLogic(todayNotifier.value);
  List<ChartDatas> month = chartLogic(lastMonthNotifier.value);
  List<ChartDatas> week = chartLogic(lastWeekNotifier.value);
  List<ChartDatas> todayIncome = chartLogic(incomeTodayNotifier.value);
  List<ChartDatas> incomeYesterday = chartLogic(incomeYesterdayNotifier.value);
  List<ChartDatas> incomeweek = chartLogic(incomeLastWeekNotifier.value);
  List<ChartDatas> incomemonth = chartLogic(incomeLastMonthNotifier.value);
  List<ChartDatas> todayExpense = chartLogic(expenseTodayNotifier.value);
  List<ChartDatas> expenseYesterday =
      chartLogic(expenseYesterdayNotifier.value);
  List<ChartDatas> expenseweek = chartLogic(expenseLastWeekNotifier.value);
  List<ChartDatas> expensemonth = chartLogic(expenseLastMonthNotifier.value);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Material(child: Padding(
                    padding: const EdgeInsets.all(
                      16,
                    ),
                    child: chartdivertFunctionOverview().isEmpty
                        ? Center(
                            child: Lottie.asset(
                              'assets/images/89237-graph/data.json',
                              width: width * 0.9,
                              height: height * 0.4,
                            ),
                          )
                        : SfCircularChart(
                            legend: Legend(
                              isVisible: true,
                              overflowMode: LegendItemOverflowMode.wrap,
                              position: LegendPosition.bottom,
                            ),
                            series: <CircularSeries>[
                              PieSeries<ChartDatas, String>(
                                dataLabelSettings: const DataLabelSettings(
                                  isVisible: true,
                                  connectorLineSettings: ConnectorLineSettings(
                                      type: ConnectorType.curve),
                                  overflowMode: OverflowMode.shift,
                                  showZeroValue: false,
                                  labelPosition: ChartDataLabelPosition.outside,
                                ),
                                dataSource:overview ,
                                xValueMapper: (ChartDatas data, _) =>
                                    data.category,
                                yValueMapper: (ChartDatas data, _) => data.amount,
                                explode: true,
                              )
                            ],
                          ),
                  ),);
  }
   chartdivertFunctionOverview() {
    if (categoryId2 == 'All') {
      return overview;
    }
    if (categoryId2 == 'Today') {
      return today;
    }
    if (categoryId2 == 'Yesterday') {
      return yesterday;
    }
    if (categoryId2 == 'This week') {
      return week;
    }
    if (categoryId2 == 'month') {
      return month;
    }
  }

  chartdivertFunctionIncome() {
    if (categoryId2 == 'All') {
      return dataIncome;
    }
    if (categoryId2 == 'Today') {
      return todayIncome;
    }
    if (categoryId2 == 'Yesterday') {
      return incomeYesterday;
    }
    if (categoryId2 == 'This week') {
      return incomeweek;
    }
    if (categoryId2 == 'month') {
      return incomemonth;
    }
  }

  chartdivertFunctionExpense() {
    if (categoryId2 == 'All') {
      return dataExpense;
    }
    if (categoryId2 == 'Today') {
      return todayExpense;
    }
    if (categoryId2 == 'Yesterday') {
      return expenseYesterday;
    }
    if (categoryId2 == 'This week') {
      return expenseweek;
    }
    if (categoryId2 == 'month') {
      return expensemonth;
    }
  }
}