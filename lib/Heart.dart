import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: "Heart Checker",
    home: new Heart(),
  ));
}

class Heart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: new Text("Heart Checker Page"),
        ),
        drawer: new Drawer(
          child: new ListView(
            children: <Widget>[
              DrawerHeader(
                margin: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                child: Container(
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        bottom: 12.0,
                        left: 16.0,
                        child: Text(
                          'Heacker - Health Checker',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              new ListTile(
                  title: new Text("About Us"), leading: Icon(Icons.info))
            ],
          ),
        ),
        body: new Container(
            padding: EdgeInsets.all(20.0),
            child: new Center(
              child: new Text("Heart Checker Page"),
            )));
  }
}
