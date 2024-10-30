import 'package:flutter/material.dart';
import 'package:registration/Home.dart';
import 'package:registration/Login.dart';
import 'package:registration/Registration.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:registration/mainpage.dart';
import 'firebase_options.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(MaterialApp(home:MainPage() ,
  
  ));
}