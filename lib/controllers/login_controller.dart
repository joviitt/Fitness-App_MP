import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_loginpage/view/login/profile.dart';
import 'package:flutter/material.dart';

class LoginController{
static Future<void> login({required String email,required String password,required BuildContext context}) async
  { try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    Navigator.pushAndRemoveUntil(context,MaterialPageRoute
    (builder: (context){
      return CompleteProfileView();
    }), (Route){
      return false;
    });
      print("Logged in successfully");
  }catch(e)
  {
    SnackBar messageSnackBar = SnackBar(
      backgroundColor: Colors.red,
      content: Text(e.toString()));

    ScaffoldMessenger.of(context).showSnackBar(messageSnackBar);

    print(e);
  }}

}