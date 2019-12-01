import 'package:flutter/material.dart';
import './third.dart';

class Second extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Second'),
      ),
      body: new Center(
        child: new FlatButton(
          child: const Text('Abrir Third'),
          // onPressed: () => Navigator.of(context).pushNamed('/third')
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Third())),
        )
      )
    );
  }
}