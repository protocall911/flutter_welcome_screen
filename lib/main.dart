import 'package:flutter/material.dart';
import 'package:welcome_screen/weclome_screen.dart';

const kPrimaryColor = Color(0xFF039EA2);
const kContinueWithEmailOrPhoneButtonColor = Color(0xFFCDFDFE);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Welcome Screen',
      theme: ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: kPrimaryColor,
      ),
      home: WelcomeScreen(),
    );
  }
}


