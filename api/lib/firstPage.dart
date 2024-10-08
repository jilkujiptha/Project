import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<dynamic> ls = [];
  List<dynamic> data = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addData();
  }

  void addData() async {
    var res = await http.get(Uri.parse("https://dummyjson.com/products"));
    ls.add(jsonDecode(res.body));
    data = ls[0]["products"];
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
                      return Container(
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
                              child: Text(
                                data[index]["brand"],
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            Container(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  data[index]["title"],
                                )),
                            Container(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(data[index]["category"])),
                            Row(
                              children: [
                                
                              ],
                            )
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ));
  }
}
