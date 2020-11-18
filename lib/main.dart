import 'package:flutter/material.dart';
import 'package:heacker_app/authentication/login_view.dart';
import 'package:heacker_app/authentication/register_view.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Login Register Page",
    initialRoute: "/",
    routes: {
      "/" : (context) => LoginPage(),
      RegisterPage.routeName : (context) => RegisterPage(),
    },
  ));
}