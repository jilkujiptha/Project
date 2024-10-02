import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final _coffee=Hive.box("mybox");
  List  ls=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readData();
  }

  void readData(){
    if(_coffee.get("1")!=null){
      ls=_coffee.get("1");
    }
    else{
      print(ls);
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
            "Its a Great Day for Coffee",
            style: TextStyle(
              fontFamily: "Pro",
              color: const Color.fromARGB(255, 255, 170, 59),
              fontSize: 25,
            ),
          ),
          SizedBox(height: 15,),
          Expanded(
            child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context,index){
                return Container(
                  margin: EdgeInsets.only(bottom: 5, top: 5,left: 15,right: 15),
                        padding: EdgeInsets.all(15),
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
                child: Row(
                  children: [
                    
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}