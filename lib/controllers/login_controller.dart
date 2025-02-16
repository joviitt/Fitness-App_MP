// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_loginpage/view/login/profile.dart';
import 'package:flutter/material.dart';

class LoginController {
  static Future<void> login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      // Attempt sign-in
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      // Check if the user is successfully authenticated
      if (userCredential.user != null) {
        // Redirect to CompleteProfileView
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => CompleteProfileView()),
          (route) => false, // Remove all previous routes from the stack
        );
        print("Logged in successfully");
      }
    } catch (e) {
      // Show error message
      SnackBar messageSnackBar = SnackBar(
        backgroundColor: Colors.red,
        content: Text("Invalid Email or Password"),
      );

      ScaffoldMessenger.of(context).showSnackBar(messageSnackBar);
      print("Login failed: $e");
    }
  }
}
