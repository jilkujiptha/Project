import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 190, 42, 31),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: Drawer(),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.only(left: 20),
            margin: EdgeInsets.only(left: 30, right: 30),
            width: MediaQuery.of(context).size.width,
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 10, offset: Offset(5, 5), color: Colors.grey)
                ]),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Search...",
                hintStyle: TextStyle(color: Colors.black, fontSize: 20),
                suffixIcon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 2,
                itemBuilder: (Context, index) {
                  return Container(
                    margin: EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width,
                    height: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              offset: Offset(5, 5),
                              color: Colors.grey)
                        ]),
                  );
                }),
          )
        ],
      ),
    );
  }
}
