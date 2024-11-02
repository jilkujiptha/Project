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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
            child: Text(
          "Login Page",
          style: TextStyle(
              color: const Color.fromARGB(255, 209, 16, 2), fontSize: 25),
        )),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 350,
            child: Stack(
              children: [
                Center(
                  child: Image.asset("./image/blood.png"),
                ),
                Opacity(
                  opacity: .5,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 500,
                    child: Column(
                      children: [
                        Container(
                          width: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.red),
                          child: TextField(
                            decoration:
                                InputDecoration(border: InputBorder.none),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
