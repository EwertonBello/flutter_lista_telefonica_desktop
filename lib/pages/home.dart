import 'package:flutter/material.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import '../components/lista.dart';
import '../models/contato.dart';

class Home extends StatelessWidget
{

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Contatos"),
        actions: <Widget>[
        IconButton(
          icon: Icon(Icons.brightness_6),
          onPressed: ()
          {
            DynamicTheme.of(context).setBrightness(Theme.of(context).brightness == Brightness.dark? Brightness.light: Brightness.dark);
          },
          )// Icon Button
        ]
        ), //AppBar
      body: Lista(),
      ); //Scaffold
  }
}
