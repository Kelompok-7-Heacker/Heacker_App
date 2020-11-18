// import 'package:flutter/material.dart';

// void main() {
//   runApp(new MaterialApp(
//     title: "About Us",
//     home: new About(),
//   ));
// }

// class About extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: new Text("About Us"),
//         ),
//         body: new Container(
//             padding: EdgeInsets.all(20.0),
//             child: new Center(
//               child: new Text("About Us"),
//             )));
//   }
// }

// Refrensi: https://github.com/putraxor/flutter-login-ui

import 'package:flutter/material.dart';

class About extends StatelessWidget {
  static String tag = 'home-page';

  @override
  Widget build(BuildContext context) {
    final header = AppBar(title: new Text("About Us"));

    final alucard = Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: CircleAvatar(
          radius: 72.0,
          backgroundColor: Colors.transparent,
          // backgroundImage: AssetImage('assets/alucard.jpg'),
        ),
      ),
    );

    final welcome = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'About Us',
        style: TextStyle(fontSize: 28.0),
      ),
    );

    final group = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Heacker - Health Checker: ',
        style: TextStyle(fontSize: 19.0),
      ),
    );

    final lorem = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Andreas Steven - 00000020150',
        style: TextStyle(fontSize: 16.0),
      ),
    );

    final lorem2 = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Bryan Leonardo - 00000020110',
        style: TextStyle(fontSize: 16.0),
      ),
    );

    final lorem3 = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Reynali - 000000',
        style: TextStyle(fontSize: 16.0),
      ),
    );

    final lorem4 = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Samuel Antonie - 000000',
        style: TextStyle(fontSize: 16.0),
      ),
    );

    final lorem5 = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Adjie Kristiawan - 000000',
        style: TextStyle(fontSize: 16.0),
      ),
    );

    final body = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(28.0),
      // decoration: BoxDecoration(
      //   gradient: LinearGradient(colors: [
      //     Colors.blue,
      //     Colors.lightBlueAccent,
      //   ]),
      // ),
      child: Column(
        children: <Widget>[
          alucard,
          welcome,
          group,
          lorem,
          lorem2,
          lorem3,
          lorem4,
          lorem5
        ],
      ),
    );

    return Scaffold(
      appBar: header,
      body: body,
    );
  }
}
