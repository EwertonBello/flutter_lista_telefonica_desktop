import 'package:flutter/material.dart';
import './contato.dart';
import './detalhes.dart';
import './cadastro.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage>{

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

  bool isNoturn = true;

  ThemeData get theme {
    if (isNoturn)
      return new ThemeData(primarySwatch: Colors.green, fontFamily: 'Roboto');
    else
      return new ThemeData(brightness: Brightness.dark, fontFamily: 'Roboto');
  }

  @override
  Widget build(BuildContext context){


    Iterable<Widget> listContatos = contatos.map((Contato contato) => buildListContatos(context, contato)).toList();

    return MaterialApp(
    	title: 'Lista Telefônica',
    	theme: theme,
    	home: new Scaffold(
    		appBar: new AppBar(
    			title: Text("Contatos"),
    			actions: <Widget>[
    			IconButton(
    				icon: Icon(Icons.brightness_4),
    				onPressed: () {
    					print('Modo Noturno');
    					setState(() => isNoturn = !isNoturn );
    					},
    				)// Icon Button
    			]
    			), //AppBar
    		body: new ListView(
    				children: listContatos,
    				padding: EdgeInsets.symmetric(vertical: 0.8)
    				), // ListView
    			floatingActionButton: FloatingActionButton(
	    			// onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Detalhes())),
          onPressed: () => Navigator.of(context).pushNamed('/cadastro'),
					child: Icon(Icons.add),
					backgroundColor: Colors.green,
					),
    		), //Scaffold
      routes: <String, WidgetBuilder>{
        '/detalhes': (BuildContext context) => new Detalhes(),
        '/cadastro': (BuildContext context) => new Cadastro(),
      },
    );
  }
}

Widget buildListContatos(BuildContext context, Contato contato){
  Widget secondary = Text(contato.telefone);
  return new MergeSemantics(
    child: new ListTile(
      leading: Icon(Icons.person),
      title: Text(contato.nome),
      subtitle: secondary,
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap: () {
              print(contato.nome);
              Navigator.of(context).pushNamed('/detalhes');
            }
    ),//ListTile
  );// MergeSemantics
}
