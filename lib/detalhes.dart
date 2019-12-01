import 'package:flutter/material.dart';
import './contato.dart';

class Detalhes extends StatelessWidget 
{

  String nome;
  String telefone;
  String data_nasc;

  Detalhes(this.nome,this.telefone,this.data_nasc);

  @override
  Widget build(BuildContext context) 
  {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(this.nome),
        ),
        body: new Center(
            child: new Text('Detalhes Aqui')
        )
    );
  }
}