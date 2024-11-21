import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ChatBox extends StatefulWidget {
  const ChatBox({super.key});

  @override
  State<ChatBox> createState() => _ChatBoxState();
}

class _ChatBoxState extends State<ChatBox> {
  TextEditingController Message = TextEditingController();
  var chat;
  String? sender;
  String? receiver;

  final _message = Hive.box("mybox");
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getChat();
  }

  void getChat() {
    chat = _message.get("receiver");
    print(chat);
    var send = _message.get("sender");
    sender = send["id"];
    print(send);
    receiver = chat["uid"];
    print(receiver);
    print(chat);
  }

  Future<void> sendMessage(
      String sender, String receiver, String message) async {
    await FirebaseFirestore.instance.collection("message").add({
      "sender": sender,
      "receiver": receiver,
      "message": message.trim(),
      "Timestamp": FieldValue.serverTimestamp()
    });
    Message.clear();
  }

  Stream<QuerySnapshot> getMessages(String sender, String receiver) {
    return FirebaseFirestore.instance
        .collection("message")
        .where("sender", whereIn: [sender, receiver])
        .where("receiver", whereIn: [sender, receiver])
        .orderBy("Timestamp", descending: false)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 6, 12, 17),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white),
        title: Center(
            child: Text(
          chat["username"],
          style: TextStyle(color: Colors.white),
        )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.video_chat_outlined,
                color: Colors.white,
                size: 25,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.call,
                color: Colors.white,
                size: 25,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert,
                color: Colors.white,
                size: 25,
              )),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
                stream: getMessages(sender!, receiver!),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasError) {
                    print(snapshot.error);
                    return Center(
                      child: Text(
                        "Something went wrong!",
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }
                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return Center(
                      child: Text(
                        "No message yet!",
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }
                  final message = snapshot.data!.docs;
                  return ListView.builder(
                      itemCount: message.length,
                      itemBuilder: (context, index) {
                        final messageData =
                            message[index].data() as Map<String, dynamic>;
                        print(messageData);
                        final isMe = messageData["sender"] == sender;
                        return Align(
                          alignment: isMe
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: isMe
                                    ? const Color.fromARGB(255, 52, 100, 189)
                                    : Colors.grey[800],
                                borderRadius: BorderRadius.circular(20)),
                            child: Text(
                              messageData["message"],
                              style: TextStyle(
                                  color: isMe ? Colors.black : Colors.white),
                            ),
                          ),
                        );
                      });
                }),
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
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: const Color.fromARGB(255, 52, 100, 189),
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: const Color.fromARGB(255, 52, 100, 189),
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      suffixIcon: IconButton(
                          onPressed: () {}, icon: Icon(Icons.mic_none)),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              MaterialButton(
                onPressed: () {
                  sendMessage(sender!, receiver!, Message.text);
                },
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
