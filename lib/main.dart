import 'package:flutter/material.dart';

import './widget/new_transaction.dart';
import 'widget/chart.dart';
import './widget/transaction_list.dart';
import './models/transaction.dart';

void main() => runApp(MainClass());

class MainClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Manager',
      home: MyHomePage(),
      theme: ThemeData(
          appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                  headline6: TextStyle(
                      fontFamily: 'QuickSand',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20))),
          fontFamily: 'OpenSans',
          textTheme: TextTheme(
              button:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              headline1: TextStyle(color: Colors.green),
              headline2: TextStyle(color: Colors.grey),
              headline3: TextStyle(color: Colors.green),
              headline4: TextStyle(color: Colors.white),
              headline6:
                  TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
          primarySwatch: Colors.green,
          textSelectionColor: Colors.red),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _addNewTransaction(String name, double amount, DateTime datesel) {
    var nwtr = Transaction(
        id: DateTime.now().toString(),
        title: name,
        amount: amount,
        date: datesel);
    setState(() {
      _usertransaction.add(nwtr);
    });
  }

  void _deletetransaction(String id) {
    setState(() {
      _usertransaction.removeWhere((element) {
        return element.id == id;
      });
    });
  }

  final List<Transaction> _usertransaction = [
    // Transaction(
    //     id: 't1', title: 'New Shoes', date: DateTime.now(), amount: 69.9),
    // Transaction(
    //     id: 't2', title: 'New Groceries', date: DateTime.now(), amount: 56.9),
    // Transaction(id: 't3', title: 'Watch', date: DateTime.now(), amount: 50.0)
  ];

  List<Transaction> get _recenttransaction {
    return _usertransaction.where((element) {
      return element.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          child: NewTransaction(_addNewTransaction),
        );
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                _startAddNewTransaction(context);
              })
        ],
        title: Text('Personal Expense Manager'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Chart(_recenttransaction),
            TransactionList(_usertransaction, _deletetransaction)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _startAddNewTransaction(context);
        },
      ),
    );
  }
}
