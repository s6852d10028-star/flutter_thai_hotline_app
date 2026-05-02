import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SubCHomeUi extends StatefulWidget {
  const SubCHomeUi({super.key});

  @override
  State<SubCHomeUi> createState() => _SubCHomeUiState();
}

class _SubCHomeUiState extends State<SubCHomeUi> {
  final List<Map<String, String>> hotlines = [
    {
      'title': 'ธนาคารกรุงเทพ',
      'number': '1333',
      'image': 'assets/images/1333.png'
    },
    {
      'title': 'ธนาคารออมสิน',
      'number': '1115',
      'image': 'assets/images/1115.png'
    },
    {
      'title': 'ธนาคารกสิกรไทย',
      'number': '02 888 8888',
      'image': 'assets/images/028888888.png'
    },
    {
      'title': 'ธนาคารกรุงไทย',
      'number': '02 111 1111',
      'image': 'assets/images/021111111.png'
    },
    {
      'title': 'ธนาคารกรุงศรี',
      'number': '1572',
      'image': 'assets/images/1572.png'
    },
    {
      'title': 'ธนาคารทีเอ็มบีธนชาติ',
      'number': '1428',
      'image': 'assets/images/1428.png'
    },
    {'title': 'City Bank', 'number': '1588', 'image': 'assets/images/1588.png'},
    {'title': 'Lh Bank', 'number': '1327', 'image': 'assets/images/1327.png'},
    {
      'title': 'ธนาคารอาคารสงเคราะห์',
      'number': '02 645 9000',
      'image': 'assets/images/026459000.png'
    },
    {
      'title': 'ธนาคารไทยพาณิชย์',
      'number': '02 777 7777',
      'image': 'assets/images/027777777.png'
    },
    {
      'title': 'ธนาคารเกียรตินาคินภัทร',
      'number': '02 165 5555',
      'image': 'assets/images/021655555.png'
    },
    {
      'title': 'ธนาคารไทยเครดิต',
      'number': '02 697 5454',
      'image': 'assets/images/026975454.png'
    },
    {
      'title': 'UOB BANK',
      'number': '02 285 1555',
      'image': 'assets/images/022851555.png'
    },
    {
      'title': 'TISCO BANK',
      'number': '02 633 6000',
      'image': 'assets/images/026336000.png'
    },
    {
      'title': 'ธนาคารอิสลามแห่งประเทศไทย',
      'number': '02 204 2766',
      'image': 'assets/images/022042766.png'
    },
    {
      'title': 'ธนาคาร ชีไอเอ็มบี ไทย',
      'number': '02 626 7777',
      'image': 'assets/images/026267777.png'
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
              const Text('ธนาคาร',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 30),
              Image.asset(
                'assets/images/bank01.jpg',
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
