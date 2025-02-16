import 'package:fitness_loginpage/view/login/login_view.dart';
import 'package:fitness_loginpage/view/login/welcome.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {

  @override
  void initState() {

    // Check for user login status

    Future.delayed(Duration(seconds: 5), () {

      openDashboard();
    });

    // TODO: implement initState
    super.initState();
  }


  void openDashboard(){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return WelcomeView();
    }));
  }

  void openLogin(){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return LoginView();
    }));

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center( child: Text("Splash Screen")),
    );
  }
}