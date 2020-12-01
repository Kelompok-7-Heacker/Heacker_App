import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:heacker_app/authentication/constants.dart';
import 'package:heacker_app/authentication/login_view.dart';
import 'dart:async';

// import './Home.dart';
// import './Heart.dart';
// import './Ear.dart';

// void main() {
//   runApp(new MaterialApp(
//     title: "My Apps",
//     home: new Main(),
//   ));
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Main(),
    );
  }
}

class Main extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<Main> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => LoginPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.primaryColor,
      body: Center(
        child: Image.asset('assets/images/splash.png'),
      ),
    );
  }
}

// class _MainState extends State {
//   int _selectedIndex = 0;

//   final _widgetOptions = [
//     Home(),
//     Heart(),
//     Ear(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _widgetOptions.elementAt(_selectedIndex),
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
