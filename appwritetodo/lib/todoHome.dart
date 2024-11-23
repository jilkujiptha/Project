import 'package:appwritrtodo/services/Todo.dart';
import 'package:appwritrtodo/services/appWriteServices.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController add = TextEditingController();
  List? _tasks;
  late appWriteServices _services;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _services = appWriteServices();
    _loadTask();
    _tasks = [];
  }

  Future<void> _addTask() async {
    final task = add.text;

    if (task.isNotEmpty) {
      try {
        await _services.addTask(task);
        add.clear();
      } catch (e) {
        print(e);
      }
    }
  }

  Future<void> _loadTask() async {
    try {
      final tasks = await _services.getTasks();
      setState(() {
        _tasks = tasks.map((e) => Task.formDocument(e)).toList();
      });
      print(".........................................");
      print(_tasks);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      // appBar: AppBar(
      //   backgroundColor: Colors.grey[900],
      // ),
      body: Expanded(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 30, right: 10),
                  padding: EdgeInsets.only(left: 30),
                  width: MediaQuery.of(context).size.width * .7,
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: add,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Type something..."),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _addTask();
                  },
                  child: Container(
                    width: 70,
                    height: 60,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.green),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        "Add",
                        style: TextStyle(color: Colors.green, fontSize: 20),
                      ),
                    ),
                  ),
                )
              ],
            ),
            ListView.builder(
                itemCount: _tasks!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_tasks![index].tasks),
                  );
                })
          ],
        ),
      ),
    );
  }
}
