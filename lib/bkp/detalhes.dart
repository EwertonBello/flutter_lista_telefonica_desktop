import 'package:flutter/material.dart';

// class Detalhes extends StatelessWidget
// {
//   @override
//   Widget build(BuildContext context)
//   {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Detalhes'),
//       ),
//       body: Center(
//         child: Text('Detalhes'),
//         )
//     );
//   }
// }

class Detalhes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhes"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}
