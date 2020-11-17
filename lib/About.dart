import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: "About Us",
    home: new About(),
  ));
}

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: new Text("About Us"),
        ),
        body: new Container(
            padding: EdgeInsets.all(20.0),
            child: new Center(
              child: new Text("About Us"),
            )));
  }
}
