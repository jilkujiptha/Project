import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class TouchPage extends StatefulWidget {
  const TouchPage({super.key});

  @override
  State<TouchPage> createState() => _TouchPageState();
}

class _TouchPageState extends State<TouchPage> {
  List<dynamic> data = [];
  List cart=[];

  final _Flip = Hive.box("mybox");
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addData();
  }

  void addData() {
    data = _Flip.get("1");
  }

  @override
  Widget build(BuildContext context) {
    int index = int.parse(ModalRoute.of(context)?.settings.arguments as String);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Expanded(
            child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .6,
                  child: Expanded(
                    child: ListView.builder(
                        itemCount: data[index]["images"].length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, indx) {
                          return Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * .6,
                              child: Image.network(
                                data[index]["images"][indx],
                                fit: BoxFit.contain,
                              ));
                        }),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 5,
                  color: const Color.fromARGB(255, 237, 247, 252),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(data[index]["description"]),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(Icons.star,
                        size: 25,
                        color: data[index]["rating"] >= 4
                            ? Colors.green
                            : data[index]["rating"] > 3
                                ? Colors.yellow
                                : data[index]["rating"] > 2
                                    ? Colors.orange
                                    : Colors.red),
                    Icon(Icons.star,
                        size: 25,
                        color: data[index]["rating"] >= 4
                            ? Colors.green
                            : data[index]["rating"] > 3
                                ? Colors.yellow
                                : data[index]["rating"] > 2
                                    ? Colors.orange
                                    : Colors.black),
                    Icon(Icons.star,
                        size: 25,
                        color: data[index]["rating"] >= 4
                            ? Colors.green
                            : data[index]["rating"] > 3
                                ? Colors.yellow
                                : Colors.black),
                    Icon(Icons.star,
                        size: 25,
                        color: data[index]["rating"] >= 4
                            ? Colors.green
                            : Colors.black),
                    Text(
                      data[index]["rating"].toString(),
                      style: TextStyle(
                          color: const Color.fromARGB(255, 7, 132, 235)),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("rating",
                        style: TextStyle(
                            color: const Color.fromARGB(255, 7, 132, 235))),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.arrow_downward,
                      size: 30,
                      color: Colors.green,
                    ),
                    Text(
                      data[index]["discountPercentage"].toString(),
                      style: TextStyle(
                          color: const Color.fromARGB(255, 2, 99, 5),
                          fontSize: 20),
                    ),
                    Text(
                      "%",
                      style: TextStyle(
                          color: const Color.fromARGB(255, 2, 99, 5),
                          fontSize: 25),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "${data[index]["price"]}",
                      style: TextStyle(
                          fontSize: 20,
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width:80,
                      height: 30,
                      child: Text(
                          "\$${(data[index]["price"] - (data[index]["price"] * (data[index]["discountPercentage"] / 100))).toString()}",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text(
                      "Stocks left :",
                      style: TextStyle(color: Colors.red, fontSize: 15),
                    ),
                    Text(
                      data[index]["stock"].toString(),
                      style: TextStyle(fontSize: 15, color: Colors.red),
                    )
                  ],
                ),
                 SizedBox(height: 20,),
                         Row(
                          children: [
                             Text("Return policy : ",style: TextStyle( fontSize: 15)),
                          Text(data[index]["returnPolicy"], style: TextStyle( fontSize: 15),),
                          ],
                         ),
                 Container(
                  width: MediaQuery.of(context).size.width,
                  height: 5,
                  color: const Color.fromARGB(255, 237, 247, 252),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("All details",
                    style: TextStyle(
                        fontSize: 20, decoration: TextDecoration.underline)),
                Row(
                  children: [
                    Container(
                        width: 50,
                        height: 30,
                        child: Image.asset("./lib/icons/full-stop.png")),
                    Text(data[index]["warrantyInformation"].toString(),
                        style: TextStyle(
                          fontSize: 15,
                        )),
                  ],
                ),
                Row(
                  children: [
                    Container(
                        width: 50,
                        height: 30,
                        child: Image.asset("./lib/icons/full-stop.png")),
                    Text(data[index]["shippingInformation"].toString(),
                        style: TextStyle(
                          fontSize: 15,
                        )),
                  ],
                ),
                Row(
                  children: [
                    Container(
                        width: 50,
                        height: 30,
                        child: Image.asset("./lib/icons/full-stop.png")),
                    Text(data[index]["availabilityStatus"].toString(),
                        style: TextStyle(
                          fontSize: 15,
                        )),
                  ],
                ),
                
                SizedBox(
                  height: 10,
                ),
                Text("REVIEWS",
                    style: TextStyle(
                        fontSize: 20, decoration: TextDecoration.underline)),
                        Container(
                          height: 90,
                          child: Expanded(
                            child: ListView.builder(
                              itemCount: data[index]["reviews"].length,
                              itemBuilder: (context, indx) {
                             return Container(
                              child: Row(
                                children: [
                                  Container(
                                     width: 50,
                                     height: 30,
                                    child: Image.asset("./lib/icons/full-stop.png")),
                                  Text(data[index]["reviews"][indx]["comment"]),
                                ],
                              )
                              );
                            },),
                          ),
                        ),
                      Row(
                        children: [
                          Container(
                            width: 50,
                          height: 30,
                          child: Image.asset("./lib/icons/full-stop.png")),
                          Text("Ratings"),
                          SizedBox(width: 10,),
                          Text(data[index]["rating"].toString()),
                        ],
                      ), 
                   Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                          cart.add(data[index]);
                        _Flip.put("1", cart);
                        },
                      child: Container(
                        width: 195,
                        height: 60,
                        color: Colors.white,
                        child: Center(child: Text("ADD TO CART")),
                      ),
                    ),
                    Container(
                      width: 195,
                      height: 60,
                      color: const Color.fromARGB(255, 241, 218, 10),
                      child: Center(child: Text("BUY NOW")),
                    ),
                  ],
                )           
                        
              ],
            ),
          ],
        )),
      ),
    );
  }
}
