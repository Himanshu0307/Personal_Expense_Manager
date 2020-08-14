import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function _addtransaction;
  NewTransaction(this._addtransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  DateTime _selectDat;

  final titlecontroller = TextEditingController();

  final amountcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: titlecontroller,
              decoration: InputDecoration(
                labelText: 'Title',
              ),
            ),
            TextField(
              controller: amountcontroller,
              decoration: InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.number,
              onSubmitted: (_) {
                widget._addtransaction(
                    titlecontroller.text, double.parse(amountcontroller.text));
                Navigator.of(context).pop();
              },
            ),
            Container(
              height: 60,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      _selectDat == null
                          ? 'No Date Choosen'
                          : DateFormat.yMMMd().format(_selectDat),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000, 1, 1),
                              lastDate: DateTime.now())
                          .then((value) {
                        setState(() {
                          _selectDat = value;
                        });
                      });
                    },
                    child: Text(
                      'Choose Date',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            RaisedButton(
                onPressed: () {
                  widget._addtransaction(titlecontroller.text,
                      double.parse(amountcontroller.text), _selectDat);
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Add Transaction',
                  style: Theme.of(context).textTheme.button,
                ),
                color: Theme.of(context).primaryColor),
          ],
        ),
      ),
    );
  }
}
