import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:messenger/Provider/changeNotifier.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController pwd = TextEditingController();
  bool obs = true;

  final _message = Hive.box("mybox");

  final collectionReference =
      FirebaseFirestore.instance.collection("messenger");
  Future addUser(userid, username) async {
    QuerySnapshot querySnapshot =
        await collectionReference.where("userid", isEqualTo: userid).get();
    if (querySnapshot.docs.isEmpty) {
      collectionReference.add({"userid": userid, "username": username});
    }
  }

  Future login() async {
    try {
      UserCredential uc = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email.text, password: pwd.text);
      // print("hai");
      Provider.of<UserPrivider>(context, listen: false)
          .setUid(uc.user?.uid ?? '');
      print("==============================================================");
      print(Provider.of<UserPrivider>(context, listen: false).uid);
      print("=================================================");
      addUser(uc.user?.uid, uc.user?.displayName);
      final mp = {
        "id": uc.user?.uid,
      };

      _message.put(1, mp);
      print("==============================================================");
      print(_message.get(1));
      print("==============================================================");
    } catch (e) {
      print("Sign-in error:$e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Failed to sign in:$e"),
        ),
      );
    }
  }

  Future signinWithGoogle() async {
    try {
      final firebaseAuth = await FirebaseAuth.instance;
      final googleservice = await GoogleSignIn();
      final googleUser = await googleservice.signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final cred = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
      final User = await firebaseAuth.signInWithCredential(cred);
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> signIn() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 52, 100, 189),
        body: Expanded(
          child: ListView(
            children: [
              Container(
                width: 250,
                height: 250,
                child: Center(
                  child: Stack(
                    children: [
                      Image.asset(
                        "./image/freepik-export-20241113065134C1Ax.png",
                        color: const Color.fromARGB(255, 226, 232, 238),
                      ),
                      Positioned(
                        right: 75,
                        top: 100,
                        child: Text(
                          "Message",
                          style: TextStyle(
                              fontSize: 25,
                              color: const Color.fromARGB(255, 52, 100, 189)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Text(
                    "Welcome Back",
                    style: TextStyle(fontSize: 40, color: Colors.white),
                  ),
                  Text(
                    "Enter your credential for Login",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.only(left: 20),
                margin: EdgeInsets.only(
                  right: 40,
                  left: 40,
                  top: 30,
                ),
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 226, 232, 238),
                ),
                child: TextField(
                  controller: email,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Email",
                      hintStyle: TextStyle(fontSize: 16, color: Colors.black),
                      prefixIcon: Icon(Icons.email)),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20),
                margin: EdgeInsets.only(
                  right: 40,
                  left: 40,
                  top: 30,
                ),
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 226, 232, 238),
                ),
                child: TextField(
                  controller: pwd,
                  keyboardType: TextInputType.emailAddress,
                  obscureText: obs,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Password",
                      hintStyle: TextStyle(fontSize: 16, color: Colors.black),
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              obs = !obs;
                            });
                          },
                          icon: Icon(Icons.remove_red_eye))),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 50),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "forgot");
                      },
                      child: Text(
                        "Forgot password",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: 100, right: 100, top: 30),
                // width: 30,
                height: 45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 226, 232, 238)),
                child: TextButton(
                  onPressed: login,
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.black, fontSize: 19),
                  ),
                ),
              ),
              GestureDetector(
                onTap: signinWithGoogle,
                child: Container(
                  padding: EdgeInsets.only(left: 20),
                  margin: EdgeInsets.only(
                    right: 40,
                    left: 40,
                    top: 30,
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black)),
                  child: Row(
                    children: [
                      Container(
                          width: 30,
                          height: 30,
                          child: Image.asset("./image/google-symbol.png")),
                      SizedBox(
                        width: 50,
                      ),
                      Text(
                        "Sign in with Google",
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                    ],
                  ),
                ),
              ),
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
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ))
            ],
          ),
        ));
  }
}
