import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;


class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
TextEditingController email=TextEditingController();
TextEditingController pword=TextEditingController();
  bool obs=true;

  Map mp={};

  void saveData()async{
    mp={
      "email":email.text,
      "password":pword.text
    };
var res=await http.post(Uri.parse("http://jandk.tech/api/signin"),
    headers: {"Content-Type":"application/json"},
    body: jsonEncode(mp));
    print(res.statusCode);  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Container(
        alignment: Alignment.center,
        child:ListView(
          children: [ Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 100,),
            Text("Welcome Back",style: TextStyle(fontSize: 40),),
            Text("Enter your credential for login",style: TextStyle(fontSize: 15),),
            SizedBox(height: 50,),
            Container(
              margin: EdgeInsets.only(left: 20,right: 20),
              padding: EdgeInsets.only(left: 20),
              width: MediaQuery.of(context).size.width*.8,
              height: 60,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 207, 241, 241),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: Colors.grey,
                  offset: Offset(5, 5)
                )
              ]
              ),
              child: TextField(
                controller: email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: "Email",
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  prefixIcon: Icon(Icons.email)
                ),
              ),
            ),
            SizedBox(height: 30,),
            Container(
              margin: EdgeInsets.only(left: 20,right: 20),
              padding: EdgeInsets.only(left: 20),
              width: MediaQuery.of(context).size.width*.8,
              height: 60,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 207, 241, 241),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: Colors.grey,
                  offset: Offset(5, 5)
                )
              ]
              ),
              child: TextField(
                controller: pword,
                obscureText: obs,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: "Password",
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        obs==true?
                        obs=false:obs=true;
                      });
                    },
                    child: Icon(Icons.remove_red_eye))
                ),
              ),
            ),
            SizedBox(height: 40,),
            Container(
               margin: EdgeInsets.only(left: 20,right: 20),
              padding: EdgeInsets.only(left: 20),
              width: MediaQuery.of(context).size.width*.8,
              height: 60,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 22, 216, 216),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: Colors.grey,
                  offset: Offset(5, 5)
                )
              ]
              ),
              child: TextButton(onPressed: (){
                saveData();
              }, child: Text("Log In",
              style: TextStyle(color: Colors.white,fontSize: 20),)),
            ),
            SizedBox(height: 50,),
            Text("forgot password?",
            style: TextStyle(fontSize: 17,color: const Color.fromARGB(255, 22, 216, 216)),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 250,),
                Text("Don't have an account?",
                style: TextStyle(decoration: TextDecoration.underline,fontSize: 18),),
                SizedBox(width: 10,),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "signup");
                  },
                  child: Text("Sign Up",style:TextStyle(color: const Color.fromARGB(255, 22, 216, 216),fontSize: 18)
               )
             )
            ],
           )
          ]
                 ),
          ]
        )
      )
    );
  }
}