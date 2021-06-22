import 'package:deadline/model/color_model.dart';
import 'package:deadline/pages/signup_page.dart';
import 'package:deadline/services/auth_service.dart';
import 'package:deadline/services/pref_service.dart';
import 'package:deadline/services/utils_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'home_page.dart';

class SignInPage extends StatefulWidget {
  static final String id = 'signin_page';

  const SignInPage({Key key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  // Variables
  // ===========================================================================
  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();

  bool _obsText = true; // For TextField : Password

  bool _isLoading = false; // For CircularProgressIndicator
  // ===========================================================================

  // Sign In
  // ===========================================================================
  _doSignIn() {
    String email = _emailController.text.toString().trim();
    String password = _passwordController.text.toString().trim();
    
    if (email.isEmpty || password.isEmpty) {
      Utils.fireToast('The information is incomplete!');
      return ;
    }

    EasyLoading.show();

    AuthService.signInUser(context, email, password).then((firebaseUser) => {
      _getFirebaseUser(firebaseUser),
    }).onError((error, stackTrace) => {
      _tryAgain(),
    });
  }

  _getFirebaseUser(FirebaseUser firebaseUser) async {
    EasyLoading.dismiss();

    if (firebaseUser != null) {
      await Prefs.saveUserId(firebaseUser.uid);
      Navigator.pushReplacementNamed(context, HomePage.id);
    } else {
      Utils.fireToast('Check email and password!');
    }
  }

  _tryAgain() {
    EasyLoading.dismiss();
    Utils.fireToast('Try again!');
    return ;
  }
  // ===========================================================================


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsModel.kBackgroundColor,

      // Body
      // =======================================================================
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 120,),

                // Text : Hello, Welcome Back
                Text('Hello.', style: TextStyle(fontFamily: 'Consolas', fontSize: 45, fontWeight: FontWeight.bold,  color: ColorsModel.kFontColor),),
                Text('Welcome Back', style: TextStyle(fontFamily: 'Consolas', fontSize: 45, fontWeight: FontWeight.bold,  color: ColorsModel.kFontColor),),

                SizedBox(height: 100,),

                // TextField : Gmail
                TextField(
                  controller: _emailController,
                  style: TextStyle(fontFamily: 'Consolas', color: ColorsModel.kFontColor),
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(fontFamily: 'Consolas'),
                    prefixIcon: Icon(Icons.mail),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorsModel.kCardColor,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorsModel.kFontColor,
                        )
                    ),
                    focusColor: ColorsModel.kFontColor,
                  ),
                ),

                SizedBox(height: 15,),

                // TextField : Password
                TextField(
                  obscureText: _obsText,
                  controller: _passwordController,
                  style: TextStyle(fontFamily: 'Consolas', color: ColorsModel.kFontColor),
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(fontFamily: 'Consolas'),
                    prefixIcon: Icon(Icons.vpn_key),
                    suffixIcon: IconButton(
                      icon: Icon(_obsText ? Icons.remove_red_eye : Icons.remove_red_eye_outlined),
                      onPressed: () {
                        setState(() {
                          _obsText = _obsText ? false : true;
                        });
                      },
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorsModel.kCardColor,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorsModel.kFontColor,
                        )
                    ),
                    focusColor: ColorsModel.kFontColor,
                  ),
                ),

                SizedBox(height: 15,),

                // FlatButton : Login
                FlatButton(
                  height: 45,
                  minWidth: double.infinity,
                  onPressed: _doSignIn,
                  color: ColorsModel.kCardColor,
                  child: Text('Log in', style: TextStyle(fontFamily: 'Consolas', color: ColorsModel.kFontColor, fontWeight: FontWeight.bold,),),
                ),

                SizedBox(height: 20,),

                // GestureDetector : Text : Forgot Password?
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Utils.fireToast('Not available yet!');
                    },
                    onLongPress: () {
                      Utils.fireToast('Created by Khurshidddbek');
                    },
                    child: Text('Forgot Password?', style: TextStyle(fontFamily: 'Consolas', color: ColorsModel.kBlackColor, fontWeight: FontWeight.bold,),),
                  ),
                ),

                SizedBox(height: 25,),

                // Text : or
                Row(
                  children: [
                    Expanded(
                      child: Divider(height: 5, color: ColorsModel.kCardColor,),
                    ),

                    Text('  or  ', style: TextStyle(fontFamily: 'Consolas', color: ColorsModel.kCardColor)),

                    Expanded(
                      child: Divider(height: 5, color: ColorsModel.kCardColor,),
                    ),
                  ],
                ),

                SizedBox(height: 20,),

                // IconButtons : Google || Facebook || Twitter
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Button : Google
                    GestureDetector(
                      onTap: () {
                        Utils.fireToast('Not available yet!');
                        },
                      child: Image.asset('assets/icons/social_icons/google_plus_logo_icon.png', height: 65, width: 65,),
                    ),

                    // Button : Facebook
                    GestureDetector(
                      onTap: () {
                        Utils.fireToast('Not available yet!');
                        },
                      child: Image.asset('assets/icons/social_icons/facebook_logo_icon.png', height: 65, width: 65,),
                    ),

                    // Button : Twitter
                    GestureDetector(
                      onTap: () {
                        Utils.fireToast('Not available yet!');
                        },
                      child: Image.asset('assets/icons/social_icons/twitter_logo_icon.png', height: 65, width: 65,),
                    ),
                  ],
                ),

                SizedBox(height: 60,),

                // GestureDetector : Text : Don't have an account? Sign Up
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, SignUpPage.id);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?  ", style: TextStyle(fontFamily: 'Consolas', color: ColorsModel.kFontColor,)),

                      Text("Sign Up", style: TextStyle(fontFamily: 'Consolas', color: ColorsModel.kFontColor, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // =======================================================================
    );
  }

  //============================================================================
  @override
  void dispose() {
    // TODO: implement dispose
    _emailController = null;
    _passwordController = null;
    _obsText = null;
    EasyLoading.dismiss();

    super.dispose();

  }
}