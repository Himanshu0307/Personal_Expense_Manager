import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:second_package_personal_expenses/widget/chart_bars.dart';
import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> _recentTransaction;
  Chart(this._recentTransaction);

  List<Map<String, Object>> get groupedTransactionValue {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double _totSpendDay = 0;
      for (var i = 0; i < _recentTransaction.length; i++) {
        if (_recentTransaction[i].date.day == weekDay.day &&
            _recentTransaction[i].date.month == weekDay.month &&
            _recentTransaction[i].date.year == weekDay.year)
          _totSpendDay += _recentTransaction[i].amount;
      }

      var ma = {'day': DateFormat.E().format(weekDay), 'amount': _totSpendDay};
      // print(DateFormat.E().format(weekDay));
      // print(_totSpendDay);
      return ma;
    });
  }

  double get totalSpending {
    // double _tot;
    return groupedTransactionValue.fold(0, (_tot, element) {
      return _tot = _tot + (element['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    print(totalSpending);
    return Card(
      margin: EdgeInsets.all(20),
      elevation: 6,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        ...(groupedTransactionValue).reversed.map((e) {
          return Flexible(
            fit: FlexFit.tight,
            child: ChartBar(
                e['day'].toString().substring(0, 2),
                e['amount'],
                totalSpending == 0.0
                    ? 0.0
                    : ((e['amount'] as double) / totalSpending)),
          );
        }).toList()
      ]),
    );
  }
}
