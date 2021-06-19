import 'package:deadline/pages/home_page.dart';
import 'package:deadline/pages/signin_page.dart';
import 'package:deadline/pages/signup_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deadline',
      theme: ThemeData(
        fontFamily: 'Consolas',
        primarySwatch: Colors.grey,
      ),
      home: HomePage(),
      routes: {
        SignInPage.id: (context) => SignInPage(),
        SignUpPage.id: (context) => SignUpPage(),
        HomePage.id: (context) => HomePage(),
      },
    );
  }
}