import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<dynamic> ls = [];
  List<dynamic> data = [];
  final _Flip=Hive.box("mybox");
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addData();
  }

  void keyData(){
    _Flip.put("1", data);
  }

  void addData() async {
    var res = await http.get(Uri.parse("https://dummyjson.com/products"));
    ls.add(jsonDecode(res.body));
    setState(() {
      data = ls[0]["products"];
    });
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          actions: [
            GestureDetector(
              onTap: () {
              Navigator.pushNamed(context, "third");
              },
              child: Icon(Icons.shopping_bag_outlined,
              size: 30,
              color: Colors.black,
              ),
            )
          ],
        ),
        body: Container(
          margin: EdgeInsets.only(left: 10, right: 10),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 3 / 4,
                        crossAxisCount: 2),
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "second",arguments: index.toString());
                          keyData();
                        },
                       child:   Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 10,
                                    color: Colors.grey,
                                    offset: Offset(5, 5))
                              ]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 120,
                                child: Image.network(
                                  data[index]["images"][0],
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 10),
                                child: 
                                  data[index]["brand"]!=null?
                                  Text(data[index]["brand"],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),):
                                  Text("",style: TextStyle(fontSize: 0),),
                                
                              ),
                              Container(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                    data[index]["title"],
                                  )),
                                  Row(
                                    children: [
                                      Icon(Icons.star,
                                      size: 25,
                                      color: data[index]["rating"]>=4?
                                      Colors.green:data[index]["rating"]>3?
                                      Colors.yellow:data[index]["rating"]>2?
                                      Colors.orange:Colors.red
                                      ), 
                                      Icon(Icons.star,
                                      size: 25,
                                       color: data[index]["rating"]>=4?
                                      Colors.green:data[index]["rating"]>3?
                                      Colors.yellow:data[index]["rating"]>2?
                                      Colors.orange:Colors.black
                                      ),
                                      Icon(Icons.star,
                                      size: 25,
                                       color: data[index]["rating"]>=4?
                                      Colors.green:data[index]["rating"]>3?
                                      Colors.yellow:Colors.black
                                      ),
                                      Icon(Icons.star,
                                      size: 25,
                                       color: data[index]["rating"]>=4?
                                       Colors.green:Colors.black
                                      ),
                                      SizedBox(width: 10,),
                                    ],
                                  ),
                              Container(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(data[index]["category"])),
                              Row(
                                children: [
                                  Icon(Icons.arrow_downward,
                                  size: 23,
                                  color: Colors.green,
                                  ),
                                  Text(data[index]["discountPercentage"].toString(),
                                  style: TextStyle(color: const Color.fromARGB(255, 2, 99, 5),fontSize: 15),),
                                  Text("%",style: TextStyle(color: const Color.fromARGB(255, 2, 99, 5),fontSize: 15),),
                                  // SizedBox(width: 5,),
                                  Text("\$${data[index]["price"]}",
                                  style: TextStyle(fontSize: 15,decoration: TextDecoration.lineThrough,color: Colors.grey),),
                                  // SizedBox(width: 5,),
                                  Container(
                                    width: 52,
                                    height: 20,
                                    child: Text("\$${(data[index]["price"]-(data[index]["price"]*(data[index]["discountPercentage"]/100))).toString()}", style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)
                                    
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      );
                    }),
              ),
            ],
          ),
        ));
  }
}
