import 'package:flutter/material.dart';
import 'package:heacker_app/authentication/constants.dart';
import './About.dart';
import 'package:heacker_app/authentication/login_view.dart';
import 'package:heacker_app/authentication/Auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() => runApp(MaterialApp(
      home: HomePages(),
    ));

class HomePages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
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
            new ListTile(
                title: new Text("Logout"),
                leading: Icon(Icons.exit_to_app),
                onTap: () async {
                  await Auth.signOut().then((value) => {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()))
                      });
                }),
          ],
        ),
      ),

      /* -- BODY -- */
      body: FutureBuilder(
        future: getUserInfo(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              children: <Widget>[
                Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                          ColorPalette.primaryColor,
                          ColorPalette.primaryDarkColor
                        ])),
                    child: Container(
                      width: double.infinity,
                      height: 350.0,
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                "https://hope.be/wp-content/uploads/2015/05/no-user-image.gif",
                              ),
                              radius: 50.0,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              snapshot.data['name'],
                              style: TextStyle(
                                fontSize: 22.0,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  snapshot.data['email'] + " ",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white60,
                                  ),
                                ),
                                Icon(
                                  Icons.verified_user,
                                  size: 15,
                                  color: Colors.lightBlue,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Card(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 5.0),
                              clipBehavior: Clip.antiAlias,
                              color: Colors.white,
                              elevation: 5.0,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 22.0),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                            "Gender",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 22.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5.0,
                                          ),
                                          Text(
                                            snapshot.data['gender'],
                                            style: TextStyle(
                                              fontSize: 20.0,
                                              color: Colors.black54,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                            "Status",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 22.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5.0,
                                          ),
                                          Text(
                                            snapshot.data['status'],
                                            style: TextStyle(
                                              fontSize: 20.0,
                                              color: Colors.black54,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30.0, horizontal: 16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Image.asset(
                          "assets/images/Logo.png",
                          height: 250.0,
                          width: 250.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else if (snapshot.connectionState == ConnectionState.none) {
            return Text("No data");
          }
          return CircularProgressIndicator();
        },
      ),
      /* -- BODY -- */
    );
  }
}

Future<DocumentSnapshot> getUserInfo() async {
  // ignore: await_only_futures
  var firebaseUser = await FirebaseAuth.instance.currentUser;
  return await FirebaseFirestore.instance
      .collection("users")
      .doc(firebaseUser.uid)
      .get();
}
