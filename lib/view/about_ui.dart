import 'package:flutter/material.dart';

class AboutUI extends StatefulWidget {
  const AboutUI({super.key});

  @override
  State<AboutUI> createState() => _AboutUIState();
}

class _AboutUIState extends State<AboutUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 35, 14, 109),
        title: const Text('สายด่วน THAILAND',
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 30),
              const Text('ผู้จัดทำ',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              // ส่วนของโลโก้มหาวิทยาลัย
              Image.asset('assets/images/SAU.png', width: 180),
              const SizedBox(height: 20),
              const Text('มหาวิทยาลัยเอเชียอาคเนย์',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 50),
              // ส่วนของรูปนักศึกษา
              CircleAvatar(
                radius: 60,
                backgroundColor: Colors.grey,
                backgroundImage: AssetImage('assets/images/ing.jpg'),
              ),
              const SizedBox(height: 35),
              // ข้อมูลนักศึกษา
              const Text('รหัสนักศึกษา : 6852D10028',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              const Text('นางสาว รุจิรดา หงษ์สิงห์ทอง',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              const Text('Email : s6852d10028@sau.ac.th',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              const Text('สาขาวิชา : เทคโนโลยีดิจิทัลและนวัตกรรม',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              const Text('คณะ : ศิลปศาสตร์และวิทยาศาสตร์',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
