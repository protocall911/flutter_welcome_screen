import 'package:flutter/material.dart';
import 'package:welcome_screen/core/db/data_base_helper.dart';
import 'package:welcome_screen/router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DataBaseHelper.instance.init();

  final RouterApp router = RouterApp();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    onGenerateRoute:  router.generateRouter,
    initialRoute: pageSignIn
  ));
}

