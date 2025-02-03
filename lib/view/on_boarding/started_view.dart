

import 'package:fitness_loginpage/common/color_extention.dart';
import 'package:fitness_loginpage/view/on_boarding/on_boarding_view.dart';
import 'package:flutter/material.dart';


import 'package:fitness_loginpage/common_widget/round_button.dart';


class StartedView extends StatefulWidget {
  const StartedView({super.key});

  @override
  State<StartedView> createState() => _StartedViewState();
}

class _StartedViewState extends State<StartedView> {
  bool isChangeColor = false;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.white,
      body: Container(
          width: media.width,
          decoration: BoxDecoration(
            gradient: isChangeColor
                ? LinearGradient(
                    colors: TColor.primaryG,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight)
                : null,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Text(
                "PowerPlus",
                style: TextStyle(
                    color: TColor.black,
                    fontSize: 36,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                "Fuel Your Strength",
                style: TextStyle(
                  color: TColor.gray,
                  fontSize: 18,
                ),
              ),
              const Spacer(),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: RoundButton(
                    title: "Get Started",
                    type: isChangeColor
                        ? RoundButtonType.textGradient
                        : RoundButtonType.bgGradient,
                    onPressed: () {
                      if (isChangeColor) {
                        //GO Next Screen
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const OnBoardingView()));
                      }
                    }, icon: '',
                  ),
                ),
              )
            ],
          )),
    );
  }
}