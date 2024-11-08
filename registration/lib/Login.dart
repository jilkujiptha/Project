import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  final CollectionReference _user=FirebaseFirestore.instance.collection("user");   
        

  bool obs = true;

  Future login() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text.trim(), password: password.text.trim());
  }

  Future signinwithGoogle() async {
    try {
      final firebaseAuth = await FirebaseAuth.instance;
      final googleServices = await GoogleSignIn();
      final googleuser = await googleServices.signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleuser?.authentication;
      final cred = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
      final user = await firebaseAuth.signInWithCredential(cred);
      print(googleuser);
      final data = {
        "name": googleuser!.displayName,
        "email": googleuser.email,
        "photo": googleuser.photoUrl,
        "id": googleuser.id
      };
      _user.add(data);
    } catch (e) {
      print(e);
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Container(
        margin: EdgeInsets.only(left: 30, right: 30, bottom: 20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(children: [
          Text("Welcome,",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          Text(
            "sign in to continue",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 50,
          ),
          Text("Email"),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: const Color.fromARGB(255, 255, 249, 254),
            ),
            child: TextField(
              controller: email,
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text("Password"),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: const Color.fromARGB(255, 255, 249, 254),
            ),
            child: TextField(
              obscureText: obs,
              controller: password,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          obs = !obs;
                        });
                      },
                      icon: Icon(Icons.remove_red_eye))),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("Forgot password?"),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: const Color.fromARGB(255, 96, 177, 99),
            ),
            child: TextButton(
                onPressed: () {
                  login();
                },
                child: Text(
                  "Sign In",
                  style: TextStyle(color: Colors.white),
                )),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
              child: Text(
            "Or Sign in with",
            style: TextStyle(color: Colors.grey),
          )),
          SizedBox(
            height: 30,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 20,
                    height: 20,
                    child: Center(child: Image.asset("./image/search.png"))),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                    onTap: signinwithGoogle, child: Text("Sign in with Google"))
              ],
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Row(
            children: [
              Text("Don't have account?"),
              SizedBox(
                width: 5,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "registration");
                },
                child: Text(
                  "Sign up",
                  style: TextStyle(
                      color: const Color.fromARGB(255, 96, 177, 99),
                      fontSize: 15),
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
