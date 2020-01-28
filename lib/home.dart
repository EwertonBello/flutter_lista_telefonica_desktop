import 'package:flutter/material.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import './lista.dart';
import './models/contato.dart';

class Home extends StatelessWidget
{
  // List<Contato> contatos = <Contato>[
  // Contato(nome:'Ewerton',telefone:'(91) 91234-5678',data_nasc:'12-12-1998'),
  // Contato(nome:'Humberto',telefone:'(91) 91234-5678',data_nasc:'12-12-1998'),
  // Contato(nome:'Doisberto',telefone:'(91) 91234-5678',data_nasc:'12-12-1998'),
  // Contato(nome:'Trêsberto',telefone:'(91) 91234-5678',data_nasc:'12-12-1998'),
  // ]; 

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
