import 'package:flutter/material.dart';
import 'package:welcome_screen/components/rounded_button.dart';
import '../main.dart';

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
          Container(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              "Meditate With Us!",
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'plus-jakarta-sans',
                  fontSize: 17),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 40),
            child: RoundedButton(
              text: "Sign in with Apple",
              press: () {},
              textColor: Colors.black,
              color: Colors.white,
            ),
          ),
          RoundedButton(
            text: "Continue with Email or Phone",
            press: () {},
            textColor: Colors.black,
            color: kContinueWithEmailOrPhoneButtonColor,
          ),
          RoundedButton(
            text: "Continue With Google",
            press: () {},
            textColor: Colors.white,
            color: kPrimaryColor,
          ),
          Container(
            padding: EdgeInsets.only(top: 80),
            child: Image.asset(
              "assets/images/figmaappimg1.png",
              width: size.width * 0.8,
            ),
          ),
        ],
      ),
    );
  }
}
