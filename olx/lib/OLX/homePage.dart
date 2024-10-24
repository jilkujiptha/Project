import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart'as http;

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  List data=[];
  Map mp={};

  final _olx=Hive.box("mybox");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

void getData()async{
  var token=_olx.get("key");
  var res=await http.get(Uri.parse("http://jandk.tech/api/getproducts"),
  headers: {"Authorization":"Bearer ${token}"}
  );
setState(() {
  mp=jsonDecode(res.body);
  print(mp);
  data=mp["products1"];
});
print(data);

}
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: GridView.builder(
          itemCount: data.length,
          padding: EdgeInsets.only(left: 10,right: 10,top: 20),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 4/5,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          ), 
          itemBuilder: (context,index){
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: const Color.fromARGB(255, 206, 203, 203),
                    offset: Offset(5, 5)
                  )
                ]
              ),
              child: Column(
                children: [
                  
                  Text(data[index]["pname"])
              ],
            ),
          );
        }),
      ),
    );
  }
}