import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage>{

  List<String> contatos = <String>[
    'Ewerton', 'Fulano', 'Humberto', 'Doisberto', 'Trêsberto'
  ];


  @override
  Widget build(BuildContext context){

    Iterable<Widget> listContatos = contatos.map((String contato) => buildListContatos(context, contato));

    return new Scaffold(
      appBar: new AppBar(
        title: Text("Contatos"),
        backgroundColor: Colors.green,
      ), //AppBar
      body: new Scrollbar(
        child: new ListView(
          children: listContatos.toList(),
          padding: EdgeInsets.symmetric(vertical: 0.8)
        ), // ListView
      ), //Scrollbar
    ); //Scaffold
  }
}

Widget buildListContatos(BuildContext context, String item){
  Widget secondary = const Text('Texto secundário');
  return new MergeSemantics(
    child: new ListTile(
      title: Text('Nome: $item'),
      subtitle: secondary
    ),//ListTile
  );// MergeSemantics
}
