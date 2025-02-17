// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
//import 'package:fitness_loginpage/view/login/login_view.dart';
import 'package:fitness_loginpage/view/login/profile.dart';
//import 'package:fitness_loginpage/view/login/profile.dart';
import 'package:flutter/material.dart';

class SignupController {
  static Future<void> createAccount({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      // Attempt to create a new user
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      // Check if the user was created successfully
      if (userCredential.user != null) {

        SnackBar messageSnackBar = SnackBar(
        backgroundColor: Colors.green,
        content: Text("Account Created Successfully"),
      );
            ScaffoldMessenger.of(context).showSnackBar(messageSnackBar);
        
        // Redirect to CompleteProfileView
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => CompleteProfileView()),
          (route) => false, // Remove all previous routes from the stack
        );
        print("Account created successfully");
      }
    } catch (e) {
      // Show error message if registration fails
      SnackBar messageSnackBar = SnackBar(
        backgroundColor: Colors.red,
        content: Text(e.toString()),
      );

      ScaffoldMessenger.of(context).showSnackBar(messageSnackBar);
      print("Signup failed: $e");
    }
  }
}
