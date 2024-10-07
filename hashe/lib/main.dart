import 'package:flutter/material.dart';
import 'package:hashe/Hashe/homePage.dart';
import 'package:hashe/Hashe/loginPage.dart';
import 'package:hashe/Hashe/signupPage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  var sign = await Hive.openBox("mybox");
  runApp(MaterialApp(
    home: SignupPage(),
    routes: {
      "home": (context) => HomePage(),
      "login": (context) => LoginPage(),
      "signup": (context) => SignupPage(),
    },
  ));
}
