import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'models/contato.dart';
import 'modtxt.dart';


class Detalhes extends StatefulWidget
{
  String nome;
  String telefone;
  String data_nasc;

  Detalhes(this.nome,this.telefone,this.data_nasc);

  @override
  _DetalhesState createState() => _DetalhesState();
}

class _DetalhesState extends State<Detalhes>
{
  final formKey = GlobalKey<FormState>();
  var _controllerTelefone = new MaskedTextController(mask: '(00) 0 0000-0000');
  var _controllerData = new MaskedTextController(mask: '00/00/0000');

  String _nome, _telefone, _data_nasc;

  void _alterar()
  {
    if(formKey.currentState.validate())
    {
      formKey.currentState.save();
      _nome = '${_nome[0].toUpperCase()}${_nome.substring(1)}';
      // print(_nome);
      // print(_telefone);
      // print(_data_nasc);

      ModTxt txt = new ModTxt();
      // txt.deleteRegistro('${widget.nome},${widget.telefone},${widget.data_nasc}');
      // txt.writeRegistro('$_nome,$_telefone,$_data_nasc');
      Navigator.of(context).pop(Contato(nome:_nome,telefone:_telefone,data_nasc:_data_nasc));
    }
  }
  void _excluir()
  {
    ModTxt txt = new ModTxt();
    txt.deleteRegistro('${widget.nome},${widget.telefone},${widget.data_nasc}');
    Navigator.of(context).pop('excluir');
  }

  bool validaData(String data)
  {
    var arrData = data.split('/');
    var dataValid = DateTime.parse('${arrData[2]}-${arrData[1]}-${arrData[0]}');
    if(dataValid.millisecondsSinceEpoch > DateTime.now().millisecondsSinceEpoch)
      return false;
    if(int.parse(arrData[0]) == dataValid.day && int.parse(arrData[1]) == dataValid.month && int.parse(arrData[2]) == dataValid.year)
      return true;
    return false;
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(widget.nome),
        ),
      body: Card(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[

              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nome: ${widget.nome}',
                  hintText: widget.nome
                  ),
                onSaved: (input) {
                  if (input.isEmpty)
                    _nome = widget.nome;
                  else
                    _nome = input;
                }
                ),
              TextFormField(
                controller: _controllerTelefone,
                decoration: InputDecoration(
                  labelText: 'Telefone: ${widget.telefone}',
                  hintText: widget.telefone
                  ),
                validator: (input) => input.length != 16 && !input.isEmpty ? 'Quantidade de dígitos insuficiente!' : null,
                onSaved: (input) {
                  if (input.isEmpty)
                    _telefone = widget.telefone;
                  else
                    _telefone = input;
                }
                ),
              TextFormField(
                controller: _controllerData,
                decoration: InputDecoration(
                  labelText: 'Data de Nascimento: ${widget.data_nasc}',
                  hintText: widget.data_nasc
                  ),
                validator: (input) => (input.length == 10 && validaData(input)) || input.isEmpty ? null : 'Data inválida!',
                onSaved: (input) {
                  if (input.isEmpty)
                    _data_nasc = widget.data_nasc;
                  else
                    _data_nasc = input;
                }
                ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    color: Colors.green,
                    textColor: Colors.white,
                    onPressed: _alterar,
                    child: Text('Alterar'),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    color: Colors.red,
                    textColor: Colors.white,
                    onPressed: _excluir,
                    child: Text('Excluir'),
                    ),
                  )
                ],
                )
              ],
              ),
            ),
          ),
        ),
      );
  }
}

// import 'package:flutter/material.dart';
// import './models/contato.dart';
//
// class Detalhes extends StatelessWidget
// {
//
//   String nome;
//   String telefone;
//   String data_nasc;
//
//   Detalhes(this.nome,this.telefone,this.data_nasc);
//
//   @override
//   Widget build(BuildContext context)
//   {
//     return new Scaffold(
//         appBar: new AppBar(
//           title: new Text(this.nome),
//         ),
//         body: new Center(
//             child: new Text('Detalhes Aqui')
//         )
//     );
//   }
// }
