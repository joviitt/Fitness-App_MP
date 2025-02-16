import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_loginpage/view/login/profile.dart';
import 'package:flutter/material.dart';

class SignupController{
static Future<void> createAccount({required String email,required String password,required BuildContext context}) async
  { try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    Navigator.pushAndRemoveUntil(context,MaterialPageRoute
    (builder: (context){
      return CompleteProfileView();
    }), (Route){
      return false;
    });
      print("Account created successfully");
  }catch(e)
  {
    SnackBar messageSnackBar = SnackBar(
      backgroundColor: Colors.red,
      content: Text(e.toString()));

    ScaffoldMessenger.of(context).showSnackBar(messageSnackBar);

    print(e);
  }}

}