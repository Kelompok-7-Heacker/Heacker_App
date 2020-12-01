import 'package:flutter/material.dart';
import './HomePages.dart';
import './Heart.dart';
import './Ear.dart';

void home() {
  runApp(new MaterialApp(
    title: "My Apps",
    home: new Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State {
  int _selectedIndex = 0;

  final _widgetOptions = [
    HomePages(),
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

// import 'package:flutter/material.dart';
// import './About.dart';

// import 'package:heacker_app/authentication/login_view.dart';
// import 'package:heacker_app/authentication/Auth.dart';

// void main() {
//   runApp(new MaterialApp(
//     title: "Home",
//     home: new Home(),
//   ));
// }

// final _widgetOptions = [
//   Home(),
//   Heart(),
//   Ear(),
// ];

// class Home extends State {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: new Text("Home Page"),
//       ),
//       drawer: new Drawer(
//         child: new ListView(
//           children: <Widget>[
//             DrawerHeader(
//               margin: EdgeInsets.zero,
//               padding: EdgeInsets.zero,
//               child: Container(
//                 child: Stack(
//                   children: <Widget>[
//                     Positioned(
//                       bottom: 12.0,
//                       left: 16.0,
//                       child: Text(
//                         'Heacker - Health Checker',
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 20.0,
//                             fontWeight: FontWeight.w500),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               decoration: BoxDecoration(
//                 color: Colors.blue,
//               ),
//             ),
//             new ListTile(
//                 title: new Text("About Us"),
//                 leading: Icon(Icons.info),
//                 onTap: () {
//                   Navigator.of(context).push(new MaterialPageRoute(
//                       builder: (BuildContext context) => new About()));
//                 }),
//             new ListTile(
//                 title: new Text("Logout"),
//                 leading: Icon(Icons.exit_to_app),
//                 onTap: () async {
//                   await Auth.signOut().then((value) => {
//                         Navigator.pushReplacement(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => LoginPage()))
//                       });
//                 }),
//           ],
//         ),
//       ),
//       body: new Container(
//           padding: EdgeInsets.all(20.0),
//           child: new Center(
//             child: new Text("Home Page"),
//           )),
//       bottomNavigationBar: BottomNavigationBar(
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             title: Text('Home'),
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.favorite),
//             title: Text('Heart Checker'),
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.speaker),
//             title: Text('Ear Checker'),
//           ),
//         ],
//         type: BottomNavigationBarType.fixed,
//         currentIndex: _selectedIndex,
//         fixedColor: Colors.blueAccent,
//         onTap: _onItemTapped,
//       ),
//     );
//   }

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
// }
