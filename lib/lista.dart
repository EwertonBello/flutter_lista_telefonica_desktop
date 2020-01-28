import 'package:flutter/material.dart';
import 'models/contato.dart';
import 'detalhes.dart';
import 'cadastro.dart';
import 'modtxt.dart';

class Lista extends StatefulWidget
{
	@override
	_ListaState createState() => _ListaState();
}

class _ListaState extends State<Lista>
{
	List<Contato> contatos = new List<Contato>();
	ModTxt txt = new ModTxt();

	_getRegistros() async
	{
		var registros = await txt.registro;
		registros.sort();
		contatos = [];
		registros.forEach((r) {
			var reg = r.split(',');
			setState((){
				contatos.add(Contato(nome:reg[0],telefone:reg[1],data_nasc:reg[2]));
			});
		});
	}

	// @override
	// void didUpdateWidget(Widget oldWidget)
	// {
	// 	print('Daqui do didUpdateWidget');
	//   _getRegistros();
	// }

@override
initState()
{
  super.initState();
	_getRegistros();
}

	void _openCadastro() async
	{
		final contato = await Navigator.push(context, MaterialPageRoute(builder: (context) => Cadastro()));
		print('O que veio: $contato');
		if (contato != null)
		{
			setState(()
			{
				contatos.add(contato);
			});
		}
	}

	@override
	Widget build(BuildContext context)
	{
		contatos.sort((a,b)=>a.nome.compareTo(b.nome));
		return Scaffold(
			body: ListView.builder(
				itemCount: contatos.length,
				itemBuilder: (context, index) {
					final contato = contatos[index];
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
				onPressed: _openCadastro,
				child: Icon(Icons.add),
				),
		);
	}
}
