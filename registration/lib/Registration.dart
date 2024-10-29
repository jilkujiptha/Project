import 'package:flutter/material.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white,),
      body: Container(
        margin: EdgeInsets.only(left: 20,right: 20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: [ Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Hello,",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
              Text("sign up to continue",style: TextStyle(fontSize: 20),),
              SizedBox(height: 50,),
              Text("Name"),
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
               Text("Phone"),
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
              SizedBox(height: 100,),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color.fromARGB(255, 96, 177, 99),
                ),
                child: TextButton(onPressed: (){}, child: Text("Sign Up",style: TextStyle(color: Colors.white),)),
              ),
              SizedBox(height: 20,),
              Row(
                children: [
              Text("Have a account?"),
              SizedBox(width: 5,),
              Text("Sign In",style: TextStyle(color: const Color.fromARGB(255, 96, 177, 99),fontSize: 15),)
                ],
              )
            ],
          ),
          ]
        ),
      ),
    );
  }
}