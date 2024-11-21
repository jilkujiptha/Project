import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:messenger/Provider/changeNotifier.dart';
import 'package:provider/provider.dart';

class UserDisplay extends StatefulWidget {
  const UserDisplay({super.key});

  @override
  State<UserDisplay> createState() => _UserDisplayState();
}

class _UserDisplayState extends State<UserDisplay> {
  List<Map<String, dynamic>> userList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUsers();
  }

  final _message = Hive.box("mybox");

  void getUsers() async {
    CollectionReference users =
        FirebaseFirestore.instance.collection("messenger");
    QuerySnapshot querySnapshot = await users.get();
    setState(() {
      userList = querySnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    });
    print(userList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 6, 12, 17),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 6, 12, 17),
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            "Select a contact",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: userList.isEmpty
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: userList.length,
                itemBuilder: (context, Index) {
                  var user = userList[Index];
                  return ListTile(
                    title: Text(
                      user["username"] ?? "No User Name",
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      print("Tapped on ${user["userid"]}");
                      Provider.of<UserPrivider>(context, listen: false)
                          .setUid(user["userid"] ?? '');
                      var id = {
                        "uid": user["userid"],
                        "username": user["username"]
                      };
                      _message.put("receiver", id);
                      print(_message.get("receiver"));
                      Navigator.pushReplacementNamed(context, "chatbox");
                      print(Provider.of<UserPrivider>(context, listen: false)
                          .uid);
                    },
                  );
                }));
  }
}
