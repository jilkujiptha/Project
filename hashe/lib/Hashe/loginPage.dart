import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        iconTheme: IconThemeData(
          color: const Color.fromARGB(255, 255, 170, 59),
        ),
        title: Center(
          child: Text(
            "LOGIN",
            style: TextStyle(
                color: const Color.fromARGB(255, 255, 170, 59),
                fontSize: 30,
                fontFamily: "Schyler"),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(left: 20, top: 30),
            child: Text(
              "MOKA",
              style: TextStyle(
                  fontFamily: "Pro",
                  color: const Color.fromARGB(255, 255, 170, 59),
                  fontSize: 30,
                  letterSpacing: 1),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, top: 30),
            child: Text(
              "Create Your Account",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          )
        ],
      ),
    );
  }
}
