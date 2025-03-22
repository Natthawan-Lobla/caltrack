import 'package:flutter/material.dart';
import 'user_info.dart';

class GenderScreen extends StatelessWidget {
  const GenderScreen({super.key});

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Color(0xFFFDF1DC)], // ปรับสีให้เหมือนดีไซน์
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Welcome",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 20),

            // ใช้ Row เพื่อให้รูปภาพอยู่ข้างกัน
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/girl.png", height: 150),
                const SizedBox(width: 20), // ระยะห่างระหว่างรูป
                Image.asset("assets/images/boy.png", height: 150),
              ],
            ),

            const SizedBox(height: 20), // เว้นระยะระหว่างรูปกับปุ่มเพศ

            // ปุ่มเลือกเพศ
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _genderButton(Icons.female),
                const SizedBox(width: 20),
                _genderButton(Icons.male),
              ],
            ),

            const SizedBox(height: 20), // เว้นระยะระหว่างปุ่มเพศกับปุ่ม Next

            // ปุ่ม Next
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const UserInfoScreen()),
                );
              },
              child: const Text("Next"),
            ),
          ],
        ),
      ),
    );
  }

  // Widget สำหรับปุ่มเลือกเพศ
  Widget _genderButton(IconData icon) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(20),
      ),
      onPressed: () {},
      child: Icon(icon, size: 30),
    );
  }
}