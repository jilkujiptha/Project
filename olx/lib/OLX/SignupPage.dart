import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:image_picker/image_picker.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
Map mp={};
File?_image;

TextEditingController uname=TextEditingController();
TextEditingController email=TextEditingController();
TextEditingController pword=TextEditingController();
TextEditingController cpword=TextEditingController();
TextEditingController place=TextEditingController();
TextEditingController address=TextEditingController();
TextEditingController pin=TextEditingController();
TextEditingController phone=TextEditingController();
 bool obs=true;
 String? imge;


  void addData()async{
    if(_image!=null){
      final bytes = await _image!.readAsBytes();
    final base64img = base64Encode(bytes);
    imge=base64img;
    }
    mp={
      "username":uname.text,
      "email":email.text,
      "password":pword.text,
      "cpassword":cpword.text,
      "place":place.text,
      "address":address.text,
      "phone":phone.text,
      "pincode":pin.text,
      "profile": imge
    };
    var res=await http.post(Uri.parse("http://jandk.tech/api/signup"),
    headers: {"Content-Type":"application/json"},
    body: jsonEncode(mp));
    print(res.statusCode);
}

final ImagePicker _picker=ImagePicker();


void imagePick(){
  showDialog(context: context, builder: (BuildContext context){
    return AlertDialog(
      title: Text("Choose Any?",style: TextStyle(color:const Color.fromARGB(255, 22, 216, 216) ),),
      actions: [
        TextButton(onPressed: (){
          gallery();
        }, child: Text("Gallery",
        style: TextStyle(color:const Color.fromARGB(255, 22, 216, 216) ),)),
        TextButton(onPressed: (){
          camera();
        }, child: Text("Camera",
         style: TextStyle(color:const Color.fromARGB(255, 22, 216, 216) ),
        ))
      ],
    );
  });
}

void gallery()async{
  final PickedFile =await _picker.pickImage(source: ImageSource.gallery);
 setState(() {
    if(PickedFile!=null){
    _image=File(PickedFile.path);
    Navigator.pop(context);
  }
  else{
    print("error");
  }
 });
}

void camera()async{
final PickedFile =await _picker.pickImage(source: ImageSource.camera);
 setState(() {
    if(PickedFile!=null){
    _image=File(PickedFile.path);
    Navigator.pop(context);
  }
  else{
    print("error");
  }
 });
}

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
              GestureDetector(
                onTap: imagePick,
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: const Color.fromARGB(255, 22, 216, 216)
                  ),
                  child: ClipOval(
                    child: _image != null
                            ? Image.file(
                                _image!,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              )
                            :Icon(Icons.person,
                    color: Colors.white,
                    size: 100,
                    ),
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
                  controller: uname,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: "UserName",
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    prefixIcon: Icon(Icons.person)
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
                  controller: email,
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
                          obs==true?obs=false:obs=true;
                        });
                      },
                      child: Icon(Icons.remove_red_eye))
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
                  controller: cpword,
                  obscureText: obs,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: "Confirm Password",
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          obs==true?obs=false:obs=true;
                        });
                      },
                      child: Icon(Icons.remove_red_eye))
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
                  controller: place,
                  keyboardType: TextInputType.text,
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
                  controller: address,
                  keyboardType: TextInputType.text,
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
                  controller: pin,
                  keyboardType: TextInputType.number,
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
                  controller: phone,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: "Phone",
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    prefixIcon: Icon(Icons.phone)
                  ),
                ),
              ),
              SizedBox(height: 30,),
              ElevatedButton(onPressed: (){
                Navigator.pushNamed(context, "signin");
              }, child: Text("Sign Up",style: TextStyle(color: Colors.white,fontSize: 20),),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.only(left: 30,right: 30,top: 10,bottom: 10),
                backgroundColor: const Color.fromARGB(255, 22, 216, 216),
                elevation: 4,
              ),
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