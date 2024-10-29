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
      appBar: AppBar(backgroundColor: Colors.white,),
      body: Container(
        margin: EdgeInsets.only(left: 30,right: 30,bottom: 20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: [ Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Welcome,",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
                Text("sign in to continue",style: TextStyle(fontSize: 20),),
                SizedBox(height: 50,),
                 Text("Email"),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color.fromARGB(255, 255, 249, 254),
                  ),
                  child: TextField(
                    decoration: InputDecoration(border: InputBorder.none,
                    ),
                    
                  ),
                ),
                 SizedBox(height: 15,),
                Text("Password"),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color.fromARGB(255, 255, 249, 254),
                  ),
                  child: TextField(
                    decoration: InputDecoration(border: InputBorder.none,
                    ),
                    
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Forgot password?"),
                  ],
                ),
                SizedBox(height: 50,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color.fromARGB(255, 96, 177, 99),
                  ),
                  child: TextButton(onPressed: (){}, child: Text("Sign In",style: TextStyle(color: Colors.white),)),
                ),
                 SizedBox(height: 30,),
                Center(child: Text("Or Sign in with",style: TextStyle(color: Colors.grey),)),
                SizedBox(height: 30,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Container(
                      alignment: Alignment.center,
                      width: 20,
                      height: 20,
                      child: Center(child: Image.asset("./image/search.png"))),
                      SizedBox(width: 10,),
                      Text("Sign in with Google")
                  ],),
                ),
                Spacer(),
                Row(
                  children: [
                Text("Don't have account?"),
                SizedBox(width: 5,),
                Text("Sign up",style: TextStyle(color: const Color.fromARGB(255, 96, 177, 99),fontSize: 15),)
                  ],
                ),
               
            ],
          ),
          ]
        ),
      ),
    );
  }
}