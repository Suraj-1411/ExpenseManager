import 'package:expense_manager/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'chart_bar.dart';

class Chart extends StatelessWidget {
  List<Transaction> recentTransactions;

  Chart({Key? key, required this.recentTransactions}) : super(key: key);

  List<Map<String, Object>> get _getBarTransactionsData {
    return List.generate(7, (index) {
      var prevDate = DateTime.now().subtract(Duration(days: index));
      double amount = 0.0;
      for (var element in recentTransactions) {
        if (element.date.day == prevDate.day &&
            element.date.month == prevDate.month &&
            element.date.year == prevDate.year) {
          amount += element.amount;
        }
      }
      return {'day': DateFormat.E().format(prevDate), 'amount': amount};
    }).reversed.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200,
        width: double.infinity,
        child: Card(
          elevation: 2.0,
          child: Row(
            children: _getBarTransactionsData.map((data) {
              return Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: ChartBar(amount: data['amount'] as double,day: data['day'].toString().substring(0,1),),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
