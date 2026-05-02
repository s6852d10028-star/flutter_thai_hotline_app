import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SubBHomeUi extends StatefulWidget {
  const SubBHomeUi({super.key});

  @override
  State<SubBHomeUi> createState() => _SubBHomeUiState();
}

class _SubBHomeUiState extends State<SubBHomeUi> {
  final List<Map<String, String>> hotlines = [
    {
      'title': 'เหตุด่วน เหตุร้าย',
      'number': '191',
      'image': 'assets/images/191.png'
    },
    {
      'title': 'แจ้งไฟไหม้ สัตว์เข้าบ้าน',
      'number': '199',
      'image': 'assets/images/199.png'
    },
    {
      'title': 'สายด่วนรถหาย (ตำรวจแห่งชาติ)',
      'number': '1192',
      'image': 'assets/images/1192.png'
    },
    {
      'title': 'อุบัติเหตุทางน้ำ',
      'number': '1196',
      'image': 'assets/images/1196.png'
    },
    {'title': 'แจ้งคนหาย', 'number': '1300', 'image': 'assets/images/1300.png'},
    {
      'title': 'ศูนย์ปลอดภัยคมนาคม',
      'number': '1356',
      'image': 'assets/images/1356.png'
    },
    {
      'title': 'หน่วยแพทย์กู้ชีพ',
      'number': '1554',
      'image': 'assets/images/1554.png'
    },
    {
      'title': 'ศูนย์เอราวัณ',
      'number': '1646',
      'image': 'assets/images/1646.png'
    },
    {
      'title': 'เจ็บป่วยฉุกเฉิน',
      'number': '1669',
      'image': 'assets/images/1669.png'
    },
  ];

  Future<void> makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F7),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 25),
          child: Column(
            children: [
              const Text('สายด่วน',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const Text('อุบัติเหตุ-เหตุฉุกเฉิน',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 30),
              Image.asset(
                'assets/images/accidents.jpg',
                width: 150,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.image, size: 100),
              ),
              const SizedBox(height: 50),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: hotlines.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 20),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      // ---------------------------------
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          // ignore: deprecated_member_use
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      leading: Container(
                        padding: const EdgeInsets.only(right: 12),
                        decoration: BoxDecoration(
                          border: Border(
                              right: BorderSide(color: Colors.grey[200]!)),
                        ),
                        child: Image.asset(
                          hotlines[index]['image']!,
                          width: 50,
                          height: 50,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.image_outlined,
                                  color: Colors.grey),
                        ),
                      ),
                      title: Text(
                        hotlines[index]['title']!,
                        style: const TextStyle(
                          fontSize: 18, // เพิ่มขนาดฟอนต์
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        hotlines[index]['number']!,
                        style: const TextStyle(
                          fontSize: 16, // เพิ่มขนาดฟอนต์
                          color: Colors.grey,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.phone_outlined,
                        size: 26, // เพิ่มขนาดไอคอน
                        color: Colors.black54,
                      ),
                      onTap: () => makePhoneCall(hotlines[index]['number']!),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
