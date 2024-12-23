import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<dynamic> data = [];

  final _Flip = Hive.box("mybox");
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addData();
  }

  void addData() {
    data = _Flip.get("2");
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "My Cart",
            style: TextStyle(fontSize: 20),
          ),
        ),
        body: Expanded(
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        blurRadius: 10,
                        color: Colors.grey,
                        offset: Offset(5, 5))
                  ]),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 30, left: 10),
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey)),
                          child: Image.network(
                            data[index]["images"][0],
                            fit: BoxFit.contain,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 20, left: 10),
                              child: Text(
                                data[index]["title"],
                                style: TextStyle(
                                    fontSize: 13,
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                SizedBox(width: 9),
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
                                      color: const Color.fromARGB(
                                          255, 7, 132, 235)),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                SizedBox(width: 9),
                                Icon(
                                  Icons.arrow_downward,
                                  size: 30,
                                  color: Colors.green,
                                ),
                                Text(
                                  data[index]["discountPercentage"].toString(),
                                  style: TextStyle(
                                      color:
                                          const Color.fromARGB(255, 2, 99, 5),
                                      fontSize: 20),
                                ),
                                Text(
                                  "%",
                                  style: TextStyle(
                                      color:
                                          const Color.fromARGB(255, 2, 99, 5),
                                      fontSize: 25),
                                ),
                                SizedBox(
                                  width: 20,
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
                                  width: 80,
                                  height: 30,
                                  child: Text(
                                      "\$${(data[index]["price"] - (data[index]["price"] * (data[index]["discountPercentage"] / 100))).toString()}",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                )
                              ],
                            ),
                            SizedBox(height: 9),
                            Row(
                              children: [
                                SizedBox(width: 20),
                                Text(
                                    data[index]["availabilityStatus"]
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.pink[800])),
                                Text(". Order now.",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.pink[800]))
                              ],
                            ),
                            SizedBox(height: 10),
                            Container(
                              width: MediaQuery.of(context).size.width * .5,
                              height: 36,
                              child: Center(
                                  child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          data.removeAt(index);
                                          // Navigator.pop(context);
                                        });
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                backgroundColor: Colors.grey,
                                                title: Text(
                                                  "Successfully Completed",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                        Text(
                                          "To Pay",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        );
                                      },
                                      child: Text(
                                        "BUY NOW",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ))),
                            ),
                          ],
                        )
                      ]));
            },
          ),
        ));
  }
}
