import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TouchPage extends StatefulWidget {
  const TouchPage({super.key});

  @override
  State<TouchPage> createState() => _TouchPageState();
}

class _TouchPageState extends State<TouchPage> {
  List<dynamic>ls=[];
  List<dynamic>data=[];
  int index=0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addData();
  }

  void addData()async{
    var res=await http.get(Uri.parse("https://dummyjson.com/products"));
     ls.add(jsonDecode(res.body));
    data = ls[0]["products"];
    print(data);
  }
  @override
  Widget build(BuildContext context) {
    index=int.parse(ModalRoute.of(context)?.settings.arguments as String);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
         margin: EdgeInsets.only(left: 10, right: 10),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
                 Image.network(data[index]["images"][0]),
                 Container(
                  height: 40,
                  child: Divider()),
                Text(data[index]["description"])
            ],
          ),
      ),
    );
  }
}