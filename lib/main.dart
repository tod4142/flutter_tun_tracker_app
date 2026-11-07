import 'package:flutter/material.dart';
import 'package:flutter_tun_tracker_app/viwes/splash_screen_ui.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  //------------โค้ดสำหรับติดต่อกับ supabase----------------

  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url:'https://wyvclagmsjleqyexwfhf.supabase.co', // ใส่ url ของ supabase ที่เราสร้างขึ้น
    publishableKey:'sb_publishable_H5DAhp_RHfC2wJZhv6T3wQ_i_Ch-EIM', // ใส่ publicKey ของ supabase ที่เราสร้างขึ้น
  );


//=======================================================

  runApp(FlutterRunTrackerApp());
}

class FlutterRunTrackerApp extends StatefulWidget {
  const FlutterRunTrackerApp({super.key});

  @override
  State<FlutterRunTrackerApp> createState() => _FlutterRunTrackerAppState();
}

class _FlutterRunTrackerAppState extends State<FlutterRunTrackerApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: splashui(),
      theme: ThemeData(
         textTheme: ThemeData.light().textTheme.apply(
              fontFamily: GoogleFonts.kanit().fontFamily,
              fontFamilyFallback: GoogleFonts.kanit().fontFamilyFallback,
            ),
      ),
    );
  }
}