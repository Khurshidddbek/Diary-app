import 'package:deadline/pages/signin_page.dart';
import 'package:deadline/services/pref_service.dart';
import 'package:deadline/services/utils_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthService {
  static final _auth = FirebaseAuth.instance;

  // Sign in User
  // ===========================================================================
  static Future<FirebaseUser> signInUser(BuildContext context, String email, String password) async {
    try {
      _auth.signInWithEmailAndPassword(email: email, password: password);
      final FirebaseUser firebaseUser = await _auth.currentUser();
      return firebaseUser;
    } catch (e) {
      print('********* Error SignInUser : $e*********');
      Utils.fireToast('Error : $e');
    }
    return null;
  }
  // ===========================================================================


  // Sign Up User
  // ===========================================================================
  static Future<FirebaseUser> signUpUser(BuildContext context, String fullName, String email, String password) async {
    try {
      _auth.createUserWithEmailAndPassword(email: email, password: password);
      final FirebaseUser firebaseUser = await _auth.currentUser();
      return firebaseUser;
    } catch (e) {
      print('********* Error SignInUser : $e*********');
      Utils.fireToast('Error : $e');
    }
  }
  // ===========================================================================


  // Sign out User
  // ===========================================================================
  static void signOutUser(BuildContext context) {
    _auth.signOut();
    Prefs.removeUserId().then((_) => {
      Navigator.pushReplacementNamed(context, SignInPage.id),
    });
  }
  // ===========================================================================
}