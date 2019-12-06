import 'dart:io';
import 'dart:convert';
import 'dart:async';

class ModTxt 
{

  Future<String> get registro async
  {
    String text = '';

  	final file = new File('teste.txt');
  	Stream<List<int>> inputStream = file.openRead();

  	Stream<String> lines = inputStream
  	.transform(utf8.decoder)
  	.transform(new LineSplitter());

  	try {
  		await for (String line in lines) text += line;
  	} 
  	catch (e) {
  		print(e.toString());
  	}

  	return text;
  }

  void writeRegistro(String t)
  {
  	text = registro+t;
  	File('./teste.txt').writeAsString(text);
  }

}

// class ModTxt
// {

// 	String txt = 'ok';

// 	void insertTXT()
// 	{
// 		String txt = 'readTXT()'; // Vai carregar os registros do txt
// 		// new File('./teste.txt').writeAsString('$_nome,$_telefone,$_data_nasc;');

// 		print('TXT aí: $txt');
// 	}

// 	String readTXT()
// 	{

// 		// new File('./teste.txt')
// 		// 	.readAsString()
// 		// 	.then((String contents) {
// 		// 		txt = contents;
// 		// 		return txt;
// 		// 	});

// 		// print(txt);

// 		// final file = new File('teste.txt');
// 		// Stream<List<int>> inputStream = file.openRead();

// 		// inputStream
// 		// .transform(utf8.decoder)       // Decode bytes to UTF-8.
// 		// .transform(new LineSplitter()) // Convert stream to individual lines.
// 		// .listen((String line) {        // Process results.
// 		// 	print('$line: ${line.length} bytes');
// 		// 	},
// 		// 	onDone: () { print('File is now closed.'); },
// 		// 	onError: (e) { print(e.toString()); });		

// 		final file = new File('teste.txt');
// 		Stream<List<int>> inputStream = file.openRead();

// 		inputStream
// 		.transform(utf8.decoder)       // Decode bytes to UTF-8.
// 		.transform(new LineSplitter()) // Convert stream to individual lines.
// 		.forEach((item) => teste(item));
        
//         // print(txt);
		
// 		return this.txt;

// 	}

// 	void teste(String t)
// 	{
// 		print('pegou $t');
// 		this.txt += t;
// 	}

// 	// Future<String> loadTxt(BuildContext context) async {
// 	// 	return await DefaultAssetBundle.of(context).loadString('teste.txt');
// 	// }
// }