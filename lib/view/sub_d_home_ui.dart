import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SubDHomeUi extends StatefulWidget {
  const SubDHomeUi({super.key});

  @override
  State<SubDHomeUi> createState() => _SubDHomeUiState();
}

class _SubDHomeUiState extends State<SubDHomeUi> {
  final List<Map<String, String>> hotlines = [
    {
      'title': 'ไฟฟ้านครหลวง',
      'number': '1130',
      'image': 'assets/images/1130.png'
    },
    {
      'title': 'ไฟฟ้าส่วนภูมิภาค',
      'number': '1129',
      'image': 'assets/images/1129.png'
    },
    {
      'title': 'ไฟฟ้าฝ่ายผลิต',
      'number': '1416',
      'image': 'assets/images/1416.png'
    },
    {
      'title': 'การประปานครหลวง',
      'number': '1125',
      'image': 'assets/images/1125.png'
    },
    {
      'title': 'การประปาส่วนภูมิภาค',
      'number': '1662',
      'image': 'assets/images/1662.png'
    },
    {'title': 'TRUEMOVE', 'number': '1242', 'image': 'assets/images/1242.png'},
    {'title': 'DTAC', 'number': '1678', 'image': 'assets/images/1678.png'},
    {'title': 'AIS', 'number': '1175', 'image': 'assets/images/1175.jpg'},
    {'title': 'TOT', 'number': '1100', 'image': 'assets/images/1100.png'},
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
              const Text('สาธารณูปโภค',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 30),
              Image.asset(
                'assets/images/utilities01.png',
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
