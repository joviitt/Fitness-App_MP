import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_loginpage/common_widget/round_textfield.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {

  TextEditingController email_controller=TextEditingController();

  @override
  void dispose() {
    email_controller.dispose();
    super.dispose();
  }

  Future passwordReset() async{
    try{
    await FirebaseAuth.instance.sendPasswordResetEmail(email:email_controller.text.trim());
    showDialog(
       context: context,
       builder: (context){
        return AlertDialog(
          content: Text('Password Reset link sent successfully. Please check your Email.'),
        );
       },
       );
  }
    on FirebaseAuthException catch (e){
      print(e);
      showDialog(
       context: context,
       builder: (context){
        return AlertDialog(
          content: Text(e.message.toString()),
        );
       });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue,
      elevation: 0,),
      backgroundColor: Colors.grey[300],
      
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(padding: const EdgeInsets.symmetric(horizontal: 25)),
          Text('Enter your Email and we will send you a password reset link',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 17),),

          SizedBox(height: 10),

          RoundTextField(
                  controller: email_controller,
                  hitText: "Email",
                  icon: "assets/images/mail.png",
                  keyboardType: TextInputType.emailAddress,
                ),
                          SizedBox(height: 10),

          MaterialButton(
            onPressed: passwordReset,
            child: Text('Reset password'),
            color: const Color.fromARGB(255, 96, 176, 241),
          )
        ],
      )
    );
  }
}