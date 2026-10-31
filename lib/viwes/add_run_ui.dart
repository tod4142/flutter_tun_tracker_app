// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class addrunui extends StatefulWidget {
  const addrunui({super.key});

  @override
  State<addrunui> createState() => _addrunuiState();
}

class _addrunuiState extends State<addrunui> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 5, 1, 80),
        title: Text(
          "Run Tracker",
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 50,
            left: 50,
            right: 45,
            bottom: 245,
          ),
          child: Center(
            child: Column(
              children: [
                Icon(
                  Icons.add_a_photo,
                  size: MediaQuery.of(context).size.height * 0.245,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 30,
                ),
                //ใส่ข้อมูลต่างๆ
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "วิ่งที่ไหน",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.025,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "วิ่งที่ไหน",
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "วิ่งกับใคร",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.025,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "เช่น เพื่อน 3 คน, แฟน หรือ อื่นๆ",
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "ระยะทาง",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.025,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "เช่น 1, 5, 11 หรือ อื่นๆ",
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                //ปุ้มกดบันทึกข้อมูล
                ElevatedButton(
                  onPressed: () {},
                  child: Text("บันทึกข้อมูล",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.025,
                    color: Colors.white,
                  ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                  ),
                  ),
                ),
                SizedBox(height: 30,),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("ยกเลิก",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.025,
                    color: Colors.white,
                  ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                  ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
