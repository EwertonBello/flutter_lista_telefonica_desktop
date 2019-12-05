import 'dart:io';
import 'dart:convert';
import 'dart:async';

class ModTxt
{
	void insertTXT()
	{
		String txt = 'readTXT()'; // Vai carregar os registros do txt
		// new File('./teste.txt').writeAsString('$_nome,$_telefone,$_data_nasc;');

		print('TXT aí: $txt');
	}

	String readTXT()
	{
		var txt = [];

		// new File('./teste.txt')
		// 	.readAsString()
		// 	.then((String contents) {
		// 		txt = contents;
		// 		return txt;
		// 	});

		// print(txt);

		// final file = new File('teste.txt');
		// Stream<List<int>> inputStream = file.openRead();

		// inputStream
		// .transform(utf8.decoder)       // Decode bytes to UTF-8.
		// .transform(new LineSplitter()) // Convert stream to individual lines.
		// .listen((String line) {        // Process results.
		// 	print('$line: ${line.length} bytes');
		// 	},
		// 	onDone: () { print('File is now closed.'); },
		// 	onError: (e) { print(e.toString()); });		

		final file = new File('teste.txt');
		Stream<List<int>> inputStream = file.openRead();

		inputStream
		.transform(utf8.decoder)       // Decode bytes to UTF-8.
		.transform(new LineSplitter()) // Convert stream to individual lines.
		.forEach((item) => txt.add(item));
        print(txt);
		return txt.join();

	}

	// Future<String> loadTxt(BuildContext context) async {
	// 	return await DefaultAssetBundle.of(context).loadString('teste.txt');
	// }
}