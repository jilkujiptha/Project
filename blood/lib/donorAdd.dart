import 'package:flutter/material.dart';

class DonorAdd extends StatefulWidget {
  const DonorAdd({super.key});

  @override
  State<DonorAdd> createState() => _DonorAddState();
}

class _DonorAddState extends State<DonorAdd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Registration"),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width ,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            SizedBox(
              height: 15,
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
                        blurRadius: 5, offset: Offset(5, 5), color: Colors.grey)
                  ]),
              child: TextField(
                // controller: name,
                decoration: InputDecoration(
                    hintText: "Full Name",
                    hintStyle: TextStyle(color: Colors.black),
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
                        blurRadius: 5, offset: Offset(5, 5), color: Colors.grey)
                  ]),
              child: TextField(
                // controller: age,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Age",
                    hintStyle: TextStyle(color: Colors.black),
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
                        blurRadius: 5, offset: Offset(5, 5), color: Colors.grey)
                  ]),
              child: TextField(
                // controller: phone,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Mobile Number",
                    hintStyle: TextStyle(color: Colors.black),
                    border: InputBorder.none),
              ),
            ),
            SizedBox(
              height: 30,
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
                      blurRadius: 5, offset: Offset(5, 5), color: Colors.grey)
                ],
              ),
              child: TextField(
                // controller: phone,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Blood group",
                    hintStyle: TextStyle(color: Colors.black),
                    border: InputBorder.none),
              ),
            ),
            SizedBox(height: 30),
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
                        blurRadius: 5, offset: Offset(5, 5), color: Colors.grey)
                  ]),
              child: TextField(
                // controller: place,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    hintText: "Location",
                    hintStyle: TextStyle(color: Colors.black),
                    border: InputBorder.none),
              ),
            ),
            SizedBox(
              height: 30,
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
                        blurRadius: 5, offset: Offset(5, 5), color: Colors.grey)
                  ]),
              child: TextField(
                keyboardType: TextInputType.datetime,
                // controller: dob,
                decoration: InputDecoration(
                    hintText: "DOB (yyyy mm dd)",
                    hintStyle: TextStyle(color: Colors.black),
                    border: InputBorder.none),
              ),
            ),

            SizedBox(height: 30),
            Container(
              margin: EdgeInsets.only(
                left: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   children: [
                  //     Checkbox(
                  //         activeColor: Colors.red,
                  //         checkColor: Colors.white,
                  //         value: _isChecked,
                  //         onChanged: (bool? value) {
                  //           setState(() {
                  //             _isChecked = value!;
                  //           });
                  //         }),
                  //     Text(
                  //       "I agree to Donate blood",
                  //       style: TextStyle(fontSize: 15, color: Colors.red[900]),
                  //     )
                  //   ],
                  // )
                ],
              ),
            ),
            // SizedBox(
            //   height: 20,
            // ),
            // Row(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     Container(
            //       child: TextButton(
            //         onPressed: () {},
            //         child: Text(
            //           "CANCEL",
            //           style: TextStyle(color: Colors.red[900]),
            //         ),
            //         style: TextButton.styleFrom(
            //           backgroundColor: Colors.white,
            //         ),
            //       ),
            //     ),
            //     Spacer(),
            //     TextButton(
            //       onPressed: () {
            //         setState(() {
            //           // birthDate();
            //         });
            //         // Navigator.pushNamed(context, "/secondPage");
            //       },
            //       child: Text("SUBMIT",
            //           style: TextStyle(color: Colors.red[900])),
            //       style: TextButton.styleFrom(
            //           backgroundColor: Colors.white,
            //           shadowColor: Colors.grey[600]),
            //     )
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
