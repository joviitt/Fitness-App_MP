
// ignore_for_file: unused_import

import 'package:fitness_loginpage/firebase_options.dart';
import 'package:fitness_loginpage/view/login/profile.dart';
import 'package:fitness_loginpage/view/login/signup_view.dart';
import 'package:fitness_loginpage/view/login/login_view.dart';
import 'package:fitness_loginpage/view/login/splashscreen.dart';
import 'package:fitness_loginpage/view/login/welcome.dart';
import 'package:fitness_loginpage/view/on_boarding/started_view.dart';
import 'package:fitness_loginpage/view/on_boarding/on_boarding_view.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'common/color_extention.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  WidgetsFlutterBinding.ensureInitialized();
  //SharedPreferences prefs = await SharedPreferences.getInstance();
  //bool hasSeenOnboarding = prefs.getBool('seenOnboarding') ?? false;

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //final bool hasSeenOnboarding;
  const MyApp({super.key, /*required this.hasSeenOnboarding*/});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PowerPlus',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        primaryColor: TColor.primaryColor1,
        fontFamily: "Poppins"
      ),
      home:OnBoardingView(),
    );
  }
}


