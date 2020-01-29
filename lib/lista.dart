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
	TextEditingController buscaController = TextEditingController();
	List<Contato> contatos = new List<Contato>();
	List<Contato> dupContatos = new List<Contato>();
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
		dupContatos.clear();
		dupContatos.addAll(contatos);
	}

	void filtroBusca(String query)
	{
	  // List<Contato> modeloBuscaResults = List<Contato>();
	  // modeloBuscaResults.addAll(dupContatos);
	  if (query.isNotEmpty)
		{
	    List<Contato> contatosResults = List<Contato>();
	    dupContatos.forEach((item) {
	      if (item.nome.toUpperCase().contains(query) || item.telefone.replaceAll(new RegExp(r'[ ()-]'), '').contains(query) || item.telefone.contains(query))
					contatosResults.add(item);
	    });
	    setState(() {
	      contatos.clear();
	      contatos.addAll(contatosResults);
	    });
	    return;
	  }
		else
		{
	    setState(() {
	      contatos.clear();
	      contatos.addAll(dupContatos);
	    });
	  }
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

		if (contato != null)
		{
			setState(()
			{
				contatos.add(contato);
				dupContatos.add(contato);
			});
		}
	}

	@override
	Widget build(BuildContext context)
	{
		contatos.sort((a,b)=>a.nome.compareTo(b.nome));
		return Scaffold(
			body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
									filtroBusca(value.toUpperCase());
                },
                controller: buscaController,
                decoration: InputDecoration(
                    labelText: "Buscar Contato",
                    hintText: "Buscar",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              ),
            ),
            Expanded(
			        child: ListView.builder(
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
            ),
          ],
        ),
      ),
			floatingActionButton: FloatingActionButton(
				onPressed: _openCadastro,
				child: Icon(Icons.add),
				),
		);
	}
}
