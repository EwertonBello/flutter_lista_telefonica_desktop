import 'package:flutter/material.dart';

class Third extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Third'),
        ),
        body: new Center(
            child: new Text('Third Aqui')
        )
    );
  }
}