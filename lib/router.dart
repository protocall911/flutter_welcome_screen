import 'package:flutter/material.dart';
import 'package:welcome_screen/screens/sign_in.dart';
import 'package:welcome_screen/screens/sign_up.dart';

const String pageSignIn = "signin";
const String pageSignUp = "signup";

class RouterApp {
  Route<dynamic>? generateRouter(RouteSettings settings) {
    switch (settings.name) {
      case pageSignIn: return MaterialPageRoute(builder: (_) => SignIn());
      case pageSignUp: return MaterialPageRoute(builder: (_) => SignUp());
    }
    return null;
  }
}