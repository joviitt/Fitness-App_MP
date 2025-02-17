


//import 'package:fitness/view/login/complete_profile_view.dart';

// ignore_for_file: deprecated_member_use, avoid_print, unused_import

import 'package:fitness_loginpage/common/color_extention.dart';
import 'package:fitness_loginpage/common_widget/round_button.dart';
import "package:fitness_loginpage/common_widget/round_textfield.dart";
import 'package:fitness_loginpage/controllers/signup_controller.dart';
import 'package:fitness_loginpage/view/login/login_view.dart';
import 'package:fitness_loginpage/view/login/profile.dart';
//import 'package:fitness_loginpage/view/login/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {  

  //var userform =GlobalKey<FormState>();
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  TextEditingController fname=TextEditingController();
  TextEditingController lname=TextEditingController();
  
  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.white,
      body: Form(
        child: SingleChildScrollView(
          child: SafeArea(
            //key: userform,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Hey there,",
                    style: TextStyle(color: TColor.gray, fontSize: 16),
                  ),
                  Text(
                    "Create an Account",
                    style: TextStyle(
                        color: TColor.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: media.width * 0.05,
                  ),
                   RoundTextField(
                    hitText: 'First Name',
                    icon: "assets/images/user_fn.png",
                    controller: fname,
                  ),
                  SizedBox(
                    height: media.width * 0.04,
                  ),
                  RoundTextField(
                    hitText: "Last Name",
                    icon: "assets/images/user_ln.png",
                    controller: lname,
                  ),
                  SizedBox(
                    height: media.width * 0.04,
                  ),
                  RoundTextField(
                    hitText: "Email",
                    icon: "assets/images/mail.png",
                    keyboardType: TextInputType.emailAddress,
                    controller: email,
                  ),
                  SizedBox(
                    height: media.width * 0.04,
                  ),
                  RoundTextField(
                    hitText: "Password",
                    icon: "assets/images/passwd.png",
                    controller: password,

                    obscureText: true,
                    rigtIcon: TextButton(
                         onPressed: () {},
                        //  {
                        //   setState(() {
                        //               // ignore: unused_label
                        //               obscureText: false;
                        //           });
                              
                        // },
                        child: Container(
                            alignment: Alignment.center,
                            width: 20,
                            height: 20,
                            child: Image.asset(
                              "assets/images/Hide-Password.png",
                              width: 20,
                              height: 20,
                              fit: BoxFit.contain,
                              color: TColor.gray,
                            ))),
                  ),
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isCheck = !isCheck;
                          });
                        },
                        icon: Icon(
                          isCheck
                              ? Icons.check_box_outlined
                              : Icons.check_box_outline_blank_outlined,
                          color: TColor.gray,
                          size: 20,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child:  Text(
                            "By continuing you accept our Privacy Policy and\nTerm of Use",
                            style: TextStyle(color: TColor.gray, fontSize: 10),
                          ),
                       
                      )
                    ],
                  ),
                  SizedBox(
                    height: media.width * 0.4,
                  ),
                   RoundButton(title: "Register",
                    onPressed: () {{
                      //create an account
                      SignupController.createAccount(email: email.text, password: password.text,fname: fname.text,lname: lname.text, context: context);
                    }
                   }),
                  SizedBox(
                    height: media.width * 0.04,
                  ),
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.,
                    children: [
                      Expanded(
                          child: Container(
                        height: 1,
                        color: TColor.gray.withOpacity(0.5),
                      )),
                      Text(
                        "  Or  ",
                        style: TextStyle(color: TColor.black, fontSize: 12),
                      ),
                      Expanded(
                          child: Container(
                        height: 1,
                        color: TColor.gray.withOpacity(0.5),
                      )),
                    ],
                  ),

                  ElevatedButton(
                    onPressed: () => SignupController().signInWithGoogle(),
                    child: const Text("Google Sign-In")
                    ),
                  // SizedBox(
                  //   height: media.width * 0.04,
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     GestureDetector(
                  //       onTap: () {},
                  //       child: Container(
                  //         width: 50,
                  //         height: 50,
                  //         alignment: Alignment.center,
                  //         decoration: BoxDecoration(
                  //           color: TColor.white,
                  //           border: Border.all(
                  //             width: 1,
                  //             color: TColor.gray.withOpacity(0.4),
                  //           ),
                  //           borderRadius: BorderRadius.circular(15),
                  //         ),
                  //         child: Image.asset(
                  //           "assets/images/google.png",
                  //           width: 50,
                  //           height: 50,
                  //         ),
                  //       ),
                  //     ),
        
                  //      SizedBox(
                  //       width: media.width * 0.04,
                  //     ),
        
                  //     GestureDetector(
                  //       onTap: () {},
                  //       child: Container(
                  //         width: 50,
                  //         height: 50,
                  //         alignment: Alignment.center,
                  //         decoration: BoxDecoration(
                  //           color: TColor.white,
                  //           border: Border.all(
                  //             width: 1,
                  //             color: TColor.gray.withOpacity(0.4),
                  //           ),
                  //           borderRadius: BorderRadius.circular(15),
                  //         ),
                  //         child: Image.asset(
                  //           "assets/images/facebook.png",
                  //           width: 50,
                  //           height: 50,
                  //         ),
                  //       ),
                  //     )
                  //   ],
                  // ),
                  SizedBox(
                    height: media.width * 0.04,
                  ),
                  TextButton(
                    onPressed: () {
                       Navigator.pop(context);
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Already have an account? ",
                          style: TextStyle(
                            color: TColor.black,
                            fontSize: 14,
                          ),
                        ),
                        TextButton(
                          child: Text("Login",
                          style: TextStyle(
                              color: TColor.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w700),
                        ),
                        onPressed: () {
                       Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginView()));
                    },
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: media.width * 0.04,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}