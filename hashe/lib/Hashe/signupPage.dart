import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController passwrd = TextEditingController();
  TextEditingController confirm = TextEditingController();
  List<dynamic> ls = [];

  final _page = Hive.box("mybox");

  void addData() {
    if (_page.get("1") != null) {
      ls = _page.get("1");

      ls.add({
        "email":email.text,
        
      });
    }
  }

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
            "SIGNUP",
            style: TextStyle(
                color: const Color.fromARGB(255, 255, 170, 59),
                fontSize: 30,
                fontFamily: "Schyler"),
          ),
        ),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.grey[800]),
          child: Icon(
            Icons.person,
            size: 100,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
            alignment: Alignment.centerRight,
            width: MediaQuery.of(context).size.width,
            height: 410,
            child: Stack(
              children: [
                Center(child: Image.asset("./image/pngwing.com.png")),
                Opacity(
                  opacity: .5,
                  child: Container(
                    margin: EdgeInsets.only(left: 35, right: 35),
                    width: MediaQuery.of(context).size.width,
                    height: 500,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.grey[800],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          padding: EdgeInsets.only(left: 30),
                          width: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[900]),
                          child: TextField(
                            controller: email,
                            style: TextStyle(
                                color: const Color.fromARGB(255, 241, 140, 7),
                                fontSize: 17),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Email Id",
                                hintStyle: TextStyle(
                                    color:
                                        const Color.fromARGB(255, 241, 140, 7),
                                    fontSize: 17)),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          padding: EdgeInsets.only(left: 30),
                          width: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[900]),
                          child: TextField(
                            controller: name,
                            style: TextStyle(
                                color: const Color.fromARGB(255, 241, 140, 7),
                                fontSize: 17),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Username",
                                hintStyle: TextStyle(
                                    color:
                                        const Color.fromARGB(255, 241, 140, 7),
                                    fontSize: 17)),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          padding: EdgeInsets.only(left: 30),
                          width: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[900]),
                          child: TextField(
                            controller: passwrd,
                            style: TextStyle(
                                color: const Color.fromARGB(255, 241, 140, 7),
                                fontSize: 17),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Create Password",
                                hintStyle: TextStyle(
                                    color:
                                        const Color.fromARGB(255, 241, 140, 7),
                                    fontSize: 17)),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          padding: EdgeInsets.only(left: 30),
                          width: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[900]),
                          child: TextField(
                            controller: confirm,
                            style: TextStyle(
                                color: const Color.fromARGB(255, 241, 140, 7),
                                fontSize: 17),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Confirm Password",
                                hintStyle: TextStyle(
                                    color:
                                        const Color.fromARGB(255, 241, 140, 7),
                                    fontSize: 17)),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          padding: EdgeInsets.only(left: 30, right: 30),
                          width: 150,
                          height: 45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[900]),
                          child: Center(
                              child: Text(
                            "SIGNUP",
                            style: TextStyle(
                                color: const Color.fromARGB(255, 241, 140, 7),
                                fontSize: 17),
                          )),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )),
        SizedBox(height: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Divider(),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    width: 30,
                    height: 30,
                    child: Image.asset("./image/facebook.png")),
                Text(
                  "SignUp With Facebook",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    width: 30,
                    height: 30,
                    child: Image.asset("./image/google.png")),
                Text(
                  "SignUp With Google",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                )
              ],
            ),
          ],
        ),
      ]),
    );
    ;
  }
}
