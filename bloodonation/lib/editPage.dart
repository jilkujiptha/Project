import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;

class ForthPage extends StatefulWidget {
  const ForthPage({super.key});

  @override
  State<ForthPage> createState() => _ForthPageState();
}

class _ForthPageState extends State<ForthPage> {
  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController place = TextEditingController();
  String? group;
  String? id;
  String? _isSelected;
  bool _isChecked = false;
  Map mp={};
  final List<String> groups = [
    "A+",
    "A-",
    "B+",
    "B-",
    "AB+",
    "AB-",
    "O+",
    "O-"
  ];
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  void getData()async{
    var resp=await http.get(Uri.parse("http://jandk.tech/api/getdonor/$id"));
    if(id !=null){
    var resp=await http.get(Uri.parse("http://jandk.tech/api/getdonor/$id"));
    mp=jsonDecode(resp.body);
    }
    setState(() {
      name.text=mp["name"];
      age.text=mp["age"].toString();
      phone.text=mp["phone"].toString();
      dob.text=mp["dob"];
      group=mp["blood_group"];
      place.text=mp["place"];
    });
  }


  void birthDate() {
    RegExp reg = RegExp(r'(\d{4})-(0\d||1[0-2])-([0-2]\d||3[0-1])$');
    _isChecked == false
        ? showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(
                  "Error!",
                  style: TextStyle(color: Colors.red),
                ),
                content: Text("Please agree the terms and conditions"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Cancel"))
                ],
              );
            })
        : reg.hasMatch(dob.text)
            ? saveData()
            : showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(
                      "Incorrect!",
                      style: TextStyle(color: Colors.red),
                    ),
                    content: Text("Please enter valid date"),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Cancel"))
                    ],
                  );
                });
  }

  // void addData() async {
  //   final pref = await SharedPreferences.getInstance();
  //   final res = pref.getString("blood");
  //   try {
  //     List<dynamic> ls = jsonDecode(res!);
  //     ls.add({
  //       "name": name.text,
  //       "age": age.text,
  //       "number": number.text,
  //       "date": date.text,
  //       "place": place.text,
  //       "blood_group": _isSelected
  //     });
  //     pref.setString("blood", jsonEncode(ls));
  //     print(ls);
  //   } catch (e) {
  //     List<dynamic> ls = [
  //       {
  //         "name": name.text,
  //         "age": age.text,
  //         "number": number.text,
  //         "date": date.text,
  //         "place": place.text,
  //         "blood_group": _isSelected
  //       }
  //     ];
  //     pref.setString("blood", jsonEncode(ls));
  //     print(ls);
  //   }
  //   Navigator.pushNamed(context, "/secondPage");
  // }

  void saveData()async{
   Map map={
      "name":name.text,
      "age":age.text,
      "phone":phone.text,
      "dob":dob.text,
      "place":place.text,
      "blood_group":group
    };
    print(map);
    var resp=await http.put(Uri.parse("http://jandk.tech/api/editdonor/$id"),
    headers: {"Content-Type":"application/json"},
    body: json.encode(map));
    print(resp.statusCode);
    Navigator.pushNamedAndRemoveUntil(context, "/secondPage", (Route route)=>false);
  }

  @override
  Widget build(BuildContext context) {
    id=ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: Text(
            "Donor Registration",
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          iconTheme: IconThemeData(color: Colors.white),
          centerTitle: true,
          backgroundColor: Colors.red[900]),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              width: MediaQuery.of(context).size.width,
              height: 50,
              padding: EdgeInsets.only(left: 15, right: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  // border: Border.all(color: Colors.black),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 5,
                        offset: Offset(5, 5),
                        color: const Color.fromARGB(255, 250, 225, 223))
                  ]),
              child: TextField(
                controller: name,
                decoration: InputDecoration(
                    hintText: "Full Name",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              width: MediaQuery.of(context).size.width,
              height: 50,
              padding: EdgeInsets.only(left: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 5,
                        offset: Offset(5, 5),
                        color: const Color.fromARGB(255, 250, 225, 223))
                  ]),
              child: TextField(
                controller: age,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Age",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none),
              ),
            ),
            SizedBox(
              height: 20,
            ),

            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              width: MediaQuery.of(context).size.width,
              height: 50,
              padding: EdgeInsets.only(left: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 5,
                        offset: Offset(5, 5),
                        color: const Color.fromARGB(255, 250, 225, 223))
                  ]),
              child: TextField(
                controller: phone,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Mobile Number",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // Text("BLOOD GROUP"),
            // SizedBox(
            //   height: 10,
            // ),
            Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                width: MediaQuery.of(context).size.width,
                height: 50,
                padding: EdgeInsets.only(left: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 5,
                          offset: Offset(5, 5),
                          color: const Color.fromARGB(255, 250, 225, 223))
                    ]),
                child: Row(
                  children: [
                    Text(
                      group == null ? "Blood Group" : " $group",
                      style: TextStyle(color: Colors.grey, fontSize: 17),
                    ),
                    Spacer(),
                    DropdownButton(
                        dropdownColor: Colors.white,
                        padding: EdgeInsets.only(right: 16),
                        underline: Container(
                          height: 0,
                        ),
                        items: groups.map((String Group) {
                          return DropdownMenuItem(
                            value: Group,
                            child: Text(
                              Group,
                              style: TextStyle(color: Colors.red[900]),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            group = value;
                          });
                        }),
                  ],
                )),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              width: MediaQuery.of(context).size.width,
              height: 50,
              padding: EdgeInsets.only(left: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 5,
                        offset: Offset(5, 5),
                        color: const Color.fromARGB(255, 250, 225, 223))
                  ]),
              child: TextField(
                controller: place,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    hintText: "Location",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // Text("DOB"),
            // SizedBox(
            //   height: 10,
            // ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              width: MediaQuery.of(context).size.width,
              height: 50,
              padding: EdgeInsets.only(left: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 5,
                        offset: Offset(5, 5),
                        color: const Color.fromARGB(255, 250, 225, 223))
                  ]),
              child: TextField(
                keyboardType: TextInputType.datetime,
                controller: dob,
                decoration: InputDecoration(
                    hintText: "DOB (yyyy mm dd)",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none),
              ),
            ),
          
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.only(
                left: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                          activeColor: Colors.red,
                          checkColor: Colors.white,
                          value: _isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              _isChecked = value!;
                            });
                          }),
                      Text(
                        "I agree to Donate blood",
                        style: TextStyle(fontSize: 15, color: Colors.red[900]),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "CANCEL",
                      style: TextStyle(color: Colors.red[900]),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                  ),
                ),
                Spacer(),
                TextButton(
                  onPressed: () {
                    setState(() {
                      birthDate();
                    });
                    // Navigator.pushNamed(context, "/secondPage");
                  },
                  child:
                      Text("SUBMIT", style: TextStyle(color: Colors.red[900])),
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      shadowColor: Colors.grey[600]),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
