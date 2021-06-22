import 'package:deadline/model/color_model.dart';
import 'package:deadline/pages/home_page.dart';
import 'package:deadline/services/auth_service.dart';
import 'package:deadline/services/pref_service.dart';
import 'package:deadline/services/utils_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class SignUpPage extends StatefulWidget {
  static final String id = 'signup_page';

  const SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  // Variables
  // ===========================================================================
  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();
  var _fullNameController = TextEditingController();
  var _confirmPasswordController = TextEditingController();

  bool _obsText = true; // For TextField : Password
  // ===========================================================================


  // Sign Up
  // ===========================================================================
  _doSignUp() {
    String fullName = _fullNameController.text.toString();
    String email = _emailController.text.toString().trim();
    String password = _passwordController.text.toString().trim();
    String confirmPassword = _confirmPasswordController.text.toString().trim();
    
    if (fullName.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      Utils.fireToast('The information is incomplete!');
      return ;
    }

    if (password != confirmPassword) {
      Utils.fireToast('Passwords do not match!');
      return ;
    }
    
    EasyLoading.show();

    AuthService.signUpUser(context, fullName, email, password).then((firebaseUser) => {
      _getFirebaseUser(firebaseUser),
    }).onError((error, stackTrace) => {
      _tryAgain(),
    });
  }

  _getFirebaseUser(FirebaseUser firebaseUser) async {
    EasyLoading.dismiss();

    if (firebaseUser != null) {
      Prefs.saveUserId(firebaseUser.uid);
      Navigator.pushNamedAndRemoveUntil(context, HomePage.id, (route) => false);
    } else {
      Utils.fireToast('Check your information!');
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
                SizedBox(height: 20,),

                // Text : Sign Up
                Text('Sign Up', style: TextStyle(fontFamily: 'Consolas', fontSize: 45, fontWeight: FontWeight.bold,  color: ColorsModel.kFontColor),),

                SizedBox(height: 50,),

                // TextField : Full Name
                TextField(
                  controller: _fullNameController,
                  style: TextStyle(fontFamily: 'Consolas', color: ColorsModel.kFontColor),
                  decoration: InputDecoration(
                    labelText: 'Full name',
                    labelStyle: TextStyle(fontFamily: 'Consolas'),
                    prefixIcon: Icon(Icons.person),
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

                // TextField : Confirm Password
                TextField(
                  obscureText: _obsText,
                  controller: _confirmPasswordController,
                  style: TextStyle(fontFamily: 'Consolas', color: ColorsModel.kFontColor),
                  decoration: InputDecoration(
                    labelText: 'Confirm password',
                    labelStyle: TextStyle(fontFamily: 'Consolas'),
                    prefixIcon: Icon(Icons.vpn_key),
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

                // FlatButton : Sign Up
                FlatButton(
                  height: 45,
                  minWidth: double.infinity,
                  onPressed: _doSignUp,
                  color: ColorsModel.kCardColor,
                  child: Text('Sign Up', style: TextStyle(fontFamily: 'Consolas', color: ColorsModel.kFontColor, fontWeight: FontWeight.bold,),),
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

                SizedBox(height: 20,),

                // GestureDetector : Text : Terms of Service || Privacy Policy
                Center(
                  child: Column(
                    children: [
                      Text('By signing you accept the ', style: TextStyle(fontFamily: 'Consolas', color: ColorsModel.kCardColor,)),

                      GestureDetector(
                        onTap: () {
                          Utils.fireToast('Not available yet!');
                        },
                        child: Text('Terms of Service', style: TextStyle(fontFamily: 'Consolas', color: ColorsModel.kFontColor, fontWeight: FontWeight.bold)),
                      ),

                      Text('and', style: TextStyle(fontFamily: 'Consolas', color: ColorsModel.kCardColor,)),

                      GestureDetector(
                        onTap: () {
                          Utils.fireToast('Not available yet!');
                        },
                        child: Text('Privacy Policy', style: TextStyle(fontFamily: 'Consolas', color: ColorsModel.kFontColor, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 60,),

                // GestureDetector : Text : Already have an account? Log in
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?  ", style: TextStyle(fontFamily: 'Consolas', color: ColorsModel.kFontColor,)),

                      Text("Log in", style: TextStyle(fontFamily: 'Consolas', color: ColorsModel.kFontColor, fontWeight: FontWeight.bold)),
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
    _fullNameController = null;
    _confirmPasswordController = null;
    _obsText = null;
    
    EasyLoading.dismiss();
    
    super.dispose();
  }
}
