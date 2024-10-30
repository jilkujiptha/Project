import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:registration/Home.dart';
import 'package:registration/Login.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(), builder: (context,snapshot){
        return snapshot.hasData?HomePage():LoginPage();
      }),
    );
  }
}