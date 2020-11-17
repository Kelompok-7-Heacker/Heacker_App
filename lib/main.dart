import 'package:flutter/material.dart';
import './Home.dart';
import './Heart.dart';
import './Ear.dart';

void main() {
  runApp(new MaterialApp(
    title: "My Apps",
    home: new Main(),
  ));
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State {
  int _selectedIndex = 0;

  final _widgetOptions = [
    Home(),
    Heart(),
    Ear(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Heart Checker'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.speaker),
            title: Text('Ear Checker'),
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        fixedColor: Colors.blueAccent,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
