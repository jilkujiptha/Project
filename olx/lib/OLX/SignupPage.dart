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
      body: Container(
        alignment: Alignment.center,
        child:Expanded(child: ListView(
          children: [

           Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50,),
              Text("Sign Up",style: TextStyle(fontSize: 40),),
              Text("Create your account",style: TextStyle(fontSize: 15),),
              SizedBox(height: 20,),
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: const Color.fromARGB(255, 22, 216, 216)
                ),
                child: Icon(Icons.person,
                color: Colors.white,
                size: 100,
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
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: "UserName",
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    prefixIcon: Icon(Icons.person)
                  ),
                ),
              ), SizedBox(height: 30,),
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
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: "Password",
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    prefixIcon: Icon(Icons.lock)
                  ),
                ),
              ), SizedBox(height: 30,),
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
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: "Confirm Password",
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    prefixIcon: Icon(Icons.lock)
                  ),
                ),
              ), SizedBox(height: 30,),
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
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: "place",
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    prefixIcon: Icon(Icons.place)
                  ),
                ),
              ), SizedBox(height: 30,),
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
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: "Address",
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    prefixIcon: Icon(Icons.place_outlined)
                  ),
                ),
              ), SizedBox(height: 30,),
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
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: "Pincode",
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    prefixIcon: Icon(Icons.password)
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
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: "Phone",
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    prefixIcon: Icon(Icons.phone)
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Container(
                 margin: EdgeInsets.only(left: 20,right: 20),
                padding: EdgeInsets.only(left: 20),
                width: MediaQuery.of(context).size.width*.4,
                height: 60,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(40),
                color: const Color.fromARGB(255, 22, 216, 216),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: Colors.grey,
                    offset: Offset(5, 5)
                  )
                ]
                ),
                child: TextButton(onPressed: (){}, child: Center(
                  child: Text("Sign Up",
                  style: TextStyle(color: Colors.white,fontSize: 20),))),
              ),
              SizedBox(height: 30,)
            ],
          ),
          ],
        ))
      ),
    );
  }
}