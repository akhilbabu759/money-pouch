import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

import 'package:moneypouch/db/transation_db/transation_db.dart';

import 'package:moneypouch/models/transation_model/transation_model.dart';

late var dropDownVale;

class TransationListView extends StatefulWidget {
  TransationListView({
    Key? key,
    required this.results,
  }) : super(key: key);

  List<TransationModel> results = [];

  @override
  State<TransationListView> createState() => _DropdownListState();
}

class _DropdownListState extends State<TransationListView> {
  String parseDate(DateTime date) {
    return DateFormat.MMMd().format(date);
  }

  String dropdownvalue = 'All';
  var items = [
    'All',
    'income',
    'Expense',
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: ListView.builder(
      shrinkWrap: true,
      itemCount: (widget.results.length),
      itemBuilder: (BuildContext context, index) => ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Padding(
          padding: const EdgeInsets.only(left: 18, right: 18, bottom: 15),
          child: Slidable(
            key: ValueKey(widget.results[index].id),
            startActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  borderRadius: BorderRadius.circular(20),
                  onPressed: (ctx) {
                    TransationDbFunction()
                        .deleteTRAnsation(id: widget.results[index].id);
                  },
                  icon: Icons.delete,
                  backgroundColor: Colors.red,
                  label: 'DELETE',
                )
              ],
            ),
            child: ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              tileColor: const Color.fromARGB(255, 241, 241, 241),
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: (widget.results[index].isIncome == true
                    ? const Icon(
                        Icons.arrow_upward,
                        color: Colors.green,
                      )
                    : const Icon(
                        Icons.arrow_downward,
                        color: Colors.red,
                      )),
              ),
              subtitle: Text(parseDate(widget.results[index].date)),
              title: Text(
                widget.results[index].category,
                style: const TextStyle(fontSize: 18),
              ),
              trailing: Text(
                '₹${widget.results[index].amount}',
                style: const TextStyle(fontSize: 19),
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
