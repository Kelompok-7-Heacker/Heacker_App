import 'package:flutter/material.dart';
import './About.dart';

void main() {
  runApp(new MaterialApp(
    title: "Home",
    home: new Home(),
  ));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: new Text("Home Page"),
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
                  title: new Text("About Us"),
                  leading: Icon(Icons.info),
                  onTap: () {
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => new About()));
                  }),
            ],
          ),
        ),
        body: new Container(
            padding: EdgeInsets.all(20.0),
            child: new Center(
              child: new Text("Home Page"),
            )));
  }
}
