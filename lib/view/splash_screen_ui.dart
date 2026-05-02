import 'package:flutter/material.dart';
import 'package:flutter_thai_hotline_app/view/home_ui.dart';

class SplashScreenUi extends StatefulWidget {
  const SplashScreenUi({super.key});

  @override
  State<SplashScreenUi> createState() => _SplashScreenUiState();
}

class _SplashScreenUiState extends State<SplashScreenUi> {
  @override
  void initState() {
    // หน่วงเวลาหน้าจอ 3 วิ แล้วเปิดไปหน้า HomeUi แบบย้อนกลับไม่ได้
    Future.delayed(
        // เวลาที่จะหน่วง
        Duration(seconds: 3),
        // พอครบเวลาที่หน่วยแล้ว จะให้ทำอะไร
        () {
      // เปิดไปหน้า HomeUi แบบย้อนกลับไม่ได้
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeUi(),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // เอา backgroundColor เดิมออก
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: 130,
                  height: 130,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 20),
                const Text(
                  'THAI HOTLINE APP',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  'สายด่วน',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 40),
                const CircularProgressIndicator(
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
