import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController cpassword = TextEditingController();

  bool obs = true;

  Future signout() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text.trim(), password: password.text.trim());
    Navigator.pushNamedAndRemoveUntil(context, "main", (route) => false);
  }

  void cPassword() {
    if (password.text == cpassword.text) {
      signout();
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Incorrect Password"),
            );
          });
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
        margin: EdgeInsets.only(left: 20, right: 20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(children: [
          Text(
            "Hello,",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Text(
            "sign up to continue",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 40,
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
                  icon: Icon(
                    Icons.remove_red_eye,
                    color: const Color.fromARGB(255, 96, 177, 99),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text("Confirm Password"),
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
              controller: cpassword,
              decoration: InputDecoration(
                border: InputBorder.none,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      obs = !obs;
                    });
                  },
                  icon: Icon(
                    Icons.remove_red_eye,
                    color: const Color.fromARGB(255, 96, 177, 99),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 100,
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
                cPassword();
              },
              child: Text(
                "Sign Up",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text("Have a account?"),
              SizedBox(
                width: 5,
              ),
              Text(
                "Sign In",
                style: TextStyle(
                    color: const Color.fromARGB(255, 96, 177, 99),
                    fontSize: 15),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
