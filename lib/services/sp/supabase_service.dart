//ไฟล์นี้จะประกอบไปด้วยโค้ดคำสั่งต่างๆ กับ supabase


import 'package:flutter_tun_tracker_app/models/Run.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  //สำคัญมากๆ ต้องสร้าง instance/objext/ตัวแทน ที่ทำงานกับ supabase
  final supabase = Supabase.instance.client;

  //ต่อจากนี้จะเป็นส่วนการทำงานกับเมธอตดต่างๆ ที่เกี่ยวกับ supabase
  // เมธอตอัปโหลดไฟล์รไปยัง bucket ของ supabase
  Future<String> uploadImageFile(XFile xfile) async {

    //ตั้งชื่อไฟล์ไม่ให้ซ้ำกันเวลาอยู่ใน bucket ของ supabase

    final newFileName = '${DateTime.now().millisecondsSinceEpoch}_${xfile.name}';

    //upload ไฟล์ไปยัง bucket ของ supabase

    await supabase.storage.from('run_bk').uploadBinary(
      newFileName,
      await xfile.readAsBytes(),
      fileOptions: FileOptions( contentType: xfile.mimeType),
    );
  
    //คือค่าที่อยู่ของไฟล์ที่อัปโหลดไปยัง bucket เพื่อเอาไปบันทึกลง table

    return supabase.storage.from('run_bk').getPublicUrl(newFileName);
  }
  //เมธอตบันทึกข้อมูลลง table ที่อยู่ใน datebase ของ supabase
  Future<void> insertRun(Run run) async {
    await supabase.from('run_tb').insert(run.toJson());
  }
    
}