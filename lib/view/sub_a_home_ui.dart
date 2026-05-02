import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SubAHomeUi extends StatefulWidget {
  const SubAHomeUi({super.key});

  @override
  State<SubAHomeUi> createState() => _SubAHomeUiState();
}

class _SubAHomeUiState extends State<SubAHomeUi> {
  final List<Map<String, String>> hotlines = [
    {
      'title': 'ข้อมูลจราจร',
      'number': '1197',
      'image': 'assets/images/1197.png'
    },
    {
      'title': 'ตำรวจทางหลวง',
      'number': '1193',
      'image': 'assets/images/1193.png'
    },
    {
      'title': 'ตำรวจท่องเที่ยว',
      'number': '1155',
      'image': 'assets/images/1155.png'
    },
    {
      'title': 'เส้นทางบนทางด่วน',
      'number': '1543',
      'image': 'assets/images/1543.png'
    },
    {'title': 'ขสมก.', 'number': '1348', 'image': 'assets/images/1348.png'},
    {'title': 'บขส', 'number': '1490', 'image': 'assets/images/1490.png'},
    {
      'title': 'กรมทางหลวง',
      'number': '1586',
      'image': 'assets/images/1586.png'
    },
    {
      'title': 'การรถไฟแห่งประเทศไทย',
      'number': '1690',
      'image': 'assets/images/1690.png'
    },
    {
      'title': 'กรมทางหลวงชนบท',
      'number': '1146',
      'image': 'assets/images/1146.png'
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
              const Text('การเดินทาง',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 30),
              Image.asset(
                'assets/images/travel01.jpg',
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
