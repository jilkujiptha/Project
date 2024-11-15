import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController email = TextEditingController();
  TextEditingController pwd = TextEditingController();
  TextEditingController cpwd = TextEditingController();
  bool obs = true;

  Future Signup() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text.trim(), password: pwd.text.trim());
    Navigator.pushNamedAndRemoveUntil(context, "main", (route) => false);
  }

  void Password() {
    if (pwd.text == cpwd.text) {
      Signup();
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Incorrect Password!"),
            );
          });
    }
  }

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
                    "SignUp",
                    style: TextStyle(fontSize: 40, color: Colors.white),
                  ),
                  Text(
                    "Create your account",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.only(left: 20),
                margin: EdgeInsets.only(
                  right: 40,
                  left: 40,
                  top: 20,
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
                  top: 20,
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
              Container(
                padding: EdgeInsets.only(left: 20),
                margin: EdgeInsets.only(
                  right: 40,
                  left: 40,
                  top: 20,
                ),
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 226, 232, 238),
                ),
                child: TextField(
                  controller: cpwd,
                  obscureText: obs,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Confirm password",
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
              Container(
                margin: EdgeInsets.only(left: 100, right: 100, top: 20),
                // width: 30,
                height: 45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 226, 232, 238)),
                child: TextButton(
                  onPressed: () {
                    Password();
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.black, fontSize: 19),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
