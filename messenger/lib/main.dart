import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:messenger/Home.dart';
import 'package:messenger/Login.dart';
import 'package:messenger/Provider/changeNotifier.dart';
import 'package:messenger/Signup.dart';
import 'package:messenger/UserDisplay.dart';
import 'package:messenger/forgotPassword.dart';
import 'package:messenger/mainpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  var box = await Hive.openBox("mybox");

  runApp(
    ChangeNotifierProvider(
      create: (context) => UserPrivider(),
      child: MaterialApp(
        home: MainPage(),
        routes: {
          "login": (context) => Login(),
          "signup": (context) => SignUp(),
          "home": (context) => Home(),
          "main": (context) => MainPage(),
          "forgot": (context) => ForgotPassword(),
          "display": (context) => UserDisplay()
        },
      ),
    ),
  );
}
