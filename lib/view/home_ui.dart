import 'package:flutter/material.dart';
import 'package:flutter_thai_hotline_app/view/about_ui.dart';
import 'package:flutter_thai_hotline_app/view/sub_a_home_ui.dart';
import 'package:flutter_thai_hotline_app/view/sub_b_home_ui.dart';
import 'package:flutter_thai_hotline_app/view/sub_c_home_ui.dart';
import 'package:flutter_thai_hotline_app/view/sub_d_home_ui.dart';

class HomeUi extends StatefulWidget {
  const HomeUi({super.key});

  @override
  State<HomeUi> createState() => _HomeUiState();
}

class _HomeUiState extends State<HomeUi> {
  // สร้างตัวแปรเก็บหมายเลข index เพื่อเอาไปใช้กับ barItem
  int selectedIndex = 1;

  // สร้างตัวแปรเก็บหน้าจอย่อยที่จะเอามาใช้กับ body
  List subPage = [
    SubAHomeUi(),
    SubBHomeUi(),
    SubCHomeUi(),
    SubDHomeUi(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ส่วนของ AppBar ----
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 35, 14, 109),
        title: const Text(
          'สายด่วน THAILAND',
          style: TextStyle(
            color: Colors.white, // ตัวอักษรสีขาว
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutUI()),
              );
            },
          ),
        ],
      ),
      body: subPage[selectedIndex],
      // ส่วนของ BottomNavigationBar ----
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.grey[400],
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/travel.png',
              width: 24,
              height: 24,
              color: Colors.grey[400],
            ),
            activeIcon: Image.asset(
              'assets/images/travel.png',
              width: 24,
              height: 24,
            ),
            label: 'การเดินทาง',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/emergency.png',
              width: 24,
              height: 24,
              color: Colors.grey[400],
            ),
            activeIcon: Image.asset(
              'assets/images/emergency.png',
              width: 24,
              height: 24,
            ),
            label: 'อุบัติเหตุ - ฉุกเฉิน',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/bank.png',
              width: 24,
              height: 24,
              color: Colors.grey[400],
            ),
            activeIcon: Image.asset(
              'assets/images/bank.png',
              width: 24,
              height: 24,
            ),
            label: 'ธนาคาร',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/utilities.png',
              width: 24,
              height: 24,
              color: Colors.grey[400],
            ),
            activeIcon: Image.asset(
              'assets/images/utilities.png',
              width: 24,
              height: 24,
            ),
            label: 'สาธารณูปโภค',
          ),
        ],
      ),
    );
  }
}
