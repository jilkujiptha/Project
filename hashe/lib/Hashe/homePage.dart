import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        iconTheme: IconThemeData(
          color: const Color.fromARGB(255, 255, 170, 59),
        ),
        title: Center(
          child: Text(
            "HOME",
            style: TextStyle(
                color: const Color.fromARGB(255, 255, 170, 59),
                fontSize: 30,
                fontFamily: "Schyler"),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.bottomRight,
            width: MediaQuery.of(context).size.width,
            height: 300,
            child: Stack(
              children: [
                Center(child: Image.asset("./image/pngwing.com.png")),
                Center(
                  child: Text(
                    "MOKA",
                    style: TextStyle(
                        fontFamily: "Pro",
                        color: const Color.fromARGB(255, 255, 170, 59),
                        fontSize: 60,
                        letterSpacing: 1),
                  ),
                ),
                Positioned(
                  left: 250,
                  top: 180,
                  child: Text(
                    "Love at first sip",
                    style: TextStyle(
                        fontFamily: "Pro",
                        color: const Color.fromARGB(255, 255, 170, 59),
                        fontSize: 25),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
