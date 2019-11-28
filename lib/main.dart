import 'package:flutter/material.dart';
import './home_page.dart';

// void main() => runApp(
//   new MaterialApp(home: new HomePage())
// );

// void main() => runApp(AppListaTelefonica());

class AppListaTelefonica extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new HomePage(),
    );
  }
}