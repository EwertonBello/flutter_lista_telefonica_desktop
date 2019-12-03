import 'package:flutter/material.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import './home.dart';
import './lista.dart';

class Main extends StatelessWidget 
{
  @override
  Widget build(BuildContext context) 
  {
    return new DynamicTheme(
      defaultBrightness: Brightness.light,
      data: (brightness) => new ThemeData(
        primarySwatch: Colors.green,
        brightness: brightness,
      ),
      themedWidgetBuilder: (context, theme) 
      {
        return new MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Lista Telefônica',
          theme: theme,
          // home: new Home(),
          home: new Lista(),
        );
      }
    );
  }
}
