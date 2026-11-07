// ignore_for_file: sort_child_properties_last, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tun_tracker_app/models/Run.dart';
import 'package:flutter_tun_tracker_app/services/sp/supabase_service.dart';
import 'package:image_picker/image_picker.dart';

class addrunui extends StatefulWidget {
  const addrunui({super.key});

  @override
  State<addrunui> createState() => _addrunuiState();
}

class _addrunuiState extends State<addrunui> {
//ส่วนของโค้ดที่เกี่ยวกับการเปิดกล้องและการเลือกรูปภาพจาก gallery จะอยู่ในส่วนนี้
  Uint8List? imageBytes;
  XFile? imageFile;

  Future<void> selectImagefromCamera() async {
    imageFile = await ImagePicker().pickImage(source: ImageSource.camera,imageQuality: 80);
  if(imageFile != null){
    final byte = await imageFile!.readAsBytes();
    setState(() {
      imageBytes = byte;
    });
  }                     
  }

  Future<void> selectImagefromGallery() async {
    imageFile = await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality: 80);
  if(imageFile != null){
    final byte = await imageFile!.readAsBytes();
    setState(() {
      imageBytes = byte;
    });
  }
  }
//-----------------------------------------------

  String? imageUrl=""; //ตัวแปรเก็บค่าที่อยู่ของไฟล์รูปภาพที่อัปโหลดไปยัง bucket ของ supabase

  //ตัวควบคุม textfield
  TextEditingController runWhereCtrl = TextEditingController();
  TextEditingController runPersonCtrl = TextEditingController();
  TextEditingController runDistanceCtrl = TextEditingController();

  Future<void> UpLoadandSaveData() async {
    //โค้ดอัปโหลดรูปไปยัง bucket และบันทึกข้อมูลลง table
    //ตรวจสอบก่อนว่ามีไฟล์ที่จะอัปโหลดหรือไม่
    if(imageFile != null){
      imageUrl = await SupabaseService().uploadImageFile(imageFile!);  
    } 

    //------------------------------------------------

  //validate ว่าผู้ใช้กรอกข้อมูลครบหรือไม่
  if (runWhereCtrl.text.isEmpty || runPersonCtrl.text.isEmpty || runDistanceCtrl.text.isEmpty) {
    //แสดงข้อความแจ้งเตือนว่ากรอกข้อมูลไม่ครบ
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "กรุณากรอกข้อมูลให้ครบ",
          style: TextStyle(
          color: Colors.white,
        ),
        ),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
      ),
    );
    return;
  }

  //ผ่านการ validate มาได้ก็มาแพ็คข้อมูลเพื่อส่งไปบันทึกลง table ของ supabase
  Run runDate = Run(
    runWhere: runWhereCtrl.text,
    runPerson: runPersonCtrl.text,
    runDistance: int.parse(runDistanceCtrl.text),
    runImageUrl: imageUrl,
  );

  //ส่งข้อมูลไปบันทึกลง table ของ supabase
  await SupabaseService().insertRun(runDate);

  //แสดงข้อความแจ้งเตือนว่าบันทึกข้อมูลเสร็จแล้ว
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        "อัปโหลดและบันทึกข้อมูลเสร็จแล้ว",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.green,
      duration: Duration(seconds: 2),
    ),
  );

  Navigator.pop(context); //ปิดหน้าจอ addrunui() แล้วกลับไปหน้าจอ showallrunui()
  }





  //================================================


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
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
                imageBytes == null
                ? InkWell(onTap: () {
                  //เรียกใช้เมธอต เปิดกล้องหรือเลือกรูปภาพจาก gallery
                  selectImagefromGallery();
                },
                  child: Icon(
                    Icons.add_a_photo,
                    size: MediaQuery.of(context).size.height * 0.245,
                    color: Colors.grey,
                  ),
                )
                : InkWell(onTap: () {
                  //เรียกใช้เมธอต เปิดกล้องหรือเลือกรูปภาพจาก gallery
                  selectImagefromGallery();
                },
                  child: Image.memory(
                    imageBytes!,
                    width: MediaQuery.of(context).size.height * 0.45,
                    height: MediaQuery.of(context).size.height * 0.45,
                    fit: BoxFit.cover,
                  ),
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
                  controller: runWhereCtrl,
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
                  controller: runPersonCtrl,
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
                  controller: runDistanceCtrl,
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
                  onPressed: () {
                    //โค้ดอัปโหลดรูปไปยัง bucket และบันทึกข้อมูลลง table
                    //แต่โค้ดมันยาว เพราะงั้นจะไปทำเป็นเมธอตชื่อ UpLoadandSaveData ไว้ด้านบนแล้วเรียกใช้
                    UpLoadandSaveData();
                  },
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
