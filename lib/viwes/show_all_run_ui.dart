// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_tun_tracker_app/viwes/add_run_ui.dart';

class allUI extends StatefulWidget {
  const allUI({super.key});

  @override
  State<allUI> createState() => _allUIState();
}

class _allUIState extends State<allUI> {
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //เปิดไป addrunui
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => addrunui(),
            ),
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Color.fromARGB(
          255,
          5,
          1,
          80,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      //ส่วนของ body
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 50),
            Image.asset('assets/images/logo.png',
            width: MediaQuery.of(context).size.width * 0.355,
            height: MediaQuery.of(context).size.height * 0.355,
            fit: BoxFit.cover,
            ),
            Text(
              'วิ่งกันเถอะ',
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.0325,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
