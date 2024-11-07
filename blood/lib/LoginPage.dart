import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool obs = true;

  Future login() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text.trim(), password: password.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 150,
              ),
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome,",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Text("Sign in to continue", style: TextStyle(fontSize: 20)),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: Text(
                  "LOGIN",
                  style: TextStyle(
                      color: const Color.fromARGB(255, 190, 42, 31),
                      fontSize: 30),
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
                          blurRadius: 10,
                          offset: Offset(5, 5),
                          color: Colors.grey)
                    ]),
                child: TextField(
                  controller: email,
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
                          blurRadius: 10,
                          offset: Offset(5, 5),
                          color: Colors.grey)
                    ]),
                child: TextField(
                  obscureText: obs,
                  controller: password,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.black, fontSize: 17),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              obs = !obs;
                            });
                          },
                          icon: Icon(
                            Icons.remove_red_eye,
                          ))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  "Forgot password?",
                  style: TextStyle(color: Colors.black, fontSize: 17),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: 200,
                margin: EdgeInsets.only(left: 110, right: 40),
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 190, 42, 31),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          offset: Offset(5, 5),
                          color: Colors.grey)
                    ]),
                child: TextButton(
                  onPressed: () {
                    login();
                  },
                  child: Text(
                    "LOGIN",
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(child: Text("OR")),
              SizedBox(
                height: 30,
              ),
              Container(
                  margin: EdgeInsets.only(left: 70, right: 50),
                  width: MediaQuery.of(context).size.width * .7,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,s
                    children: [
                      Container(
                          padding: EdgeInsets.only(left: 20),
                          width: 50,
                          height: 50,
                          child: Image.asset("./image/search.png")),
                      SizedBox(
                        width: 55,
                      ),
                      Text("Sign in with Google")
                    ],
                  )),
              SizedBox(
                height: 50,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "signup");
                  },
                  child: Text(
                    "Create Account",
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  ),
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
