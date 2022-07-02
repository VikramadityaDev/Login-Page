import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInController with ChangeNotifier{

  //object
  var _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? googleSignInAccount;

  // function for login
login() async
{
  this.googleSignInAccount = await _googleSignIn.signIn();


  //call
  notifyListeners();
}


// function to logout
logout() async
{
  // empty the value after logout
  this.googleSignInAccount = await _googleSignIn.signOut();

  //call
  notifyListeners();
}
}