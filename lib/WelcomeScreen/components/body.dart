import 'package:flutter/material.dart';
import 'package:welcome_screen/PlaylistScreen/playlist_screen.dart';
import 'package:welcome_screen/WelcomeScreen/components/rounded_button.dart';
import 'package:welcome_screen/main.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(top: 149, left: 40),
      child: Column(
        children: [
          Text(
            "medinow",
            style: TextStyle(
                fontWeight: FontWeight.w900, color: Colors.white, fontSize: 34),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Meditate With Us!",
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'plus-jakarta-sans',
                fontSize: 17),
          ),
          SizedBox(
            height: 40,
          ),
          RoundedButton(
            text: "Sign in with Apple",
            press: () {},
            textColor: Colors.black,
            color: Colors.white,
          ),
          RoundedButton(
            text: "Continue with Email or Phone",
            textColor: Colors.black,
            color: kContinueWithEmailOrPhoneButtonColor,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return PlaylistScreen();
                  },
                ),
              );
            },
          ),
          RoundedButton(
            text: "Continue With Google",
            press: () {},
            textColor: Colors.white,
            color: kPrimaryColor,
          ),
          SizedBox(
            height: 80,
          ),
          Image.asset(
            "assets/images/figmaappimg1.png",
            width: size.width * 0.8,
          ),
        ],
      ),
    );
  }
}
