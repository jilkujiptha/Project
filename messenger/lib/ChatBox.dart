import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ChatBox extends StatefulWidget {
  const ChatBox({super.key});

  @override
  State<ChatBox> createState() => _ChatBoxState();
}

class _ChatBoxState extends State<ChatBox> {
  final _message = Hive.box("mybox");

  TextEditingController Message = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 6, 12, 17),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white),
        title: Center(
            child: Text(
          "ChatBox",
          style: TextStyle(color: Colors.white),
        )),
      ),
      body: Column(
        children: [
          Expanded(
            child: Text("Chat"),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextField(
                    controller: Message,
                    decoration: InputDecoration(
                      hintText: "Message",
                      hintStyle: TextStyle(color: Colors.white),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: const Color.fromARGB(255, 52, 100, 189),
                          ),
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ),
              ),
              MaterialButton(
                onPressed: () {},
                child: Container(
                  width: 60,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: const Color.fromARGB(255, 52, 100, 189),
                  ),
                  child: Icon(
                    Icons.send,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
