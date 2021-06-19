import 'package:deadline/model/color_model.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  static final String id = 'signup_page';

  const SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  // Variables
  // ===========================================================================
  var _gmailController = TextEditingController();
  var _passwordController = TextEditingController();
  var _fullNameController = TextEditingController();
  var _confirmPasswordController = TextEditingController();

  bool _obsText = true; // For TextField : Password
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
                  controller: _gmailController,
                  style: TextStyle(fontFamily: 'Consolas', color: ColorsModel.kFontColor),
                  decoration: InputDecoration(
                    labelText: 'Gmail',
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
                  onPressed: () {
                    print(MediaQuery.of(context).size.width.toString());
                  },
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
                      onTap: () {},
                      child: Image.asset('assets/icons/social_icons/google_plus_logo_icon.png', height: 65, width: 65,),
                    ),

                    // Button : Facebook
                    GestureDetector(
                      onTap: () {},
                      child: Image.asset('assets/icons/social_icons/facebook_logo_icon.png', height: 65, width: 65,),
                    ),

                    // Button : Twitter
                    GestureDetector(
                      onTap: () {},
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
                        onTap: () {},
                        child: Text('Terms of Service', style: TextStyle(fontFamily: 'Consolas', color: ColorsModel.kFontColor, fontWeight: FontWeight.bold)),
                      ),

                      Text('and', style: TextStyle(fontFamily: 'Consolas', color: ColorsModel.kCardColor,)),

                      GestureDetector(
                        onTap: () {},
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
    super.dispose();

    _gmailController = null;
    _passwordController = null;
    _fullNameController = null;
    _confirmPasswordController = null;
    _obsText = null;
  }
}
