import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Future logout() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          IconButton(onPressed: logout, icon: Icon(Icons.logout)),
          SizedBox(
            width: 10,
          ),
          Container(
            width: 60,
            height: 30,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(100)),
            child: Center(
                child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "add");
              },
              child: Text(
                "Add",
                style: TextStyle(fontSize: 18),
              ),
            )),
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 20),
                  margin: EdgeInsets.only(right: 30),
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            offset: Offset(5, 5),
                            color: Colors.grey)
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
                  height: 20,
                ),
                Text(
                  "View All Donors",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 2,
                itemBuilder: (Context, index) {
                  return Stack(children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "display");
                      },
                      child: Container(
                        padding: EdgeInsets.all(15),
                        margin: EdgeInsets.all(20),
                        width: MediaQuery.of(context).size.width,
                        height: 140,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 10,
                                  offset: Offset(5, 5),
                                  color: Colors.grey)
                            ]),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 2,
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 15),
                              width: 90,
                              height: 90,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey),
                              child: Icon(
                                Icons.person,
                                color: Colors.white,
                                size: 50,
                              ),
                            ),
                            Spacer(),
                            Icon(Icons.call),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(Icons.message)
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 50,
                      child: Container(
                        width: 60,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 190, 42, 31),
                        ),
                      ),
                    ),
                  ]);
                }),
          )
        ],
      ),
    );
  }
}
