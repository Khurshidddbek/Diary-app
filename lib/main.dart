import 'package:deadline/pages/addpost_page.dart';
import 'package:deadline/pages/home_page.dart';
import 'package:deadline/pages/signin_page.dart';
import 'package:deadline/pages/signup_page.dart';
import 'package:deadline/services/pref_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

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
      home: _startPage(),
      routes: {
        SignInPage.id: (context) => SignInPage(),
        SignUpPage.id: (context) => SignUpPage(),
        HomePage.id: (context) => HomePage(),
        AddPostPage.id: (context) => AddPostPage(),
      },
      builder: EasyLoading.init(),
    );
  }

  Widget _startPage() {
    return StreamBuilder<FirebaseUser> (
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return HomePage();
        } else {
          Prefs.removeUserId();
          return SignInPage();
        }
      },
    );
  }
}