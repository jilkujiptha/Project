import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future logout() async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Do you want to Logout",
              style: TextStyle(
                color: const Color.fromARGB(255, 52, 100, 189),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Cancel",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 52, 100, 189),
                  ),
                ),
              ),
              TextButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pop(context);
                },
                child: Text(
                  "Logout",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 52, 100, 189),
                  ),
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          Icon(
            Icons.qr_code_scanner,
            color: Colors.white,
          ),
          SizedBox(
            width: 15,
          ),
          Icon(
            Icons.camera_alt_outlined,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
          IconButton(
            onPressed: () {
              logout();
            },
            icon: Icon(
              Icons.logout,
              color: Colors.white,
            ),
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 6, 12, 17),
      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        padding: EdgeInsets.only(left: 20, right: 20),
        width: MediaQuery.of(context).size.width,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromARGB(255, 37, 48, 56),
        ),
        child: TextField(
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Search...",
              hintStyle: TextStyle(color: Colors.black)),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 52, 100, 189),
        onPressed: () {
          Navigator.pushNamed(context, "display");
        },
        child: Icon(
          Icons.message,
          color: const Color.fromARGB(255, 6, 12, 17),
        ),
      ),
    );
  }
}
