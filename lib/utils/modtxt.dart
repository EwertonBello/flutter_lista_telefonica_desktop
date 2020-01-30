import 'dart:io';
import 'dart:convert';
import 'dart:async';

class ModTxt
{
  String _txt_nome = './contatos.txt';

  Future<List<String>> get registro async
  {
    List<String> registros = [];

  	final file = new File(_txt_nome);
  	Stream<List<int>> inputStream = file.openRead();

  	Stream<String> lines = inputStream
  	.transform(utf8.decoder)
  	.transform(new LineSplitter());

  	try {
  		await for (String line in lines) registros.add(line);
  	}
  	catch (e) {
  		print(e.toString());
  	}

  	return registros;
  }

  void writeRegistro(String t) async
  {
  	var registros = await registro;
    if (!registros.contains(t))
    {
      registros.add(t);
      registros.sort();
      String text = registros.join('\n');
      File(_txt_nome).writeAsString(text);
    }
  }

  void deleteRegistro(String t) async
  {
  	var registros = await registro;
  	registros.remove(t);
    String text = registros.join('\n');
  	File(_txt_nome).writeAsString(text);
  }

  void updateRegistro(String antigo, String t) async
  {
    var registros = await registro;
    if (!registros.contains(t))
    {
      registros.remove(antigo);
      registros.add(t);
      registros.sort();
      String text = registros.join('\n');
      File(_txt_nome).writeAsString(text);
    }
  }

}
