import 'package:flutter/material.dart';
// import './firs.dart';


class Teste extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Teste title',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Teste'),
        ),
        body: Center(
          child: RaisedButton(
            child: Text('Teste'),
            onPressed: () {
              print('Testando...');
            },
        ),
        ),
      ),
    );
  }
}