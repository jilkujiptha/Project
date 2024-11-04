import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "LOGIN",
              style: TextStyle(
                  color: const Color.fromARGB(255, 190, 42, 31), fontSize: 30),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.only(left: 20),
            margin: EdgeInsets.only(left: 40, right: 40),
            width: MediaQuery.of(context).size.width,
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 10, offset: Offset(5, 5), color: Colors.grey)
                ]),
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Email",
                  hintStyle: TextStyle(color: Colors.black, fontSize: 17)),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.only(left: 20),
            margin: EdgeInsets.only(left: 40, right: 40),
            width: MediaQuery.of(context).size.width,
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 10, offset: Offset(5, 5), color: Colors.grey)
                ]),
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.black, fontSize: 17)),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Forgot password?",
            style: TextStyle(color: Colors.black, fontSize: 17),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            width: 200,
            margin: EdgeInsets.only(left: 40, right: 40),
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 10, offset: Offset(5, 5), color: Colors.grey)
                ]),
            child: TextButton(
              onPressed: () {},
              child: Text(
                "LOGIN",
                style: TextStyle(
                    color: const Color.fromARGB(255, 190, 42, 31),
                    fontSize: 17),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            "Create Account",
            style: TextStyle(color: Colors.black, fontSize: 25),
          )
        ],
      ),
    );
  }
}
