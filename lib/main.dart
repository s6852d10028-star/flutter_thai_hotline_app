import 'package:flutter/material.dart';
import 'package:flutter_thai_hotline_app/view/splash_screen_ui.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    const FlutterThaiHotlineApp(), // ใส่ const เพื่อ performance ที่ดีขึ้น
  );
}

class FlutterThaiHotlineApp extends StatefulWidget {
  const FlutterThaiHotlineApp({super.key});

  @override
  State<FlutterThaiHotlineApp> createState() => _FlutterThaiHotlineAppState();
}

class _FlutterThaiHotlineAppState extends State<FlutterThaiHotlineApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'THAI HOTLINE APP',
      // ตรวจสอบว่าในไฟล์ splash_screen_ui.dart สะกด SplashScreenUI แบบนี้หรือไม่
      home: const SplashScreenUi(),
      theme: ThemeData(
        useMaterial3: true, // แนะนำให้เปิดใช้สำหรับ Flutter เวอร์ชั่นใหม่ๆ
        textTheme: GoogleFonts.kanitTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
    );
  }
}
