import 'package:flutter/material.dart';
// import './third.dart';
import './second.dart';


class First extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      home: new Second(),
      // routes: <String, WidgetBuilder>{
      //   '/third': (BuildContext context) => new Third(),
      // },
    );
  }
}

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: new AppBar(
//         title: new Text('TestProject'),
//       ),
//       body: new Center(
//         child: new FlatButton(
//           child: const Text('Go to Settings'),
//           onPressed: () => Navigator.of(context).pushNamed('/settings')
//         )
//       )
//     );
//   }
// }

// class SettingsPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//         appBar: new AppBar(
//           title: new Text('SettingsPage'),
//         ),
//         body: new Center(
//             child: new Text('Settings')
//         )
//     );
//   }
// }
// #########################################################

// class First extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {

//     return MaterialApp(
//       title: 'First title',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('First'),
//         ),
//         body: Center(
//           child: RaisedButton(
//             child: Text('Open route'),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => Teste()),
//               );
//             },
//         ),
//         ),
//       ),
//     );
//   }
// }