import 'package:flutter/material.dart';

class Tes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        Container(
          height: 200,
          child: Text('data'),
          color: Colors.red,
        ),
        Flexible(
          flex: 5,
          fit: FlexFit.loose,
          child: Container(
            height: 200,
            child: Text('data 1'),
            color: Colors.yellow,
          ),
        ),
        Expanded(
            flex: 5,
            child: Container(
                height: 200, child: Text('data 2'), color: Colors.blue)),
      ],
      mainAxisAlignment: MainAxisAlignment.spaceAround,
    ));
  }
}
