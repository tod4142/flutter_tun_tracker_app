import 'package:flutter/material.dart';
import 'package:flutter_tun_tracker_app/viwes/splash_screen_ui.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
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