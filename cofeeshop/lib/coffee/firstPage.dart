import 'package:cofeeshop/coffee/HomePage.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cofeeShop();
  }

  Future<void> cofeeShop() async {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[900],
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // margin: EdgeInsets.only(left: 100),
              alignment: Alignment.bottomRight,
              width: MediaQuery.of(context).size.width,
              height: 300,
              child: Stack(
                children: [
                  Center(child: Image.asset("./images/pngwing.com.png")),
                  Center(
                    child: Text(
                      "MOKA",
                      style: TextStyle(
                          fontFamily: "edu",
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
                          fontFamily: "edu",
                          color: const Color.fromARGB(255, 255, 170, 59),
                          fontSize: 25),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
