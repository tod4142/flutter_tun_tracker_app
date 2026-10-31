// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_tun_tracker_app/viwes/show_all_run_ui.dart';

class splashui extends StatefulWidget {
  const splashui({super.key});

  @override
  State<splashui> createState() => _splashuiState();
}

class _splashuiState extends State<splashui> {

  void initState() {
    // delay หน้าจอ 3 วิ แล้วเปิดไปหน้ิา ShowAllRunUI() แบบย้อนกลับไม่ได้
    Future.delayed(
      // เวลาดีเลย์
      Duration(
        seconds: 3,
      ),
      //เมื่อครบเวลา เปิดไปหน้ิา ShowAllRunUI() แบบย้อนกลับไม่ได้
      (){
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => allUI(),
          ),
        );
      }
    );
 
    super.initState();
  }
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255,5,1,80),
      body: Stack(
        children:[
        Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo.png',
              width: MediaQuery.of(context).size.width*0.45,
              height: MediaQuery.of(context).size.height*0.45,
              fit: BoxFit.cover,
              ),
              Text('Run tracker',
              style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.height*0.038,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic
              ),
              ),
              SizedBox(
                height: 50.0,
              ),
              CircularProgressIndicator(
                color: Colors.white,
              ),
            ],
          )
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('Coppyright © 2026 RUN TRACKER',
              style: TextStyle(
                color:const Color.fromARGB(158,153,152,152),
                fontSize: MediaQuery.of(context).size.height*0.02,
              ),
              ),
              Text('Created by NinniN SAU TEAM',
              style: TextStyle(
                color: const Color.fromARGB(158,153,152,152),
                fontSize: MediaQuery.of(context).size.height*0.02,
              ),
              )
            ],
          ),
        )
        ],
      )
    );
  }
}