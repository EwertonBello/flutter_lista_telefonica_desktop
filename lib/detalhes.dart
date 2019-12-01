import 'package:flutter/material.dart';

class Detalhes extends StatelessWidget 
{
  @override
  Widget build(BuildContext context) 
  {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Detalhes'),
        ),
        body: new Center(
            child: new Text('Detalhes Aqui')
        )
    );
  }
}