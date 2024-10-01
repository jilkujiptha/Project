import 'package:flutter/material.dart';

class ShoPage extends StatefulWidget {
  const ShoPage({super.key});

  @override
  State<ShoPage> createState() => _ShoPageState();
}

class _ShoPageState extends State<ShoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[900],
        title: Center(
          child: Text(
            "MOKA",
            style: TextStyle(
                fontFamily: "Schyler",
                color: const Color.fromARGB(255, 255, 170, 59)),
          ),
        ),
      ),
      body: Container(child: ListView.builder(itemBuilder: (context, index) {
        return Card(
        );
      })),
    );
  }
}
