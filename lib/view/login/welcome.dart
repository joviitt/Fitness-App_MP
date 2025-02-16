
import 'package:fitness_loginpage/view/login/login_view.dart';
import 'package:flutter/material.dart';
import '../../common/color_extention.dart';
//import '../../common_widget/round_button.dart';
//import '../main_tab/main_tab_view.dart';
import 'package:firebase_auth/firebase_auth.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {


  var user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.white,
      body: SafeArea(
        child: Container(
          width: media.width,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
SizedBox(
                height: media.width * 0.1,
              ),
               Image.asset(
                "assets/images/welcome.png",
                width: media.width * 0.75,
                fit: BoxFit.fitWidth,
              ),
              SizedBox(
                height: media.width * 0.1,
              ),
              Text(
                "Welcome",
                style: TextStyle(
                    color: TColor.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
              Text((user?.email ?? "").toString()),
              Text(
                "You are all set now, let’s reach your\ngoals together with us",
                textAlign: TextAlign.center,
                style: TextStyle(color: TColor.gray, fontSize: 12),
              ),
              ElevatedButton(onPressed: ()async {

                await FirebaseAuth.instance.signOut();

                Navigator.pushAndRemoveUntil(context,MaterialPageRoute
                (builder: (context){
                  return LoginView();
                }), (Route){
                    return false;
                  });

              }, child: Text("Logout")),
             const Spacer(),

        //        RoundButton(
        //           title: "Go To Home",
        //           onPressed: () {
        //             Navigator.push(
        //                 context,
        //                 MaterialPageRoute(
        //                     builder: (context) => const MainTabView()));
        //           }),
               
             ],
           ),
         ),

      ),
    );
  }
}
