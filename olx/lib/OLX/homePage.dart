import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart'as http;

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  final _olx=Hive.box("mydata");

void getData()async{
  var token=_olx.get("auth");
  var res=await http.post(Uri.parse("http://jandk.tech/api/getproducts"),
  headers: {"Authorization":" ${token}"}
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
    );
  }
}