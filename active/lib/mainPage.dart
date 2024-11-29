import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';

import 'package:active/Active.dart';
import 'package:active/Services/appwriteSevices.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late AppwriteService _appwriteService;
  List? _Employee;
  Uint8List? _image;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _appwriteService = AppwriteService();
    _Employee = [];
    _loadTask();
  }

  Future<void> _loadTask() async {
    try {
      final employee = await _appwriteService.getEmployee();
      setState(() {
        _Employee = employee.map((e) => Employee.formDocument(e)).toList();
        print("**************************");
        print(_Employee);
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> _updateTask(Employee task) async {
    try {
      final updatetask =
          await _appwriteService.updateListStatus(task.id, !task.isActive);
      setState(() {
        task.isActive != updatetask.data["active"];
        _loadTask();
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Center(
          child: Text(
            "List of Employees",
            style: TextStyle(color: Colors.white),
          ),
        ),
        actions: [
          MaterialButton(
            onPressed: () {},
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "second");
              },
              icon: Container(
                width: 40,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.green),
                child: Icon(
                  Icons.add,
                  size: 30,
                  color: Colors.black,
                ),
              ),
            ),
          )
        ],
      ),
      backgroundColor: Colors.grey[900],
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Expanded(
          child: RefreshIndicator(
            onRefresh: () async {
              _loadTask();
              await Future.delayed(Duration(seconds: 1));
            },
            child: GridView.builder(
              padding: EdgeInsets.only(left: 10, right: 10, top: 30),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 3 / 3.5,
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: _Employee!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onLongPress: () {
                    _appwriteService.deleteTask(_Employee![index].id);
                    _loadTask();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: _Employee![index].isActive
                          ? const Color.fromARGB(255, 66, 165, 69)
                          : const Color.fromARGB(255, 190, 30, 19),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          color: const Color.fromARGB(255, 0, 0, 0),
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.grey[800],
                            ),
                            child: Image.memory(
                              _image = base64Decode(_Employee![index].photo),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Name :",
                              style: TextStyle(color: Colors.black),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              _Employee![index].name,
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            _updateTask(_Employee![index]);
                          },
                          child: Container(
                            width: 130,
                            height: 30,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: _Employee![index].isActive
                                      ? const Color.fromARGB(255, 184, 48, 38)
                                      : const Color.fromARGB(255, 57, 134, 59)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                _Employee![index].isActive
                                    ? "Deactivate"
                                    : "Activate",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
