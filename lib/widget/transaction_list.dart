import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatefulWidget {
  final List<Transaction> _usertransaction;
  final Function _deletetransaction;
  TransactionList(this._usertransaction, this._deletetransaction);

  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        margin: EdgeInsets.all(20),
        child: widget._usertransaction.isEmpty
            ? Column(
                children: [
                  Text('No Transaction added yet!!'),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 200,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              )
            : ListView.builder(
                itemCount: widget._usertransaction.length,
                itemBuilder: (context, index) => Card(
                    child: ListTile(
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            widget._deletetransaction(
                                widget._usertransaction[index].id);
                          },
                        ),
                        title: Text(widget._usertransaction[index].title,
                            style: Theme.of(context).textTheme.headline6),
                        subtitle: Text(
                          DateFormat.yMMMd()
                              .format(widget._usertransaction[index].date),
                          style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.headline2.color),
                        ),
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundColor: Theme.of(context).primaryColor,
                          child: Padding(
                            padding: EdgeInsets.all(6),
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: Text(
                                '\$${widget._usertransaction[index].amount.toString()}',
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .textTheme
                                        .headline4
                                        .color),
                              ),
                            ),
                          ),
                        )))));
  }
}
