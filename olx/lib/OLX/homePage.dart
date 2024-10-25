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
              padding: EdgeInsets.only(left: 10,right: 10,top: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[600]
                    ),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Text("₹",style: TextStyle(fontSize: 20),),
                      SizedBox(width: 5,),
                  Text(data[index]["price"].toString(),style: TextStyle(fontSize: 15),),
                    ],
                  ),
                  Text(data[index]["pname"]),
                  Text(data[index]["description"],maxLines: 1,),
                ],
              )
          );
        }),
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey,
        child: Column(
          children: [
            DrawerHeader(
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),
                color: Colors.white
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}