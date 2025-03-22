import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // ใช้สำหรับจัดรูปแบบวันที่

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ดึงวันที่ปัจจุบัน
    String currentDate = DateFormat("d/M/yyyy").format(DateTime.now());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          currentDate, // แสดงวันที่จริง
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        color: const Color(0xFFFDF1DC), // สีพื้นหลังเบจ
        child: ListView(
          children: [
            buildMealSection("Breakfast"),
            buildMealSection("Lunch"),
            buildMealSection("Dinner"),
          ],
        ),
      ),
    );
  }

  Widget buildMealSection(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          color: Colors.grey[300], // สีเทาอ่อนหัวข้อ
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
        buildMealItem(),
        buildMealItem(),
        buildMealItem(),
      ],
    );
  }

  Widget buildMealItem() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      color: Color(0xFFFDF1DC), // สีพื้นหลังเหมือนรูป
      child: Column(
        children: [
          ListTile(
            leading: Image.asset("assets/images/food.png"), // ไอคอนอาหาร
            title: const Text("kcal", style: TextStyle(color: Colors.black87)),
            trailing: IconButton(
              icon: const Icon(Icons.cancel, color: Colors.grey),
              onPressed: () {
                // เพิ่มฟังก์ชันลบได้ที่นี่
              },
            ),
          ),
          const Divider(height: 1, color: Colors.grey), // เส้นแบ่ง
        ],
      ),
    );
  }
}
