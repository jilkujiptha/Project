import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ShoPage extends StatefulWidget {
  const ShoPage({super.key});

  @override
  State<ShoPage> createState() => _ShoPageState();
}

class _ShoPageState extends State<ShoPage> {
  final _coffee = Hive.box("mybox");
  List cart = [];
  List ls = [
    {
      "name": "Caffe Americano",
      "price": 250,
      "image": "./images/america.png",
      "qty": 0
    },
    {
      "name": "Cappuccino",
      "price": 150,
      "image": "./images/capicciano.png",
      "qty": 0
    },
    {
      "name": "cold brew malt",
      "price": 200,
      "image": "./images/coldbrew.png",
      "qty": 0
    },
    {
      "name": "Cortado",
      "price": 300,
      "image": "./images/cortado.png",
      "qty": 0
    },
    {
      "name": "Flat White",
      "price": 350,
      "image": "./images/flatwhite.png",
      "qty": 0
    },
    {
      "name": "Caffe Latte",
      "price": 200,
      "image": "./images/lattte.png",
      "qty": 0
    },
    {
      "name": "Caramel Macchiato",
      "price": 250,
      "image": "./images/macchiatto.png",
      "qty": 0
    },
    {
      "name": "Caffè mocha",
      "price": 300,
      "image": "./images/moccha.png",
      "qty": 0
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
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
            "Its a Great Day for Coffee",
            style: TextStyle(
              fontFamily: "Pro",
              color: const Color.fromARGB(255, 255, 170, 59),
              fontSize: 25,
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 2 / 3,
                  crossAxisCount: 2),
              itemCount: ls.length,
              padding: EdgeInsets.all(10),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey[800],
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 5,
                            color: Colors.black,
                            offset: Offset(5, 5))
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Image.asset(
                          ls[index]["image"],
                          width: 150,
                          height: 150,
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.only(left: 15),
                          child: Text(
                            ls[index]["name"],
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          )),
                      SizedBox(height: 10),
                      Container(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          "Best Coffee",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 15),
                            child: Text(
                              "₹${ls[index]["price"]}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 15),
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: const Color.fromARGB(255, 255, 170, 59)),
                            child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    ls[index]["qty"]++;
                                    if (ls[index]["qty"] > 1) {
                                      ls[index]["qty"]--;
                                    } else {
                                      cart.add(ls[index]);
                                    }
                                    print(_coffee.get("1"));
                                    _coffee.put("1", cart);
                                  });
                                },
                                icon: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                )),
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
