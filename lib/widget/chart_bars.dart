import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double totalSpending;
  final double totSpendingPer;
  ChartBar(this.label, this.totalSpending, this.totSpendingPer);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(
          child: Text('\$${totalSpending.toStringAsFixed(0)}'),
          fit: BoxFit.cover,
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            fit: StackFit.loose,
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    color: Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: BorderRadius.circular(20)),
              ),
              FractionallySizedBox(
                  heightFactor: totSpendingPer,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(20)),
                  ))
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(label)
      ],
    );
  }
}
