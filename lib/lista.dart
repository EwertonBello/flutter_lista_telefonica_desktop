import 'package:flutter/material.dart';
import 'models/contato.dart';
import 'detalhes.dart';
import 'cadastro.dart';
import 'modtxt.dart';

class Lista extends StatefulWidget
{
	List<Contato> contatos = new List<Contato>();

	Lista()
	{
		print('Construindo...');
		contatos = [];
		contatos.add(Contato(nome:'Ewerton',telefone:'(91) 91234-5671',data_nasc:'12-12-1998'));
		contatos.add(Contato(nome:'de Jesus',telefone:'(91) 91234-5672',data_nasc:'12-12-1998'));
		contatos.add(Contato(nome:'Belo',telefone:'(91) 91234-5673',data_nasc:'12-12-1998'));
		contatos.add(Contato(nome:'Ferreira',telefone:'(91) 91234-5674',data_nasc:'12-12-1998'));
	}

	@override
	_ListaState createState() => _ListaState();
}

class _ListaState extends State<Lista>
{

	// @override
	// void initState() 
	// {
	// 	super.initState();
	// 	print('initState');
 //      	new File('./teste.txt').readAsString().then((String contents) {
 //        	print(contents.split(';'));
	// 		setState(()
	// 		{
	// 			print('initState setState');
	// 			widget.contatos.add(Contato(nome:'Doisberto',telefone:'(91) 91234-5675',data_nasc:'12-12-1998'));
	// 		});
	// 	});
	// }

	void _openCadastro() async
	{
		final contato = await Navigator.push(context, MaterialPageRoute(builder: (context) => Cadastro()));
		print('O que veio: $contato');
		if (contato != null)
		{
			setState(()
			{
				widget.contatos.add(contato);
			});
		}
	}

	@override
	Widget build(BuildContext context)
	{
		return Scaffold(
			appBar: AppBar(
				title: Text('Lista'),
			),
			body: ListView.builder(
				itemCount: widget.contatos.length,
				itemBuilder: (context, index) {
					final contato = widget.contatos[index];
					Widget secondary = Text(contato.telefone);
					return new MergeSemantics(
						child: new ListTile(
							leading: Icon(Icons.person),
							title: Text(contato.nome),
							subtitle: secondary,
							trailing: Icon(Icons.keyboard_arrow_right),
							onTap: ()
							{
								Navigator.push(context, MaterialPageRoute(builder: (context) => Detalhes(contato.nome, contato.telefone, contato.data_nasc)));
							}
							),//ListTile
						);// MergeSemantics
				},
			),
			floatingActionButton: FloatingActionButton(
				// textColor: Colors.white,
				// onPressed: _openCadastro,
				onPressed: () {
					print('#############foi');
					ModTxt txt = new ModTxt();
					print(txt.readTXT());
					},
				child: Icon(Icons.add),
				),
		);
	}
}