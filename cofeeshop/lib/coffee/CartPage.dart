import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final _coffee = Hive.box("mybox");
  List ls = [];
  num Total = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readData();
    totalAmount();
  }

  void readData() {
    if (_coffee.get("1") != null) {
      ls = _coffee.get("1");
    } else {
      print(ls);
    }
  }

  void totalAmount() {
    for (var p in ls) {
      Total = Total + p["price"];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.grey[900],
        title: Center(
          child: Text(
            "MOKA",
            style: TextStyle(
                fontFamily: "edu",
                color: const Color.fromARGB(255, 255, 170, 59),
                fontSize: 30),
          ),
        ),
      ),
      body: Column(
        children: [
          Text(
            "Find the Best Coffee for You ",
            style: TextStyle(
              fontFamily: "Pro",
              color: const Color.fromARGB(255, 255, 170, 59),
              fontSize: 25,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: ls.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin:
                        EdgeInsets.only(bottom: 5, top: 5, left: 10, right: 10),
                    padding: EdgeInsets.only(left: 10, top: 10),
                    width: MediaQuery.of(context).size.width * .9,
                    height: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey[800],
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 5,
                            offset: Offset(5, 5),
                            color: Colors.black)
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              ls[index]["image"],
                              fit: BoxFit.contain,
                              width: 100,
                              height: 100,
                            ),
                            Column(
                              children: [
                                Text(
                                  ls[index]["name"],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Text(
                                    "Best Coffee",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  "₹${(ls[index]["price"] * ls[index]["qty"])}",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (ls[index]["qty"] <= 0) {
                                    null;
                                  } else {
                                    ls[index]["qty"]--;
                                  }
                                });
                              },
                              child: Text(
                                "-",
                                style: TextStyle(
                                    fontSize: 35, color: Colors.white),
                              ),
                            ),
                            Text(
                              ls[index]["qty"].toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  ls[index]["qty"]++;
                                });
                              },
                              child: Text(
                                "+",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }),
          ),
          Container(
            padding: EdgeInsets.only(left: 50, top: 30, right: 20),
            width: MediaQuery.of(context).size.width,
            height: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                    top: Radius.elliptical(
                        MediaQuery.of(context).size.width, 150)),
                color: Colors.grey[800],
                boxShadow: [
                  BoxShadow(
                      blurRadius: 5, color: Colors.black, offset: Offset(5, 5))
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "SubTotal :",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "₹",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      Total.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "Taxes :",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Text(
                      "₹ ${((Total * 5 / 100)).toString()}",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "Total :",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "₹",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      " ${((Total) + (Total * 5 / 100)).toString()}",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Spacer(),
                    Container(
                      alignment: Alignment.center,
                      width: 100,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(20)),
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor: Colors.grey,
                                  title: Text(
                                    "Successfully Completed",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  actions: [
                                    Center(
                                        child: Icon(
                                      Icons.done,
                                      size: 50,
                                      color: const Color.fromARGB(
                                          133, 57, 238, 63),
                                    ))
                                  ],
                                );
                              });
                        },
                        child: Text(
                          "To Pay",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
