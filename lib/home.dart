import 'package:flutter/material.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import './detalhes.dart';
import './cadastro.dart';
import './contato.dart';


class Home extends StatelessWidget
{

  List<Contato> contatos = <Contato>[
    Contato('Ewerton','(91) 91234-5678'), 
    Contato('Fulano','(91) 91234-5678'), 
    Contato('Humberto','(91) 91234-5678'), 
    Contato('Doisberto','(91) 91234-5678'), 
    Contato('Trêsberto','(91) 91234-5678'),    
    Contato('Fulano','(91) 91234-5678'), 
    Contato('Fulano','(91) 91234-5678'), 
    Contato('Fulano','(91) 91234-5678'), 
    Contato('Fulano','(91) 91234-5678'), 
    Contato('Fulano','(91) 91234-5678'), 
    Contato('Fulano','(91) 91234-5678'), 
    Contato('Fulano','(91) 91234-5678'), 
    Contato('Fulano','(91) 91234-5678'), 
    Contato('Fulano','(91) 91234-5678'), 
    Contato('Fulano','(91) 91234-5678'), 
    Contato('Fulano','(91) 91234-5678'), 
    Contato('Fulano','(91) 91234-5678'), 
    Contato('Humberto','(91) 91234-5678'), 
    Contato('Doisberto','(91) 91234-5678'), 
    Contato('Trêsberto','(91) 91234-5678'),
  ];

  @override
  Widget build(BuildContext context)
  {


    Iterable<Widget> listContatos = contatos.map((Contato contato) => buildListContatos(context, contato)).toList();

    return Scaffold(
      appBar: new AppBar(
        title: Text("Contatos"),
        actions: <Widget>[
        IconButton(
          icon: Icon(Icons.brightness_4),
          onPressed: () 
          {
            print('Modo Noturno');
            DynamicTheme.of(context).setBrightness(Theme.of(context).brightness == Brightness.dark? Brightness.light: Brightness.dark);
          },
          )// Icon Button
        ]
        ), //AppBar
      body: new ListView(
          children: listContatos,
          padding: EdgeInsets.symmetric(vertical: 0.8)
          ), // ListView
        floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Cadastro())),
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
        ),
    ); //Scaffold
  }
}

Widget buildListContatos(BuildContext context, Contato contato)
{
  Widget secondary = Text(contato.telefone);
  return new MergeSemantics(
    child: new ListTile(
      leading: Icon(Icons.person),
      title: Text(contato.nome),
      subtitle: secondary,
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap: () 
      {
        print(contato.nome);
        Navigator.push(context, MaterialPageRoute(builder: (context) => Detalhes()));
      }
    ),//ListTile
  );// MergeSemantics

}

