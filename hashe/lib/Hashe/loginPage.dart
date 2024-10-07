import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController name = TextEditingController();
  TextEditingController paswrd = TextEditingController();
  void hashePwd() {
    name.text;
    paswrd.text;
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
            "LOGIN",
            style: TextStyle(
                color: const Color.fromARGB(255, 255, 170, 59),
                fontSize: 30,
                fontFamily: "Schyler"),
          ),
        ),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
            alignment: Alignment.centerRight,
            width: MediaQuery.of(context).size.width,
            height: 350,
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
                            controller: paswrd,
                            style: TextStyle(
                                color: const Color.fromARGB(255, 241, 140, 7),
                                fontSize: 17),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Password",
                                hintStyle: TextStyle(
                                    color:
                                        const Color.fromARGB(255, 241, 140, 7),
                                    fontSize: 17)),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Forgotten Password ?",
                          style: TextStyle(
                              color: const Color.fromARGB(255, 241, 140, 7),
                              fontSize: 15),
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
                            "LOGIN",
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
      ]),
    );
  }
}
