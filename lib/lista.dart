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

	void _filtroBusca(String query)
	{
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

	@override
	initState()
	{
	  super.initState();
		_getRegistros();
	}

	void _openCadastro() async
	{ // Verifica se ele pode cadastrar mais de um
		final contato = await Navigator.push(context, MaterialPageRoute(builder: (context) => Cadastro()));

		if (contato != null)
		{
			setState(()
			{
<<<<<<< HEAD
				// print(contato);
				// print(contatos);

				print('cadastro contains ${contatos.contains(contato)}');
=======
>>>>>>> 42b3af0792734f21aeab1c18d11e35bba833a422
				if (!contatos.contains(contato+';'))
					contatos.add(contato);
					dupContatos.add(contato);
			});
		}
	}
	void _openDetalhes(Contato contato) async
	{
		final respCtt = await Navigator.push(context, MaterialPageRoute(builder: (context) => Detalhes(contato.nome, contato.telefone, contato.data_nasc)));

		if (respCtt != null)
		{
			if (respCtt == 'excluir')
				setState(() => contatos.remove(contato));
			else
			{
				setState(()
				{
					contatos.remove(contato);
					if (!contatos.contains(respCtt+';'))
						contatos.add(respCtt);
						dupContatos.add(respCtt);
				});
			}

		}
		print(respCtt);
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
									_filtroBusca(value.toUpperCase());
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
														// Navigator.push(context, MaterialPageRoute(builder: (context) => Detalhes(contato.nome, contato.telefone, contato.data_nasc)));
														_openDetalhes(contato);
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
