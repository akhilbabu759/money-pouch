import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:syncfusion_flutter_charts/charts.dart';

import '../../db/chart_function/graph_function.dart';
import '../../models/graph/chart.dart';

class Graphs extends StatefulWidget {
  const Graphs({Key? key}) : super(key: key);

  @override
  State<Graphs> createState() => _GraphsState();
}

class _GraphsState extends State<Graphs> with TickerProviderStateMixin {
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
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    filterFunction();
    chartdivertFunctionExpense();
    chartdivertFunctionIncome();

    super.initState();
  }

  String categoryId2 = 'All';
  int touchIndex = 1;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(213, 20, 27, 38),
        title: const Text(
          'Transaction Statistics',
        ),
        centerTitle: true,
      ),
      body: ValueListenableBuilder(
        valueListenable: expenseLastMonthNotifier,
        builder: (context, value, Widget? _) => Column(
          children: [
            SizedBox(
              height: height * 0.039,
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 24,
              ),
              child: Material(
                shadowColor: const Color.fromARGB(255, 187, 251, 247),
                borderRadius: BorderRadius.circular(18),
                elevation: 10,
                child: Container(
                  height: height * 0.0657,
                  width: width * 0.83,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 224, 224, 224),
                      borderRadius: BorderRadius.circular(20),
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
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DropdownButton<String>(
                          underline: const Divider(
                            color: Colors.transparent,
                          ),
                          value: categoryId2,
                          items: <String>[
                            'All',
                            'Today',
                            'Yesterday',
                            'This week',
                            'month',
                          ]
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              categoryId2 = value.toString();
                            });
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            TabBar(
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color.fromARGB(255, 144, 237, 237),
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
              controller: tabController,
              labelColor: Colors.green,
              unselectedLabelColor: Colors.black,
              tabs: const [
                Tab(
                  text: 'Overview',
                ),
                Tab(
                  text: 'Income',
                ),
                Tab(
                  text: 'Expense',
                ),
              ],
            ),
            SizedBox(
              height: height * 0.0263,
            ),
            SizedBox(
              width: double.maxFinite,
              height: height * 0.526,
              child: TabBarView(
                controller: tabController,
                children: [
                  Padding(
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
                                dataSource: chartdivertFunctionOverview(),
                                xValueMapper: (ChartDatas data, _) =>
                                    data.category,
                                yValueMapper: (ChartDatas data, _) =>
                                    data.amount,
                                explode: true,
                              )
                            ],
                          ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(
                      16,
                    ),
                    child: chartdivertFunctionIncome().isEmpty
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
                                dataSource: chartdivertFunctionIncome(),
                                xValueMapper: (ChartDatas data, _) =>
                                    data.category,
                                yValueMapper: (ChartDatas data, _) =>
                                    data.amount,
                                explode: true,
                              )
                            ],
                          ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(
                      16,
                    ),
                    child: chartdivertFunctionExpense().isEmpty
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
                                dataSource: chartdivertFunctionExpense(),
                                xValueMapper: (ChartDatas data, _) =>
                                    data.category,
                                yValueMapper: (ChartDatas data, _) =>
                                    data.amount,
                                explode: true,
                              )
                            ],
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
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
