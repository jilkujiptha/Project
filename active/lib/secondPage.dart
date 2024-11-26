import 'dart:convert';
import 'dart:io';

import 'package:active/Services/appwriteSevices.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  TextEditingController add = TextEditingController();
  late AppwriteService _appwriteSevices;
  File? _image;
  final ImagePicker _picker = ImagePicker();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _appwriteSevices = AppwriteService();
  }

  Future<void> addEmployee() async {
    final bytes = await _image!.readAsBytes();
    final base64img = base64Encode(bytes);
    final task = add.text;
    if (task.isNotEmpty) {
      try {
        print("===============================");
        await _appwriteSevices.AddEmployee(task, base64img);
        add.clear();
      } catch (e) {
        print("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
        print(e);
      }
    }
  }

 

  void pickImg() async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.grey[900],
            title: Text(
              "Choose any?",
              style: TextStyle(color: Colors.green),
            ),
            actions: [
              TextButton(
                onPressed: gallery,
                child: Text("Gallery", style: TextStyle(color: Colors.green)),
              ),
              TextButton(
                onPressed: camera,
                child: Text("Camera", style: TextStyle(color: Colors.green)),
              ),
            ],
          );
        });
  }

  void gallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        Navigator.pop(context);
      } else {
        print("error!");
      }
    });
  }

  void camera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        Navigator.pop(context);
      } else {
        print("error!");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
                onTap: pickImg,
                child: Center(
                  child: ClipOval(
                    child: _image != null
                        ? Image.file(
                            _image!,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          )
                        : Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.grey[800]),
                            child: Icon(
                              Icons.person,
                              color: Colors.black,
                              size: 50,
                            ),
                          ),
                  ),
                )),
            SizedBox(
              height: 50,
            ),
            Container(
              width: MediaQuery.of(context).size.width * .8,
              padding: EdgeInsets.only(left: 20),
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[800],
                boxShadow: [
                  BoxShadow(
                      blurRadius: 5,
                      color: Colors.black,
                      offset: Offset(5, 5),
                      spreadRadius: 0),
                ],
              ),
              child: TextField(
                controller: add,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Name",
                    hintStyle: TextStyle(color: Colors.black)),
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, "first", (route) => false);
                    },
                    child: Text(
                      "CANCEL",
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                Container(
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black),
                  child: TextButton(
                    onPressed: () {
                      addEmployee();
                      // Navigator.pushNamedAndRemoveUntil(
                      //     context, "first", (route) => false);
                    },
                    child: Text(
                      "ADD",
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
