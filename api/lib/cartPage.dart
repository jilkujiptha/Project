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
    data = _Flip.get("1");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 247, 252),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 237, 247, 252),
        title: Text("My Cart",style: TextStyle(fontSize: 20),),
      ),
      body: Expanded(
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.white
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20,left: 20),
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey)
                  ),
                  child: Image.network(
                  data[index]["images"][0],
                  fit: BoxFit.contain,
                                ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20,left: 10),
                  child: Text(data[index]["title"],style: TextStyle(fontSize: 17,letterSpacing: 1),)),
                  
              ],
            )
          );
        },),
      )
    );
  }
}